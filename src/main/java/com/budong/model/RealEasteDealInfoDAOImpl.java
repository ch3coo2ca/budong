package com.budong.model;

import java.util.List;
import java.util.Vector;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.budong.model.dto.RealEstateAPTDealInfoDTO;
import com.budong.model.interfaces.RealEsateDealInfoDAO;

/**
 * @author S401-07
 *	작성자  : 김준영
 *	getAPTDealInfo() {
 *	  10 아파트 매매  실거래  상세자료  조회
 *    값을  받아와서  RealEstateAPTDealInfoDTO에  넘길것..	
 *  }
 */
@Repository
public class RealEasteDealInfoDAOImpl implements RealEsateDealInfoDAO{

	private static final Logger log = LoggerFactory.getLogger(RealEasteDealInfoDAOImpl.class);
	private final String API_KEY = "1O44Uic%2FwmxgeiJ1ybbEO2mZCseE7oM%2FpHnCSWmIIG%2BGjNIzLfsUrKSYGy5qzAe4cKKfYvuDYZwv9f9O8%2B6UpQ%3D%3D";
	
	private static String url;
	// 요청  항목
	private String lawd_cd;		//지역코드
	private int deal_ymd;		//계약월
	private int pageNo;			//현  페이지  번호
	private int startPage;
	private int numOfRows;		// 페이지 당  가져올  정보  개수
	private int pageSize;		//페이지  사이즈
	
	// 응답  항목
	private Vector dataSet;
	
	// xml 파싱
	private DocumentBuilder dBuilder;
	private DocumentBuilderFactory dbFactory;
	private Document doc;
	
	public RealEasteDealInfoDAOImpl() {
		pageNo = 1;
		startPage = 1;
		numOfRows = 10;
		pageSize = 10;
	}

	// 현재  바라보고있는  element에서의  태그 명에  대한  값을  추출
	private static String getTagValue(String tag, Element element) {
		NodeList nodeList = element.getElementsByTagName(tag).item(0).getChildNodes();
		
		Node nValue = (Node) nodeList.item(0);
		if(nValue == null) {
			return null;
		}
		
		return nValue.getNodeValue();
	}

	@Override
	public List<RealEstateAPTDealInfoDTO> getAPTDealInfo(int pageNo, String lawd_cd, int deal_ymd) {
		this.pageNo = pageNo;
		this.lawd_cd = lawd_cd;
		this.deal_ymd = deal_ymd;
		
		dataSet = new Vector<>(); // 데이터  등록할  거  초기화

		try {
			while(true) {
				// 파싱할  url 등록
				getAPTDealURL();
				
				dbFactory = DocumentBuilderFactory.newInstance();
				dBuilder = dbFactory.newDocumentBuilder();
				doc = dBuilder.parse(url);
				//root tag 가져오기
				doc.getDocumentElement().normalize();
				
				//api 에러  체크
				if(!checkErr()) {
					return null;
				}
				
				// item 뽑기
				NodeList nList = doc.getElementsByTagName("item");
				log.debug("nList : " + nList.getLength());
				for(int i=0; i<nList.getLength(); i++) {
					Node node = nList.item(i);
					
					if(node.getNodeType() == Node.ELEMENT_NODE) {
						Element e = (Element) node;
						RealEstateAPTDealInfoDTO dto = new RealEstateAPTDealInfoDTO();
						
						dto.setTransaction_amount(getTagValue("거래금액", e));
						dto.setBuild_year((Integer.parseInt(getTagValue("건축년도", e))));
						dto.setYear(Integer.parseInt(getTagValue("년", e)));
						dto.setLegal_dong(getTagValue("법정동", e));
						dto.setApartment(getTagValue("아파트", e));
						dto.setMonth(Integer.parseInt(getTagValue("월", e)));
						dto.setDay(getTagValue("일", e));
						dto.setExclusive_area(getTagValue("전용면적", e));
						dto.setArea_code(getTagValue("지역코드", e));
						dto.setLayer(Integer.parseInt(getTagValue("층", e)));
						
						dataSet.add(dto);
					}	// if end
				}	// for end
				break;
				
			}	// while end
		} catch (Exception e) {
			log.error("파싱 에러  : " + e.getMessage());
		}	// try end
		
		return dataSet;
	}

	@Override
	public void getAPTDealURL() {
		url =	"http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTrade?"
				+ "LAWD_CD=" + lawd_cd
				+ "&DEAL_YMD=" + deal_ymd
				+ "&serviceKey=" + API_KEY
				+ "&pageNo=" + pageNo
				+ "&numOfRows=" + numOfRows;
		
		if(lawd_cd != null) url += "&LAWD_CD=11110" + lawd_cd;
		if(deal_ymd != 0) url += "&DEAL_YMD=201512" + deal_ymd;
	}

	@Override
	public int getTotalCount() {
		NodeList resultNodeList = doc.getElementsByTagName("body");
		Node resultNode = resultNodeList.item(0);
		int totalCount = Integer.parseInt(getTagValue("totalCount", (Element)resultNode));
		
		return totalCount;
	}

	@Override
	public boolean checkErr() {
		NodeList resultNodeList = doc.getElementsByTagName("header");
		Node resultNode = resultNodeList.item(0);
		String resultCode = getTagValue("resultCode", (Element)resultNode);

		if(!resultCode.equals("00")) {
			log.debug(getTagValue("resultMsg", (Element)resultNode));
			return false;
		}
		
		return true;
	}
}