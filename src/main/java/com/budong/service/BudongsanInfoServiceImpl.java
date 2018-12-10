package com.budong.service;

import com.budong.model.dto.BudongsanApartmentDealDTO;
import com.budong.model.interfaces.BudongsanInfoDAO;
import com.budong.model.json.ApartmentPriceYearAvg;
import com.budong.model.json.ApartmentPriceYearDistrictCodeAvg;
import com.budong.model.json.ApartmentPriceYearMonthAvg;
import com.budong.service.interfaces.BudongsanInfoService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class BudongsanInfoServiceImpl implements BudongsanInfoService {
    private final Gson gsonObj;
    private final BudongsanInfoDAO budongsanInfoDAO;

    @Autowired
    public BudongsanInfoServiceImpl(Gson gsonObj, BudongsanInfoDAO budongsanInfoDAO) {
        this.gsonObj = gsonObj;
        this.budongsanInfoDAO = budongsanInfoDAO;
    }

    @Override
    public String getApartmentPriceYearAvgJson(int yearFrom, int yearTo) {
        List<ApartmentPriceYearAvg> avg = budongsanInfoDAO.getApartmentDealPriceYearAvg(yearFrom, yearTo);
        return gsonObj.toJson(avg);
    }

    @Override
    public String getApartmentPriceYearMonthAvgJson(int year, int monthFrom, int monthTo) {
        List<ApartmentPriceYearMonthAvg> avg = budongsanInfoDAO.getApartmentDealPriceYearMonthAvg(year, monthFrom, monthTo);
        return gsonObj.toJson(avg);
    }

    @Override
    public String getApartmentPriceYearDistrictCodeAvgJson(int districtCode, int year) {
        List<ApartmentPriceYearDistrictCodeAvg> avg = budongsanInfoDAO.getApartmentDealPriceYearDistrictCodeAvg(districtCode, year);
        return gsonObj.toJson(avg);
    }

}
