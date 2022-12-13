package com.root.idme.cmd;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.root.idme.dao.PageDao;
import com.root.idme.dto.Product;
import com.root.idme.util.Constant;

@Service
public class RetrieveProductPageCmd implements ICmd {
	
	@Override
	public void execute(Model model) {
		
		PageDao pBiz = Constant.pBiz;
		Product product = pBiz.getTestData();
		
		model.addAttribute("product", product);
	}
	
	
	
}
