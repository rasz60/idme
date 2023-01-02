package com.root.idme.cmd;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.root.idme.dao.GoodsDao;
import com.root.idme.dto.Goods;
import com.root.idme.dto.Members;
import com.root.idme.dto.Photos;
import com.root.idme.util.Constant;

public class RetrieveTypeGoodsListCmd implements ICmd {

	@Override
	public void execute(Model model) {
		
		GoodsDao gDao = Constant.gDao;
		String category = (String)model.asMap().get("category");
		
		ArrayList<Goods> goodsList = gDao.getTypeGoodsList(category);
		ArrayList<Photos> photoList = gDao.getPhotoList(goodsList);
		
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("photoList", photoList);
	}

	@Override
	public Members execute(String id, String pwd) {
		// TODO Auto-generated method stub
		return null;
	}

}
