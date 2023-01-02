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
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		logger.info("index >>> ");
		
		cmd = new RetrieveIndexPageCmd();
		cmd.execute(model);		
		
		if ( model.containsAttribute("user") ) {
			cmd = new LoginCmd();
			Members member = (Members)model.asMap().get("user");
			session.setAttribute("loginUser", member);
			logger.info("member : " + member.getmId() + " into index page >>> ");
		};
		
		return "index";
	}
	
}
