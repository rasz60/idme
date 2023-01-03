package com.root.idme.controller;

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
import com.root.idme.dto.Members;

@Controller
@RequestMapping("goods")
public class GoodsController {

	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	private ICmd cmd;
	
	/*
	 * 상품 상세 페이지
	 */ 
	@RequestMapping(value = "goodsDetails", method = RequestMethod.GET)
	public String goodsDetails(String gno, Model model, HttpSession session) {
		logger.info("goods details page >>> ");
		
		cmd = new RetrieveGoodsPageCmd();		
		model.addAttribute("gNo", gno);		
		cmd.execute(model);		
		
		// 상세 페이지에서 로그인 했을 경우 session에 유저 정보 저장
		if ( model.containsAttribute("user") ) {
			cmd = new LoginCmd();
			Members member = (Members)model.asMap().get("user");
			session.setAttribute("loginUser", member);
			
			logger.info("member : " + member.getmId() + " into goods details page >>> ");
		};
		
		return "goods";
	}
	
}
