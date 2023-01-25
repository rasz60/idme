package com.root.idme.cmd;

import java.util.ArrayList;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.root.idme.dao.GoodsDao;
import com.root.idme.dto.Goods;
import com.root.idme.dto.Photos;
import com.root.idme.util.Constant;

@Service
public class RetrieveGoodsPageCmd implements ICmd {
	
	@Override
	public void execute(Model model) {
		
		GoodsDao gDao = Constant.gDao;
		
		Goods goods = gDao.getDetails((String)model.asMap().get("gNo"));
		
		ArrayList<Photos> photoList = gDao.getPhotoList(goods.getgNo());
		
		model.addAttribute("goods", goods);
		model.addAttribute("photoList", photoList);
		
	}
}
