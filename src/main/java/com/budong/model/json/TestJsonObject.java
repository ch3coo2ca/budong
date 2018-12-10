package com.budong.model.json;

import com.google.gson.annotations.SerializedName;

public class TestJsonObject {
    @SerializedName("x")
    private long xAxis = 0;

    @SerializedName("y")
    private long yAxis;

    public long getxAxis() {
        return xAxis;
    }

    public void setxAxis(long xAxis) {
        this.xAxis = xAxis;
    }

    public long getyAxis() {
        return yAxis;
    }

    public void setyAxis(long yAxis) {
        this.yAxis = yAxis;
    }
}