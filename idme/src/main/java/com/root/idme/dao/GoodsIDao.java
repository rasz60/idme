package com.root.idme.dao;

import java.util.ArrayList;

import com.root.idme.dto.Goods;
import com.root.idme.dto.Photos;

public interface GoodsIDao {
	
	Goods getDetails(String gNo);
	ArrayList<String> getCategory();
	ArrayList<Goods> getGoodsList();
	ArrayList<Goods> getTypeGoodsList(String category);
	ArrayList<Photos> getPhotoList(ArrayList<Goods> goodsList);
	ArrayList<Photos> getPhotoList(int gNo);
}
