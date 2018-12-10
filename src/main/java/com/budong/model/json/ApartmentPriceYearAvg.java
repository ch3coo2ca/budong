package com.budong.model.json;

import java.math.BigDecimal;

public class ApartmentPriceYearAvg {

    private BigDecimal year;

    private BigDecimal avg;

    public ApartmentPriceYearAvg(BigDecimal year, BigDecimal avg) {
        this.year = year;
        this.avg = avg;
    }

    public BigDecimal getYear() {
        return year;
    }

    public void setYear(BigDecimal year) {
        this.year = year;
    }

    public BigDecimal getAvg() {
        return avg;
    }

    public void setAvg(BigDecimal avg) {
        this.avg = avg;
    }
}
