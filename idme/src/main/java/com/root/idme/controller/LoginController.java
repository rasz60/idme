package com.root.idme.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.root.idme.cmd.ICmd;
import com.root.idme.cmd.LoginCmd;
import com.root.idme.dto.Members;

@Controller
@RequestMapping("login")
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	private ICmd cmd;
	
	/*
	 * sign-in
	 */
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String login(String returnUrl, String id, String pwd, RedirectAttributes rttr) {
		cmd = new LoginCmd();
		Members member = cmd.execute(id, pwd);
		logger.info("member : " + member.getmId() + " login >>> ");
		// redirect 된 이 후 새로고침되기 전까지 일회성으로 user 정보 전달
		rttr.addFlashAttribute("user", member);
		logger.info("returnUrl : " + returnUrl);
		
		// 로그인이 이루어진 url로 redirect
		return "redirect:"+returnUrl;
	}
	
	/*
	 * sign-out
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(String returnUrl, HttpSession session) {
		Members member = (Members)session.getAttribute("loginUser");

		logger.info("member : " + member.getmId() + " logout >>> ");
		// session에서 유저 정보 삭제
		session.removeAttribute("loginUser");
		logger.info("returnUrl : " + returnUrl);
		
		// 로그아웃이 이루어진 url로 redirect
		return "redirect:"+returnUrl;
	}
	
}
