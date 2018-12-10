package com.budong.model.json;

import java.math.BigDecimal;

public class ApartmentPriceYearDistrictCodeAvg extends ApartmentPriceYearMonthAvg {
    private BigDecimal districtCode;

    public ApartmentPriceYearDistrictCodeAvg(BigDecimal year, BigDecimal month, BigDecimal districtCode, BigDecimal avg) {
        super(year, month, avg);
        this.districtCode = districtCode;
    }

    public BigDecimal getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(BigDecimal districtCode) {
        this.districtCode = districtCode;
    }
}
