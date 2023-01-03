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
public class RetrieveGoodsPageCmd implements ICmd {
	
	@Override
	public void execute(Model model) {
		// Constant 클래스에 static으로 선언된 GoodsDao 가져옴
		GoodsDao gDao = Constant.gDao;
		// model에 담긴 gNo 값으로 상품 정보 select
		Goods goods = gDao.getDetails((String)model.asMap().get("gNo"));
		// model에 담긴 gNo 값으로 상품 사진 select
		ArrayList<Photos> photoList = gDao.getPhotoList(goods.getgNo());
		
		// model add
		model.addAttribute("goods", goods);
		model.addAttribute("photoList", photoList);
	}

	// not use
	@Override
	public Members execute(String id, String pwd) {return null;}

		
}
