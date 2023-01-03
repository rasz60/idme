package com.root.idme.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.root.idme.dto.Goods;
import com.root.idme.dto.Photos;
@Component
public interface GoodsIDao {
	// index page 메뉴로 표시될 값 select
	ArrayList<String> getCategory();
	// index page 상품 리스트에 표시될 상품 리스트 select
	ArrayList<Goods> getGoodsList();
	// index page 카테고리 메뉴 선택 시 특정 카테고리 상품 리스트 select
	ArrayList<Goods> getTypeGoodsList(String category);
	// index page 상품 리스트에 해당하는 상품 사진 select (대표 이미지만)
	ArrayList<Photos> getPhotoList(ArrayList<Goods> goodsList);
	// 상품 정보 select
	Goods getDetails(String gNo);
	// detail page 특정 상품에 해당하는 상품 사진 전체 select
	ArrayList<Photos> getPhotoList(int gNo);
}
