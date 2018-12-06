package com.budong.controller;

import com.budong.R;
import com.budong.service.interfaces.BudongsanInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Calendar;

@Controller
public class RestFullController {

    private final BudongsanInfoService budongsanInfoService;

    @Autowired
    public RestFullController(BudongsanInfoService budongsanInfoService) {
        this.budongsanInfoService = budongsanInfoService;
    }

    /**
     * 아파트 매매정보를 년단위로 평균을 내어 반환해주는 메소드입니다.
     *
     * @param yearFrom 원하는 범위의 시작 년도
     * @param yearTo   원하는 범위의 끝 년도
     * @return 아파트 매매 년단위 매매정보를 Json 으로 응답
     */
    @RequestMapping(R.rest.apartment_deal_info_avg_by_year)
    @ResponseBody
    public ResponseEntity getApartmentDealInfoAvgByYear(
            @RequestParam int yearFrom,
            @RequestParam int yearTo,
            HttpSession session
    ) {
        if (yearFrom > yearTo) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        } else {
            String requestedRange = String.format("year_avg#%04d~%04d", yearFrom, yearTo);
            String json = (String) session.getAttribute(requestedRange);

            if (json == null) {
                json = budongsanInfoService.getApartmentPriceYearAvgJson(yearFrom, yearTo);
                session.setAttribute(requestedRange, json);
            }

            return ResponseEntity.ok(json);
        }
    }

    @RequestMapping(R.rest.apartment_deal_info_avg_by_year_month)
    @ResponseBody
    public ResponseEntity getApartmentDealPriceAvgByYearMonth(
            @RequestParam int year,
            @RequestParam int monthFrom,
            @RequestParam int monthTo,
            HttpSession session
    ) {
        if (monthFrom > monthTo) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        } else {
            String requestedRange = String.format("year_month_avg#%04d/%02d~%02d", year, monthFrom, monthTo);
            String json = (String) session.getAttribute(requestedRange);

            if (json == null) {
                json = budongsanInfoService.getApartmentPriceYearMonthAvgJson(year, monthFrom, monthTo);
                session.setAttribute(requestedRange, json);
            }

            return ResponseEntity.ok(json);
        }
    }

    @RequestMapping(R.rest.apartment_deal_info_avg_by_year_districtCode)
    @ResponseBody
    public ResponseEntity getApartmentDealPriceAvgByYearDistrictCode(
            @RequestParam int year,
            @RequestParam int districtCode,
            HttpSession session
    ) {
        int nowYear = Calendar.getInstance().get(Calendar.YEAR);
        if ( year < 2007 || nowYear < year) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        } else {
            String requestedRange = String.format("year_districtCode_avg#{districtCode:%05d,year:%04d}", districtCode, year);
            String json = (String) session.getAttribute(requestedRange);

            if(json == null) {
                json = budongsanInfoService.getApartmentPriceYearDistrictCodeAvgJson(districtCode,year);
                session.setAttribute(requestedRange,json);
            }

            return ResponseEntity.ok(json);
        }
    }
}
