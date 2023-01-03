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
public class RetrieveTypeGoodsListCmd implements ICmd {

	@Override
	public void execute(Model model) {
		// Constant 클래스에 static으로 선언된 GoodsDao 가져옴
		GoodsDao gDao = Constant.gDao;
		// model에 담긴 category 값으로 상품 정보 select
		String category = (String)model.asMap().get("category");
		// 해당 카테고리 상품 리스트 출력 값 select
		ArrayList<Goods> goodsList = gDao.getTypeGoodsList(category);
		// 상품 리스트로 select된 gNo에 맞는 photo select
		ArrayList<Photos> photoList = gDao.getPhotoList(goodsList);
		
		// model add Lists
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("photoList", photoList);
	}

	// not use
	@Override
	public Members execute(String id, String pwd) {return null;}

}
