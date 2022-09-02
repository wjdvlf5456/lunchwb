package com.lunchwb.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lunchwb.service.StatService;
import com.lunchwb.vo.AloneVo;
import com.lunchwb.vo.StatVo;
import com.lunchwb.vo.VisitedVo;

@Controller
@RequestMapping(value="/stat")
public class StatController {
	
	@Autowired
	private StatService statService;
	
	private static final Logger logger = LoggerFactory.getLogger(StatController.class);

	
	// ============================================ 캘린더 ============================================
	// =============== 달력폼 ===============
	@GetMapping("/statCalendar")
	public String statCalendarForm() {
		logger.info("StatController > statCalendarForm()");
		
		return "stat/statCalendar";
	};
	
	
	// =============== 달력폼에 방문한 곳 정보가져오기(ajax + json) ===============
	@ResponseBody
	@RequestMapping(value = "/showVstList",method = {RequestMethod.GET,RequestMethod.POST})
	public List<VisitedVo> showVstList(@RequestBody VisitedVo vstVo){
		logger.info("StatController > showVstList()");
		logger.info(vstVo.toString());
		
		List<VisitedVo> vstList = statService.showCalendar(vstVo);
		logger.info(vstList.toString());
	
		return vstList;
	};
	
	@GetMapping("/reviewList")
	public String reviewListForm() {
		logger.info("StatController > reviewListForm()");
		
		
		return "stat/reviewList";
	};
	// ============================================ 리뷰 ============================================
	// =============== 리뷰내역폼 ===============
	@ResponseBody
	@RequestMapping(value="/showReviewList", method = {RequestMethod.GET,RequestMethod.POST})
	public List<AloneVo> reviewListForm(@RequestBody AloneVo aloneVo) {
		logger.info("StatController > reviewListForm()");
		// 현재 접속중인 유저의 리뷰들 가져오기
		int userNo = aloneVo.getUserNo();
		List<AloneVo> reviewList = statService.reviewList(userNo);
		
		logger.info(reviewList.toString());
		return reviewList;
	};
	
	// 리뷰 수정폼
	@GetMapping("/modifyReview/{reviewNo}")
	public String modifyReviewForm(@PathVariable("reviewNo")int reviewNo, Model model) {
		logger.info("StatController > modifyReviewForm()");
		
		AloneVo aloneVo = statService.getReview(reviewNo);
		logger.info(aloneVo.toString());
		
		model.addAttribute("aloneVo",aloneVo);
		return "stat/modifyReview";	// 리다이렉트로 수정
	};
	
	@RequestMapping(value = "/modifyReview",method = {RequestMethod.GET,RequestMethod.POST})
	public String modifyReview(@RequestParam int reviewNo, @RequestParam String reviewContent ,@RequestParam int userScore, @RequestPart(value = "file", required = false) MultipartFile file) {
		logger.info("StatController > modifyReviewForm()");
		
		AloneVo aloneVo = new AloneVo(reviewNo,reviewContent,userScore);
		logger.info(aloneVo.toString());
		logger.info(file.toString());
		
		int count = statService.modifyReview(aloneVo,file);
		logger.info(Integer.toString(count)+ "건 수정하였습니다."); 
		
		return "stat/reviewList";	// 리다이렉트로 수정
	};
	
	// ============================================ 리뷰 삭제 ============================================
	@ResponseBody
	@RequestMapping(value = "/deleteReview",method = {RequestMethod.GET,RequestMethod.POST})
	public String deleteReview(@RequestBody AloneVo aloneVo) {
		int reviewNo = aloneVo.getReviewNo();
		logger.info("deleteVo"+Integer.toString(reviewNo));
		
		String result = statService.delReviewResult(reviewNo);
		
		return result; 
	};
	
	
	// =============== 따로갔어요폼 ===============
	@GetMapping("/addAlone")
	public String addAloneForm() {
		logger.info("StatController > addAloneForm()");
		
		
		
		
		
		
		return "stat/addReview";
	};
	
	@PostMapping("/addAlone")
	public String addAlone() {
		logger.info("StatController > addAlone()");
		
		
		
		
		
		
		return "stat/reviewList";
	};
	

	// ============================================ 통계 ============================================
	// =============== 통계폼 ===============
	@GetMapping("/statChart")
	public String statChartForm() {
		logger.info("StatController > statChartForm()");
		
		
		
		return "stat/statChart";
	};
	
	@ResponseBody
	@RequestMapping(value = "/getStatChart", method = {RequestMethod.GET,RequestMethod.POST})
	public Map<String,List<String>> getStatChart(@RequestBody StatVo statVo){
		logger.info("StatController > getStatChart()");
		Map<String,List<String>> chartMap = statService.getStatChart(statVo);
		logger.info(chartMap.toString());
		
		
		return chartMap;
	};
	
	
	
	
}

