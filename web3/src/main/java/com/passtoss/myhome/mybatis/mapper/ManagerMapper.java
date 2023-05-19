package com.passtoss.myhome.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.passtoss.myhome.domain.Company;
import com.passtoss.myhome.domain.Member;
import com.passtoss.myhome.domain.MemberManage;

@Mapper
public interface ManagerMapper {

	public int updateCompany(Company c);

	public int deleteLogo(int companyId);

	public int getMemberListCount(MemberManage m);

	public List<Member> getMemberList(MemberManage m);

	public void authorize(String id);
	
}
