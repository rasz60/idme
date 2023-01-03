package com.root.idme.dao;

import org.springframework.stereotype.Component;

import com.root.idme.dto.Members;
@Component
public interface MemberIDao {
	// submit 된 id,pw 유저가 있는지 확인
	Members idCheck(Members member);
	// submit 된 id,pw로 로그인
	Members login(Members member);
}
