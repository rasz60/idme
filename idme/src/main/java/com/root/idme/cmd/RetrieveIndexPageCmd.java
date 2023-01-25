package com.root.idme.cmd;

import java.util.ArrayList;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.root.idme.dao.GoodsDao;
import com.root.idme.dto.Goods;
import com.root.idme.dto.Photos;
import com.root.idme.util.Constant;

@Service
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
	
	
	
}
