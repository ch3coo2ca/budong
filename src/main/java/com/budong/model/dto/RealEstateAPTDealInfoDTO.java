package com.budong.model.dto;

/**
 * @author 김준영
 * 2018-11-09 16:14
 * 아파트  실거래  자료
 * API  한글파일  3페이지
 * <p>
 * 변수명				항목명(영문) 항목명(국문) 항목설명     항목크기     항목구분     샘플데이터
 * resultCode				resultCode 결과코드  	결과코드	 	2 		1		 00
 * resultMsg				resultMsg 결과메세지 결과메세지		50 		1	 NORMAL SERVICE.
 * transaction_amount		거래금액 		거래금액 	거래금액 		40 		1 		82,500(만원)
 * build_year				건축년도 		건축년도 	건축년도		4 		1		 2015
 * year					년 			년 			년		4 		1 		2015
 * legal_dong				법정동		 법정동	 법정동 		40 		1 		사직동
 * apartment				아파트 		아파트 	아파트 		40 		1 광화문풍림스페이스본(9-0)
 * month					월 			월		 월 			2		1		 12
 * day						일			일		 일			6		1		1~10
 * exclusive_area			전용면적	     전용면적 	전용면적		20 		1 94.51 지번 지번 지번 10 1 9
 * area_code				지역코드	  지역코드 		지역코드		5 		1		11110
 * layer					층			층		층 			4 		1		 11
 */
public class RealEstateAPTDealInfoDTO {
    private String resultCode;
    private String resultMsg;
    private String transaction_amount;
    private int build_year;
    private int year;
    private String legal_dong;
    private String apartment;
    private int month;
    private String day;
    private String exclusive_area;
    private String area_code;
    private int layer;


    public String getResultCode() {
        return resultCode;
    }

    public void setResultCode(String resultCode) {
        this.resultCode = resultCode;
    }

    public String getResultMsg() {
        return resultMsg;
    }

    public void setResultMsg(String resultMsg) {
        this.resultMsg = resultMsg;
    }

    public String getTransaction_amount() {
        return transaction_amount;
    }

    public void setTransaction_amount(String transaction_amount) {
        this.transaction_amount = transaction_amount;
    }

    public int getBuild_year() {
        return build_year;
    }

    public void setBuild_year(int build_year) {
        this.build_year = build_year;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getLegal_dong() {
        return legal_dong;
    }

    public void setLegal_dong(String legal_dong) {
        this.legal_dong = legal_dong;
    }

    public String getApartment() {
        return apartment;
    }

    public void setApartment(String apartment) {
        this.apartment = apartment;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getExclusive_area() {
        return exclusive_area;
    }

    public void setExclusive_area(String exclusive_area) {
        this.exclusive_area = exclusive_area;
    }

    public String getArea_code() {
        return area_code;
    }

    public void setArea_code(String area_code) {
        this.area_code = area_code;
    }

    public int getLayer() {
        return layer;
    }

    public void setLayer(int layer) {
        this.layer = layer;
    }


}
