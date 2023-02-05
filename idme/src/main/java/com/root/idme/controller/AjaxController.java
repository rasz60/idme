package com.root.idme.controller;

import java.lang.reflect.Member;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.root.idme.cmd.ICmd;

import com.root.idme.cmd.RetrieveTypeGoodsListCmd;
import com.root.idme.dto.Goods;
import com.root.idme.dto.Members;

@Controller
@RequestMapping("ajax")
public class AjaxController {
	
	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);
	private ICmd cmd;
	
	/*
	 *  index page 카테고리 별 상품리스트 select
	 */
	@ResponseBody
	@RequestMapping(value="getGoodsList", produces="application/json; charset=UTF-8")
	public ArrayList<Goods> getCategoryGoods(String category, Model model) {
		logger.info("getCategoryGoods >>> ");
		
		model.addAttribute("category", category);
		
		cmd = new RetrieveTypeGoodsListCmd();
		cmd.execute(model);
		
		ArrayList<Goods> rslt = (ArrayList)model.asMap().get("goodsList");
		
		return rslt;
	}
	
//	/*
//	 *  id, pw로 된 유저 있는지 확인
//	 */
//	@ResponseBody
//	@RequestMapping(value="loginMember", produces="application/json; charset=UTF-8")
//	public Members loginMember(String id, String pwd, Model model) {
//		logger.info("loginMember >>> ");
//		
//		model.addAttribute("mId", id);
//		model.addAttribute("mPwd", pwd);
//		
//		cmd = new LoginCmd();
//		cmd.execute(model);
//		
//		Members member = (Members)model.asMap().get("user");
//		
//		return member;
//	}
	
	
	
}