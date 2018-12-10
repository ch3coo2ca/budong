package com.budong;

public class R {
    public static class path {
        public static final String INDEX = "index";
        public static final String graph_year = "test/graph";
        public static final String graph_year_month = "test/graphYearMonth";
        public static final String graph_year_districtCode_avg = "test/graphYearDistrictCode";
    }

    public static class mapping {
        public static final String INDEX = "/";
        public static final String graph_year_avg = "/graph/year";
        public static final String graph_year_month_avg = "/graph/yearMonth";
        public static final String graph_year_districtCode_avg = "/graph/yearDistrictCode";
    }

    public static class rest {
        public static final String apartment_deal_info_avg_by_year = "/rest/apartmentDealPriceAvg/year";
        public static final String apartment_deal_info_avg_by_year_month = "/rest/apartmentDealPriceAvg/month";
        public static final String apartment_deal_info_avg_by_year_districtCode = "/rest/apartmentDealPriceAvg/yearDistrictCode";
    }
}
