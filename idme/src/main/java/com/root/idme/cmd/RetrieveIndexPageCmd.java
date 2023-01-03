package com.root.idme.cmd;

import java.util.ArrayList;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.root.idme.dao.GoodsDao;
import com.root.idme.dto.Goods;
import com.root.idme.dto.Members;
import com.root.idme.dto.Photos;
import com.root.idme.util.Constant;

@Service
public class RetrieveIndexPageCmd implements ICmd {

	@Override
	public void execute(Model model) {
		// Constant 클래스에 static으로 선언된 GoodsDao 가져옴
		GoodsDao gDao = Constant.gDao;
		// index page 카테고리 메뉴 값 select
		ArrayList<String> category = gDao.getCategory();
		// index page 상품 리스트 출력 값 select (init : 상품명 순 10개)
		ArrayList<Goods> goodsList = gDao.getGoodsList();
		// index page 상품 리스트로 select된 gNo에 맞는 photo select
		ArrayList<Photos> photoList = gDao.getPhotoList(goodsList);
		
		// model add Lists
		model.addAttribute("category", category);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("photoList", photoList);
	}
	
	// not use
	@Override
	public Members execute(String id, String pwd) {return null;}

}
