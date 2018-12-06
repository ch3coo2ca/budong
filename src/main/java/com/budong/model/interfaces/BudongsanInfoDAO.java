package com.budong.model.interfaces;

import com.budong.model.dto.BudongsanApartmentDealDTO;
import com.budong.model.json.ApartmentPriceYearAvg;
import com.budong.model.json.ApartmentPriceYearDistrictCodeAvg;
import com.budong.model.json.ApartmentPriceYearMonthAvg;

import java.util.List;

public interface BudongsanInfoDAO {
    List<ApartmentPriceYearAvg> getApartmentDealPriceYearAvg(int yearFrom, int yearTo);

    List<ApartmentPriceYearMonthAvg> getApartmentDealPriceYearMonthAvg(int year, int monthFrom, int monthTo);

    List<ApartmentPriceYearDistrictCodeAvg> getApartmentDealPriceYearDistrictCodeAvg(int districtCode, int year);

    void updateData(BudongsanApartmentDealDTO data);
}
