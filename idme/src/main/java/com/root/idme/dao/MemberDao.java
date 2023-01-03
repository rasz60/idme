package com.root.idme.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.root.idme.dto.Members;
import com.root.idme.util.Constant;

@Component
public class MemberDao implements MemberIDao {

	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	
	private final SqlSession sqlSession;
	
	@Autowired
	public MemberDao (SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Constant.mDao = this;
	}
	
	// submit 된 id,pw 유저가 있는지 확인
	@Override
	public Members idCheck(Members member) {
		Members loginMember = sqlSession.selectOne("idCheck", member);
		return loginMember;
	}
	
	// submit 된 id,pw로 로그인
	@Override
	public Members login(Members member) {
		Members loginMember = sqlSession.selectOne("login", member);
		return loginMember;
	}

}
