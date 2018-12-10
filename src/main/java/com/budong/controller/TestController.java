package com.budong.controller;

import java.util.List;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import com.budong.R;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.budong.model.dto.RealEstateAPTDealInfoDTO;
import com.budong.service.TestServiceClass;

@Controller
@RequestMapping("/test")
public class TestController {
	private static final Logger log = LoggerFactory.getLogger(TestController.class);

	private final TestServiceClass testServiceClass;

	@Autowired
	public TestController(TestServiceClass testServiceClass) {
		this.testServiceClass = testServiceClass;
	}

	@RequestMapping("/realState.do")
	public String index(HttpServletRequest req) {
		log.info("path [/test/realState.do] status ok");
		return "test/RealState";
	}

	@RequestMapping("/apartmentDealInfo.do")
	public String listInfo(HttpServletRequest req) {

		String str_dealYmd = req.getParameter("deal_ymd");
		str_dealYmd = str_dealYmd.replaceAll("-", "");

		int deal_ymd = Integer.parseInt(str_dealYmd);
		String lawd_cd = req.getParameter("lawd_cd");

		// go service
		List<RealEstateAPTDealInfoDTO> v = testServiceClass.listAPTDeal(lawd_cd, deal_ymd);

		req.setAttribute("list", v);

		log.debug("deal_ymd = " + deal_ymd);
		log.debug("lawd_cd = " + lawd_cd);
		log.debug("vector size = " + v.size());

		return "test/APTDealList";
	}

	/** graph test section */
	@RequestMapping(R.mapping.graph_year_avg)
	public String goToTestGraphYear() {
		return R.path.graph_year;
	}

	@RequestMapping(R.mapping.graph_year_month_avg)
	public String goToTestGraphYearMonth() {
		return R.path.graph_year_month;
	}

	@RequestMapping(R.mapping.graph_year_districtCode_avg)
	public String goToTestGraphYearDistrict() {
		return R.path.graph_year_districtCode_avg;
	}

	/* graph test section end */
}