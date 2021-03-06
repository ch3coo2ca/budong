package com.budong.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.budong.model.dto.NewsDTO;
import com.budong.service.NewsServiceImpl;

/**
 * 일반 사용자
 * */
@Controller
@RequestMapping("/")
public class MainController {
    private final Logger log = LoggerFactory.getLogger(MainController.class);
    
    @Autowired
    private NewsServiceImpl newsService;

    /*@RequestMapping("/")
    public String goToIndexPage() {
        log.info("path [/] status ok");
        return R.path.INDEX;
        return "khw/index";
    }*/
    
    
    @RequestMapping("/")
    public ModelAndView goToIndexPage() {
    	String param = null;
    	if(param==null) {
    		Date today = new Date();
    		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
    		param = date.format(today);
    	}
    	ModelAndView mav= new ModelAndView("khw/index");
    	ArrayList<NewsDTO> list = new ArrayList<>();
    	String url = "https://land.naver.com/news/headline.nhn?bss_ymd="+param;
    	list = newsService.getTitle(url);
    	
    	mav.addObject("list", list);
    	mav.addObject("date",param);
    	return mav;
    }
    
    @RequestMapping("/title.news")
    public ModelAndView goToTestPage(@RequestParam String param) {
    	log.info("param : "+param);
    	ModelAndView mav= new ModelAndView("khw/news");
    	ArrayList<NewsDTO> list = new ArrayList<>();
    	String url = "https://land.naver.com/news/headline.nhn?bss_ymd="+param;
    	list = newsService.getTitle(url);
    	mav.addObject("list", list);
    	mav.addObject("date",param);
    	return mav;
    }
    @RequestMapping("/content.news")
    public ModelAndView getNewsbody(@RequestParam String param){
    	ModelAndView mav= new ModelAndView("khw/newsContent");
    	String change = param.replaceAll("!", "&");
    	mav.addObject("newsbody", newsService.getContent(change));
    	return mav;
    }
}
