package com.lunchwb.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	/******************** 그룹 리스트 페이지 ********************************************/
	public Map<String, Object> groupList(UserVo authUser, int groupNo) {
		Map<String, Object> map = new HashMap<>();
		
		/////////////////// 유저 그룹 리스트  /////////////////////////////
		int userNo = authUser.getUserNo();
		List<GroupVo> groupList = groupDao.userGroups(userNo);
		map.put("groupList", groupList);
		
		//그룹 개수
		//그룹이 없으면 그룹 생성페이지로 전송
		int groupCount = groupList.size();
		map.put("groupCount", groupCount);
		
		/////////////////// 그룹 //////// //////////////////////////////
		//나의그룹 접근 groupNo == 0: 첫번째 그룹페이지
		
		if(groupCount != 0) {
			
			if(groupNo == 0) {
				groupNo = groupList.get(0).getGroupNo();
			}
			
			//그룹 이름
			GroupVo groupVo = new GroupVo();
			groupVo.setUserNo(userNo);
			groupVo.setGroupNo(groupNo);
			
			
			String groupName = groupDao.selectedGpName(groupVo);
			
			//주소접근 > 내 그룹이 아니면 에러
			if(groupName != null && groupName != "") {
				
				//그룹 이름
				map.put("groupName", groupName);
				map.put("groupNo", groupNo);
				
				//그룹원 리스트
				List<GroupVo> memberList = groupDao.groupMembers(groupNo);
				map.put("memberList", memberList);
				
				//그룹원 수(혼자인지 아닌지 판단하게)
				int memberCount = memberList.size();
				map.put("memberCount", memberCount);
				
				//그룹 리더 
				int leader = groupDao.groupLeader(groupNo);
				map.put("leader", leader);
			}
		}
		
		return map;
	}
	
	
	/******************** 그룹 추가 페이지 *******************************************/
	public Map<String, Object> addGroupForm(UserVo authUser) {
		Map<String, Object> map = new HashMap<>();
		
		/////////////////// 유저 그룹 리스트  /////////////////////////////
		int userNo = authUser.getUserNo();
		List<GroupVo> groupList = groupDao.userGroups(userNo);
		map.put("groupList", groupList);
		
		//그룹 개수
		int groupCount = groupList.size();
		map.put("groupCount", groupCount);
		
		return map;
	}
	
	
	/******************** 그룹 생성 ***********************************************/
	public int addGroup(UserVo authUser, GroupVo groupVo) {
		//그룹 최대 4개 보유 가능 > 4개 이후 생성 못함 (새 그룹 추가 버튼이 보이지 않음 - 혹시 주소접근은 새 그룹 추가 페이지 접근시 막을 것)
		
		int userNo = authUser.getUserNo();
		
		//////////////////// 그룹 생성 //////////////////////////////////
		//그룹 생성 > 생성자가 첫번째 리더
		groupVo.setGroupLeader(userNo);
		groupDao.createGroup(groupVo);
		
		/////////////////// 그룹 멤버 추가 ////////////////////////////////
		//groupVo : groupNo / bossCheck 있음
		//생성된 그룹 번호
		int groupNo = groupVo.getGroupNo();
		
		//groupOrder는 1부터 시작 순서대로 해당 유저의 그룹개수 +1로
		int groupOrder = groupDao.groupCount(userNo) + 1;
		
		//vo 정보 추가
		groupVo.setUserNo(userNo);
		groupVo.setGroupOrder(groupOrder);
		
		//그룹 멤버 추가
		groupDao.addMember(groupVo);
		
		return groupNo;
	}
	
	
	/******************** 그룹 순서 변경 ***********************************************/
	public String changeOrder(HashMap<String, Integer> gpOrder, UserVo authUser) {
		GroupVo groupVo = new GroupVo();
		
		int userNo = authUser.getUserNo();
		groupVo.setUserNo(userNo);
		
		int count = 0;
		int groupCount = gpOrder.get("groupCount");
		
		for(int i=1; i<=groupCount; i++) {
			groupVo.setOrder(i);
			
			int groupNo = gpOrder.get("order"+i);
			groupVo.setGroupNo(groupNo);
			
			count += groupDao.changeOrder(groupVo);
		}
		
		String result = "";
		
		if(count == groupCount) {
			result = "success";
			
		}else {
			result = "fail";
		}
		
		return result;
	}
	
	
	/******************** 그룹 이름 변경 *********************************************/
	public String nameChange(GroupVo groupVo) {
		String result = "fail";
		
		int count = groupDao.groupChange(groupVo);
		
		if(count == 1) {
			result = "success";
		}
		
		return result;
	}
	
	
	/******************** 그룹에 보스가 있는지 *****************************************/
	public String beBoss(int groupNo) {
		String result = "can't";
		
		int count = groupDao.beBoss(groupNo);
		
		if(count == 0) {
			result = "can";
		}
		
		return result;
	}
	
	
	/******************** 그룹에 초대할 회원 체크 ******************************************/
	public Map<String, Object> userCheck(String userEmail, UserVo authUser) {
		Map<String, Object> checkMap = new HashMap<String, Object>(); 
		
		UserVo userVo = userDao.userCheck(userEmail);
		
		String state = "not user";
		if(userVo != null) {
			int userNo = userVo.getUserNo();

			if(userNo == authUser.getUserNo()) {
				state = "It's U";
				
			}else {
				int gpCount = groupDao.groupCount(userNo);
				
				//해당 회원이 그룹 추가 가능
				if(gpCount < 4) {
					state = "possible";
					checkMap.put("userNo", userNo);
					checkMap.put("gpCount", gpCount);
					
					//그룹 추가 불가(최대 개수 보유)
				}else {
					state = "impossible";
				}
			}
		}
		
		checkMap.put("state", state);
		
		return checkMap;
	}
	
	
	/******************** 그룹 멤버 여부 ************************************************/
	public String memberCheck(GroupVo groupVo) {
		String state = "ok";
		
		int count = groupDao.memberCheck(groupVo);
		if(count == 1) {
			state = "already";
		}
		
		return state;
	}
	
	
	/******************** 회원 그룹 멤버 추가 ********************************************/
	public GroupVo invtMember(GroupVo groupVo) {
		groupDao.addMember(groupVo);
		int memberNo = groupVo.getGroupMemberNo();
		GroupVo memberVo = groupDao.memberInfo(memberNo);
		
		return memberVo;
	}
	
	
	/******************** 유령회원 그룹 멤버 추가 ********************************************/
	public GroupVo addMember(GroupVo groupVo) {
		/////// 비회원 그룹 멤버 유령회원 생성 ////////////////////////////////
		UserVo userVo = new UserVo();
		userVo.setUserName(groupVo.getUserName());
		userVo.setUserBirthYear(groupVo.getUserBirthYear());
		userVo.setUserSex(groupVo.getUserSex());
		//user_grade = 0 고정
		userDao.addGpMember(userVo);
		
		/////////////// 그룹에 비회원 멤버 추가 ////////////////////////////
		//보스 변경
		if(groupVo.getBossCheck() == 1) {
			groupDao.deleteBoss(groupVo.getGroupNo());
		}
		
		//groupVo : groupNo, bossCheck 있음
		//유령회원 번호 가져오기
		int userNo = userVo.getUserNo();
		System.out.println(userNo);
		
		//groupVo 정보 추가
		groupVo.setUserNo(userNo);
		//비회원한테 그룹순서는 필요 없어
		groupVo.setGroupOrder(0);
		groupDao.addMember(groupVo);
		
		//방금 추가한 그룹멤버번호
		int memberNo = groupVo.getGroupMemberNo();
		GroupVo memberVo = groupDao.memberInfo(memberNo);
	
		return memberVo;
	}
	
	
	/******************** 그룹 멤버 내보내기(강퇴) *****************************************/
	public String outMember(GroupVo groupVo) {
		String result = "fail";
		//int userNo = groupVo.getUserNo();
		///////////////////// 그룹 멤버에서 삭제 //////////////////////////
		int count = groupDao.outMember(groupVo);
		
		if(count > 0) {
			result = "success";
		
			//유령회원 user 테이블에서 제거
			//그룹없는 회원도 있어서 이거 아니야 없애지말까 아니면 유저검사 joindate나 email
			/*
			 * if(groupVo.getGroupOrder() == 0) { userDao.groupOut(userNo); }
			 */
			
			//group_order 조정
			groupDao.autoOrder(groupVo);
		}
		
		return result;
	}
	
	
	/******************** 그룹장 위임 ****************************************************/
	public String leaderChange(GroupVo groupVo, UserVo authUser) {
		String result = "fail";
		
		int count = groupDao.groupChange(groupVo);
		
		if(count > 0) {
			result = "success";
		}
		
		return result;
	}

}
