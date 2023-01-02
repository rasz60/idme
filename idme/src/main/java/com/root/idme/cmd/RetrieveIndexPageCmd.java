package com.root.idme.cmd;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.root.idme.dao.GoodsDao;
import com.root.idme.dto.Goods;
import com.root.idme.dto.Members;
import com.root.idme.dto.Photos;
import com.root.idme.util.Constant;

public class RetrieveIndexPageCmd implements ICmd {

	@Override
	public void execute(Model model) {
		
		GoodsDao gDao = Constant.gDao;
		ArrayList<String> category = gDao.getCategory();
		ArrayList<Goods> goodsList = gDao.getGoodsList();
		ArrayList<Photos> photoList = gDao.getPhotoList(goodsList);
		
		model.addAttribute("category", category);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("photoList", photoList);
	}

	@Override
	public Members execute(String id, String pwd) {
		// TODO Auto-generated method stub
		return null;
	}

}