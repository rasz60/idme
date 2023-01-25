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
		this.sqlSession = sqlSession;
		Constant.gDao = this;
	}
	

	@Override
	public Goods getDetails(String gNo) {

		Goods goods = sqlSession.selectOne("goodsDetails",gNo);
		logger.info(gNo);
		logger.info(goods.getgName());
		
		return goods;
	}
	
	@Override
	public ArrayList<Goods> getGoodsList() {
		ArrayList<Goods> allData = new ArrayList<>();
		allData = (ArrayList)sqlSession.selectList("getGoodsList");
		return allData;
	}
	
	// index page 메뉴로 표시될 값 select
	@Override
	public ArrayList<String> getCategory() {
		ArrayList<String> rst = new ArrayList<>();
		rst = (ArrayList)sqlSession.selectList("getCategory");
		return rst;
	}
	
	@Override
	public ArrayList<Photos> getPhotoList(int gNo) {
		ArrayList<Photos> rst = new ArrayList<>();
		rst = (ArrayList)sqlSession.selectList("getPhotoList",gNo);
		return rst;
	}
	
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
		rst = (ArrayList)sqlSession.selectList("getPhotoList2", goodsList);
		return rst;
	}


	@Override
	public ArrayList<Goods> getGoodsPage(int page) {
		// TODO Auto-generated method stub
		ArrayList<Goods> rst = new ArrayList<>();
		rst = (ArrayList)sqlSession.selectList("getGoodsPage", page);
		return null;
	}	
}
