package com.budong.util;

import com.budong.model.dto.BudongsanApartmentDealDTO;
import com.budong.model.interfaces.BudongsanInfoDAO;
import com.google.gson.*;
import com.google.gson.reflect.TypeToken;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import org.json.JSONObject;
import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.*;

@Component
public class DataUpdateUtil {
    private static final Logger log = LoggerFactory.getLogger(DataUpdateUtil.class);

    private final BudongsanInfoDAO dao;

    private final Gson gson;

    private final OkHttpClient client;

    private final Set<String> districtCodeSet;

    private static final String serviceKey =
            "1O44Uic%2FwmxgeiJ1ybbEO2mZCseE7oM%2FpHnCSWmIIG%2BGjNIzLfsUrKSYGy5qzAe4cKKfYvuDYZwv9f9O8%2B6UpQ%3D%3D";

    private static final String hostUrl = "openapi.molit.go.kr";

    private static final int hostPort = 8081;

    private static final String methodPath = "OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTrade";

    private static final String onFailureMsg =
            "<response><header><resultCode>99</resultCode><resultMsg>FAIL</resultMsg></header></response>";

    @Value("classpath:district-code-table.txt")
    private Resource res;

    @Autowired
    public DataUpdateUtil(BudongsanInfoDAO dao, Gson gson, OkHttpClient client) {
        this.dao = dao;
        this.gson = gson;
        this.client = client;
        this.districtCodeSet = new HashSet<>();
    }

    @PostConstruct
    private void initDistrictCodeSet() throws IOException {
        FileInputStream fis = new FileInputStream(res.getFile());
        InputStreamReader isr = new InputStreamReader(fis, StandardCharsets.UTF_8);
        BufferedReader br = new BufferedReader(isr);

        br.lines().forEach(s -> {
            String[] split = s.split("[\\t ]+");
            String fullDistrictCode = split[0];
            String lawd_cd = fullDistrictCode.substring(0, 5);

            districtCodeSet.add(lawd_cd);
        });

        br.close();

        log.debug("DataUpdateUtil instance initalize complete.");
    }

    @Scheduled(fixedRate = 24 * 60 * 60 * 1000)
    public void updateSchedule() throws IOException {
        log.info("Start update Database.");
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int month = Calendar.getInstance().get(Calendar.MONTH);
        String deal_ymd = String.format("%04d%02d", year, month);

        for (String lawd_cd : districtCodeSet) {
            log.debug("lawd_cd << "+lawd_cd);
            log.debug("deal_ymd << "+deal_ymd);

            String dataXML = getDataXML(lawd_cd, deal_ymd);
            JsonObject json = parseJson(dataXML);

            if (checkSuccess(json)) {
                try {
                    List<BudongsanApartmentDealDTO> exportedData = exportItems(json);

                    for(BudongsanApartmentDealDTO dto : exportedData) {
                        dao.updateData(dto);
                    }
                } catch (JsonSyntaxException e) {
                    log.error(e.getMessage());
                }
            } else {
                log.warn("Requested XML data is invalid.");
            }
            log.debug(gson.toJson(json));
        }
        log.info("Database update schedule complete successfully.");
    }

    private String getDataXML(String lawd_cd, String deal_ymd) {
        okhttp3.HttpUrl httpUrl = new okhttp3.HttpUrl.Builder()
                .scheme("http")
                .host(hostUrl)
                .port(hostPort)
                .addPathSegments(methodPath)
                .addEncodedQueryParameter("serviceKey", serviceKey)
                .addQueryParameter("LAWD_CD", lawd_cd)
                .addQueryParameter("DEAL_YMD", deal_ymd)
                .build();

        okhttp3.Request request = new Request.Builder()
                .url(httpUrl)
                .build();

        log.debug("requested URL is " + httpUrl.toString());

        okhttp3.Response response = null;
        try {
            response = client.newCall(request).execute();

            assert response.body() != null;
            return response.body().string();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return onFailureMsg;
    }

    private JsonObject parseJson(String source) {
        JSONObject javaJsonObject = XML.toJSONObject(source);
        JsonParser jsonParser = new JsonParser();

        return (JsonObject) jsonParser.parse(javaJsonObject.toString());
    }

    private Boolean checkSuccess(JsonObject jsonObj) {
        return "00".equals(jsonObj
                .getAsJsonObject("response")
                .getAsJsonObject("header")
                .get("resultCode").getAsString())
                && jsonObj
                .getAsJsonObject("response")
                .getAsJsonObject("body")
                .get("totalCount").getAsInt() != 0;
    }

    private Boolean ifOnlyItem(JsonObject jsonObj) {
        return jsonObj
                .getAsJsonObject("response")
                .getAsJsonObject("body")
                .get("totalCount").getAsInt() == 1;
    }

    private List<BudongsanApartmentDealDTO> exportItems(JsonObject responseData) {
        if (ifOnlyItem(responseData)) {
            JsonObject itemsJson = responseData
                    .getAsJsonObject("response")
                    .getAsJsonObject("body")
                    .getAsJsonObject("items")
                    .getAsJsonObject("item");

            BudongsanApartmentDealDTO item = gson.fromJson(gson.toJson(itemsJson), BudongsanApartmentDealDTO.class);
            List<BudongsanApartmentDealDTO> list = new ArrayList<>();
            list.add(item);

            return list;
        } else {
            JsonArray itemsJson = responseData
                    .getAsJsonObject("response")
                    .getAsJsonObject("body")
                    .getAsJsonObject("items")
                    .getAsJsonArray("item");

            return gson.fromJson(gson.toJson(itemsJson), new TypeToken<ArrayList<BudongsanApartmentDealDTO>>() {
            }.getType());
        }
    }

}
