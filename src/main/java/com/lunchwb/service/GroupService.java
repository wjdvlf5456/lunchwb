package com.lunchwb.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lunchwb.dao.GroupDao;
import com.lunchwb.dao.UserDao;
import com.lunchwb.vo.GroupVo;
import com.lunchwb.vo.UserVo;

@Service
public class GroupService {
	
	@Autowired
	private GroupDao groupDao;
	@Autowired
	private UserDao userDao;
	
	private static final Logger logger = LoggerFactory.getLogger(GroupService.class);
	
	
	/******************** 그룹 리스트 페이지 ********************************************/
	public Map<String, Object> groupList(UserVo authUser, int groupNo) {
		logger.info("groupList()");
		
		Map<String, Object> map = new HashMap<>();
		
		/////////////////// 유저 그룹 리스트  /////////////////////////////
		int userNo = authUser.getUserNo();
		List<GroupVo> groupList = groupDao.userGroups(userNo);
		map.put("grouopList", groupList);
		
		//그룹 개수
		//그룹이 없으면 그룹 생성페이지로 전송
		int groupCount = groupList.size();
		map.put("groupCount", groupCount);
		
		/////////////////// 그룹원 리스트 //////////////////////////////
		//나의그룹 접근 groupNo == 0: 첫번째 그룹페이지

		if(groupCount != 0) {
			
			if(groupNo == 0) {
				groupNo = groupList.get(0).getGroupNo();
			}
			
			map.put("groupNo", groupNo);
			
			List<GroupVo> memberList = groupDao.groupMembers(groupNo);
			map.put("memberList", memberList);
			
			int memberCount = memberList.size();
			map.put("memberCount", memberCount);
		}
		
		return map;
	}
	
	
	
	/******************** 그룹 생성 ***********************************************/
	public int addGroup(UserVo authUser, GroupVo groupVo) {
		logger.info("addGroup()");
		
		//그룹 최대 4개 보유 가능 > 4개 이후 생성 못함 (새 그룹 추가 버튼이 보이지 않음 - 혹시 주소접근은 새 그룹 추가 페이지 접근시 막을 것)
		
		
		//////////////////// 그룹 생성 //////////////////////////////////
		//그룹 생성 > 생성자가 첫번째 리더
		groupVo.setGroupLeader(authUser.getUserNo());
		groupDao.createGroup(groupVo);
		
		
		/////////////////// 그룹 멤버 추가 ////////////////////////////////
		//groupVo : groupNo / bossCheck 있음
		//생성된 그룹 번호
		int groupNo = groupVo.getGroupNo();
		
		//UserVo userVo = userDao.groupMemInfo(userNo);
		
		int userNo = authUser.getUserNo();
		
		//groupOrder는 1부터 시작 순서대로 해당 유저의 그룹개수 +1로
		int groupOrder = groupDao.groupCount(userNo) + 1;
		
		//vo 정보 추가
		groupVo.setUserNo(userNo);
		groupVo.setLeaderCheck(1);
		groupVo.setGroupOrder(groupOrder);
		
		//그룹 멤버 추가
		groupDao.addMember(groupVo);
		
		return groupNo;
	}

}
