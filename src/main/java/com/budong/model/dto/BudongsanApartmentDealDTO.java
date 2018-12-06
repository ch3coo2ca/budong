package com.budong.model.dto;

import com.google.gson.annotations.SerializedName;

public class BudongsanApartmentDealDTO {
    @SerializedName("지번")
    private String aLotNumberAddress;

    @SerializedName("지역코드")
    private int districtCode;

    @SerializedName("년")
    private int year;

    @SerializedName("월")
    private int month;

    @SerializedName("일")
    private String day;

    @SerializedName("법정동")
    private String districtName;

    @SerializedName("층")
    private int floor;

    @SerializedName("거래금액")
    private String price;

    @SerializedName("아파트")
    private String apartmentName;

    @SerializedName("건축년도")
    private int constructionYear;

    @SerializedName("전용면적")
    private Float netArea;

    public BudongsanApartmentDealDTO() {
    }

    public BudongsanApartmentDealDTO(String aLotNumberAddress, int districtCode, int year, int month, String day, String districtName, int floor, String price, String apartmentName, int constructionYear, Float netArea) {
        this.aLotNumberAddress = aLotNumberAddress;
        this.districtCode = districtCode;
        this.year = year;
        this.month = month;
        this.day = day;
        this.districtName = districtName;
        this.floor = floor;
        this.price = price;
        this.apartmentName = apartmentName;
        this.constructionYear = constructionYear;
        this.netArea = netArea;
    }

    public String getaLotNumberAddress() {
        return aLotNumberAddress;
    }

    public void setaLotNumberAddress(String aLotNumberAddress) {
        this.aLotNumberAddress = aLotNumberAddress;
    }

    public int getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(int districtCode) {
        this.districtCode = districtCode;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
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

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getApartmentName() {
        return apartmentName;
    }

    public void setApartmentName(String apartmentName) {
        this.apartmentName = apartmentName;
    }

    public int getConstructionYear() {
        return constructionYear;
    }

    public void setConstructionYear(int constructionYear) {
        this.constructionYear = constructionYear;
    }

    public Float getNetArea() {
        return netArea;
    }

    public void setNetArea(Float netArea) {
        this.netArea = netArea;
    }
}
