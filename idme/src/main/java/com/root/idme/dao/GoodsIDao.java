package com.root.idme.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.root.idme.dto.Goods;
import com.root.idme.dto.Photos;

@Component
public interface GoodsIDao {
	
	
	// index page �޴��� ǥ�õ� �� select
	ArrayList<String> getCategory();
		
	//
	ArrayList<Goods> getGoodsList();
	
	ArrayList<Goods> getGoodsPage(int page);
	
	Goods getDetails(String gNo);
	
	ArrayList<Goods> getTypeGoodsList(String category);
	
	ArrayList<Photos> getPhotoList(int gNo);
	
	ArrayList<Photos> getPhotoList(ArrayList<Goods> goodsList);
}
