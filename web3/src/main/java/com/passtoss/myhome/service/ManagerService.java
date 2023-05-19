package com.passtoss.myhome.service;

import java.util.List;

import com.passtoss.myhome.domain.Company;
import com.passtoss.myhome.domain.Member;
import com.passtoss.myhome.domain.MemberManage;

public interface ManagerService {

	public int updateCompany(Company c);

	public int deleteLogo(int companyId);

	public int getMemberListCount(MemberManage m);

	public List<Member> getMemberList(MemberManage m);

	public void authorize(String id);

}
