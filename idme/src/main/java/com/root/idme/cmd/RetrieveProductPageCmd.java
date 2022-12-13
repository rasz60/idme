package com.root.idme.cmd;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.root.idme.dao.ProductDao;
import com.root.idme.dto.Product;
import com.root.idme.util.Constant;

@Service
public class RetrieveProductPageCmd implements ICmd {
	
	@Override
	public void execute(Model model) {
		
		ProductDao pDao = Constant.pDao;
		Product product = pDao.getTestData();
		
		model.addAttribute("product", product);
	}
	
	
	
}
