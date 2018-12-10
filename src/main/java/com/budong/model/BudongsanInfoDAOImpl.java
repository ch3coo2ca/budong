package com.budong.model;

import com.budong.model.dto.BudongsanApartmentDealDTO;
import com.budong.model.interfaces.BudongsanInfoDAO;
import com.budong.model.json.ApartmentPriceYearAvg;
import com.budong.model.json.ApartmentPriceYearDistrictCodeAvg;
import com.budong.model.json.ApartmentPriceYearMonthAvg;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BudongsanInfoDAOImpl implements BudongsanInfoDAO {

    private static final String prefix = "com.budong.model.interfaces.BudongsanInfoDAO.";

    private final SqlSessionTemplate mybatis;

    @Override
    public void updateData(BudongsanApartmentDealDTO data) {
        mybatis.insert(prefix + "updateData", data);
    }

    @Autowired
    public BudongsanInfoDAOImpl(SqlSessionTemplate mybatis) {
        this.mybatis = mybatis;
    }

    @Override
    public List<ApartmentPriceYearAvg> getApartmentDealPriceYearAvg(int yearFrom, int yearTo) {
        Map<String, Object> parameter = new HashMap<>();
        parameter.put("yearFrom", yearFrom);
        parameter.put("yearTo", yearTo);

        return mybatis.selectList(prefix + "getApartmentDealPriceYearAvg", parameter);
    }

    @Override
    public List<ApartmentPriceYearMonthAvg> getApartmentDealPriceYearMonthAvg(int year, int monthFrom, int monthTo) {
        Map<String, Object> parameter = new HashMap<>();
        parameter.put("year", year);
        parameter.put("monthFrom", monthFrom);
        parameter.put("monthTo", monthTo);

        return mybatis.selectList(prefix + "getApartmentDealPriceYearMonthAvg", parameter);
    }

    @Override
    public List<ApartmentPriceYearDistrictCodeAvg> getApartmentDealPriceYearDistrictCodeAvg(int districtCode, int year) {
        Map<String, Object> parameter = new HashMap<>();
        parameter.put("districtCode", districtCode);
        parameter.put("year", year);

        return mybatis.selectList(prefix + "getApartmentDealPriceYearDistrictCodeAvg", parameter);
    }
}
