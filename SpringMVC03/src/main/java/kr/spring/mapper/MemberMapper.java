package kr.spring.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Insert;

import kr.spring.entity.Member;

@Mapper // MyBatis가 interface를 찾기 위해 달아주는 부분
public interface MemberMapper {

	public Member registerCheck(String memID);

	public int join(Member m);

	public Member login(Member m);

	public int update(Member m);
	
	
	
}
