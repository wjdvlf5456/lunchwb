package com.lunchwb.service;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.VisitedDao;
import com.lunchwb.vo.UserVo;
import com.lunchwb.vo.VisitedVo;

@Service
public class VisitedService {
	
	@Autowired
	private VisitedDao vstDao;
	
	private static final Logger logger = LoggerFactory.getLogger(VisitedService.class);
	
	// ================== 달력에 가게라벨 띄우기 ==================
	public List<VisitedVo> showCalendar(VisitedVo vstVo){
		
		// 현재 연도 가져오기
		String thisYear = vstVo.getSelectMonth().substring(2,4);
		// 현재 몇월인지 가져오기
		int thisMonth = Integer.parseInt(vstVo.getSelectMonth().substring(4).replaceAll(" ",""));
		
		// 연도와 월 합치기용 getDate
		String getDate = "";
		getDate += thisYear;
		
		// 9월 이하 달 앞 '0' 추가 228 => 2208
		if (thisMonth < 10) {
			getDate += "0";
			getDate += Integer.toString(thisMonth);
		} else {
			getDate += Integer.toString(thisMonth);
		}
		// vstVo 연월 자바에서 바꾼 형식으로 넣기(getDate)
		vstVo.setSelectMonth(getDate);
		
		// 오라클 sql문으로 visited 테이블 조회
		List<VisitedVo> calendarList = vstDao.getCalendar(vstVo);
		
		
		
		return calendarList;
	};
	
	
	
	/********************* 여기갈래요 후 리뷰 작성 메인페이지 ***************************/
	public HashMap<String, Object> visitedMain(UserVo authUser) {
		HashMap<String, Object> visitedMap = new HashMap<>();
		
		int userNo = authUser.getUserNo();
		
		//오늘 내가 다녀온 곳의 정보
		VisitedVo visitedVo = vstDao.todayStoreInfo(userNo);
		visitedMap.put("visitedVo", visitedVo);
		
		return visitedMap;
	}


}
