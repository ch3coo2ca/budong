package com.budong.model.json;

import java.math.BigDecimal;

public class ApartmentPriceYearMonthAvg extends ApartmentPriceYearAvg {

    private BigDecimal month;

    public ApartmentPriceYearMonthAvg(BigDecimal year, BigDecimal month, BigDecimal avg) {
        super(year, avg);
        this.month = month;
    }

    public BigDecimal getMonth() {
        return month;
    }

    public void setMonth(BigDecimal month) {
        this.month = month;
    }
}
