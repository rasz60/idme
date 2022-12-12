package com.root.idme.cmd;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.root.idme.dao.PageBiz;
import com.root.idme.dto.Product;
import com.root.idme.util.Constant;

@Service
public class RetrieveMainPageCmd implements ICmd {
	
	@Override
	public void execute(Model model) {
		
		PageBiz pBiz = Constant.pBiz;
		Product product = pBiz.getTestData();
		
		model.addAttribute("product", product);
	}
	
	
	
}
