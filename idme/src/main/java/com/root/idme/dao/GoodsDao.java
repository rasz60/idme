package com.root.idme.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.root.idme.dto.Goods;
import com.root.idme.dto.Photos;
import com.root.idme.util.Constant;

@Component
public class GoodsDao implements GoodsIDao {
	private static final Logger logger = LoggerFactory.getLogger(GoodsDao.class);
	
	private final SqlSession sqlSession;
	
	@Autowired
	public GoodsDao (SqlSession sqlSession) {
		// dao 객체 생성 시 Spring bean sqlSession 주입
		this.sqlSession = sqlSession;
		Constant.gDao = this;
	}
	
	// index page 메뉴로 표시될 값 select
	@Override
	public ArrayList<String> getCategory() {
		ArrayList<String> rst = new ArrayList<>();
		rst = (ArrayList)sqlSession.selectList("getCategory");
		return rst;
	}

	// index page 상품 리스트에 표시될 상품 리스트 select
	@Override
	public ArrayList<Goods> getGoodsList() {
		ArrayList<Goods> rst = new ArrayList<>();
		rst = (ArrayList)sqlSession.selectList("getGoodsList");
		return rst;
	}
	
	// index page 카테고리 메뉴 선택 시 특정 카테고리 상품 리스트 select
	@Override
	public ArrayList<Goods> getTypeGoodsList(String category) {
		ArrayList<Goods> rst = new ArrayList<>();
		rst = (ArrayList)sqlSession.selectList("getTypeGoodsList", category);
		return rst;
	}

	// index page 상품 리스트에 해당하는 상품 사진 select (대표 이미지만)
	@Override
	public ArrayList<Photos> getPhotoList(ArrayList<Goods> goodsList) {
		ArrayList<Photos> rst = new ArrayList<>();
		rst = (ArrayList)sqlSession.selectList("getPhotoList", goodsList);
		return rst;
	}
	
	// 상품 정보 select
	@Override
	public Goods getDetails(String gNo) {
		Goods goods = sqlSession.selectOne("goodsDetails", Integer.parseInt(gNo));
		return goods;
	}
	
	// detail page 특정 상품에 해당하는 상품 사진 전체 select
	@Override
	public ArrayList<Photos> getPhotoList(int gNo) {
		ArrayList<Photos> rst = new ArrayList<>();		
		rst = (ArrayList)sqlSession.selectList("getPhotoList2", gNo);
		return rst;
	}
	
}
