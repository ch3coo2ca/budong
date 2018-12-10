package com.budong.model.interfaces;

import com.budong.model.dto.RealEstateAPTDealInfoDTO;

import java.util.List;

public interface RealEsateDealInfoDAO {
	List<RealEstateAPTDealInfoDTO> getAPTDealInfo(int pageNo, String lawd_cd, int deal_ymd );
	void getAPTDealURL();
	int getTotalCount();
	boolean checkErr();
}
