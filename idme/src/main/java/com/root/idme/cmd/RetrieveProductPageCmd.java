package com.root.idme.cmd;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.root.idme.dao.GoodsDao;
import com.root.idme.dto.Goods;
import com.root.idme.util.Constant;

@Service
public class RetrieveProductPageCmd implements ICmd {
	
	@Override
	public void execute(Model model) {
		
		GoodsDao gDao = Constant.gDao;
		Goods goods = gDao.getDetails();
		
		model.addAttribute("goods", goods);
	}
	
	
	
}
