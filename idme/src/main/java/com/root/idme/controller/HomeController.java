package com.root.idme.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.root.idme.cmd.ICmd;
import com.root.idme.cmd.LoginCmd;
import com.root.idme.cmd.RetrieveGoodsPageCmd;
import com.root.idme.cmd.RetrieveIndexPageCmd;
import com.root.idme.dto.Members;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private ICmd cmd;
	
	/**
	 * idme index page
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		logger.info("index >>> ");
		
		// index page cmd
		cmd = new RetrieveIndexPageCmd();
		cmd.execute(model);		
		
		// 로그인 처리가 완료되어 model에 user가 담겨있는 경우
		if ( model.containsAttribute("user") ) {
			// login cmd
			cmd = new LoginCmd();
			// model에 담긴 user 정보 get
			Members member = (Members)model.asMap().get("user");
			// user session에 저장
			session.setAttribute("loginUser", member);
			logger.info("member : " + member.getmId() + " into index page >>> ");
		};

		return "index";
	}
	
}
