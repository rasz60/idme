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
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String login(String returnUrl, String id, String pwd, RedirectAttributes rttr) {
		cmd = new LoginCmd();
		Members member = cmd.execute(id, pwd);

		logger.info("member : " + member.getmId() + " login >>> ");
		rttr.addFlashAttribute("user", member);
		logger.info("returnUrl : " + returnUrl);
		return "redirect:"+returnUrl;
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(String returnUrl, HttpSession session) {
		Members member = (Members)session.getAttribute("loginUser");

		logger.info("member : " + member.getmId() + " logout >>> ");
		session.removeAttribute("loginUser");
		logger.info("returnUrl : " + returnUrl);
		return "redirect:"+returnUrl;
	}
	
}
