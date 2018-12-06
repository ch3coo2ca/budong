package com.budong.service.interfaces;

import com.budong.model.dto.BudongsanApartmentDealDTO;

import java.util.List;

public interface BudongsanInfoService {
    String getApartmentPriceYearAvgJson(int yearFrom, int yearTo);

    String getApartmentPriceYearMonthAvgJson(int year, int monthFrom, int monthTo);

    String getApartmentPriceYearDistrictCodeAvgJson(int districtCode, int year);
}
