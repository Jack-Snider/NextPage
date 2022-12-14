package kr.or.ddit.school.manager.teacher.Insert.service;

import java.util.List;

import kr.or.ddit.common.enumpkg.ServiceResult;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.PoiVO;
import kr.or.ddit.vo.SchMemberVO;
import kr.or.ddit.vo.YearClassVO;

public interface TeacherInsertService {
	
	public ServiceResult insertAllMember(List<SchMemberVO> member);
	
	public ServiceResult createMember(SchMemberVO member);
	
	public int insertStaff(String member);
	
	public SchMemberVO retrieveMember(String memId);
	
	public int retrieveMemberCount(PagingVO pagingVO);
	
	public List<SchMemberVO> retrieveMemberList(PagingVO pagingVO);
	
	public ServiceResult modifyMember(SchMemberVO member);
	
	public SchMemberVO selectMemId(SchMemberVO member);
	
	public int insertClass(YearClassVO yc);
	
	public String whoClasses(String member);
	
	//public ServiceResult removeMember(SchMemberVO member);
	
}
