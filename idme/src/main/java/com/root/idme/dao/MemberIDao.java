package com.root.idme.dao;

import com.root.idme.dto.Members;

public interface MemberIDao {
	Members idCheck(Members member);
	Members login(Members member);
}
