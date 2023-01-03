package com.root.idme.cmd;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.root.idme.dao.MemberDao;
import com.root.idme.dto.Members;
import com.root.idme.util.Constant;

@Service
public class LoginCmd implements ICmd {

	@Override
	public void execute(Model model) {
		MemberDao mDao = Constant.mDao;
		Members member = new Members();
		
		member.setmId((String)model.asMap().get("mId"));
		member.setmPwd((String)model.asMap().get("mPwd"));
		
		member = mDao.idCheck(member);

		if ( member == null ) {
			member = new Members();
			member.setErrMsg("잘못된 ID 혹은 PWD입니다.");
		}
	
		model.addAttribute("user", member);		
	};
	
	@Override
	public Members execute(String id, String pwd) {
		MemberDao mDao = Constant.mDao;
		Members member = new Members();
		
		member.setmId(id);
		member.setmPwd(pwd);
		
		member = mDao.login(member);
		
		return member;
	}

}
