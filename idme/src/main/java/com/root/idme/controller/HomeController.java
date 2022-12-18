package com.root.idme.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.root.idme.cmd.ICmd;
import com.root.idme.cmd.RetrieveProductPageCmd;
import com.root.idme.dao.GoodsIDao;

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
	public String home(Model model) {
		logger.info("index >>> ");
		
		return "index";
	}
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String product(Model model) {
		logger.info("product >>> ");
		
		cmd = new RetrieveProductPageCmd();
		cmd.execute(model);
		
		return "goods";
	}
	
}
