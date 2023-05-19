package com.passtoss.myhome.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.passtoss.myhome.domain.Company;
import com.passtoss.myhome.domain.Member;
import com.passtoss.myhome.domain.MemberManage;
import com.passtoss.myhome.mybatis.mapper.ManagerMapper;

@Service
public class ManagerServiceImpl implements ManagerService {

	private static final Logger logger = LoggerFactory.getLogger(ManagerServiceImpl.class);

	private ManagerMapper dao;

	@Autowired
	public ManagerServiceImpl(ManagerMapper dao) {
		this.dao = dao;
	}

	@Override
	public int updateCompany(Company c) {
		logger.info("로고 = " + c.getLogo());
		return dao.updateCompany(c);
	}

	@Override
	public int deleteLogo(int companyId) {
		return dao.deleteLogo(companyId);
	}

	@Override
	public int getMemberListCount(MemberManage m) {
		return dao.getMemberListCount(m);
	}

	@Override
	public List<Member> getMemberList(MemberManage m) {
		return dao.getMemberList(m);
	}

	@Override
	public void authorize(String id) {		
		dao.authorize(id);
	}

}
