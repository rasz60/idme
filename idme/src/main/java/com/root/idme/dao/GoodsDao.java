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
		
		System.out.println(gNo);
		
		Goods goods = sqlSession.selectOne("goodsDetails", Integer.parseInt(gNo));
		
		logger.info(goods.getgName());
		
		return goods;
	}
	
	@Override
	public ArrayList<String> getCategory() {
		ArrayList<String> rst = new ArrayList<>();
		
		rst = (ArrayList)sqlSession.selectList("getCategory");
		
		return rst;
	}

	@Override
	public ArrayList<Goods> getGoodsList() {
		ArrayList<Goods> rst = new ArrayList<>();
		
		rst = (ArrayList)sqlSession.selectList("getGoodsList");
		
		return rst;
	}

	@Override
	public ArrayList<Goods> getTypeGoodsList(String category) {
		ArrayList<Goods> rst = new ArrayList<>();
		
		rst = (ArrayList)sqlSession.selectList("getTypeGoodsList", category);
		
		return rst;
	}

	@Override
	public ArrayList<Photos> getPhotoList(ArrayList<Goods> goodsList) {
		ArrayList<Photos> rst = new ArrayList<>();
		
		rst = (ArrayList)sqlSession.selectList("getPhotoList", goodsList);
		
		return rst;
	}
	
	@Override
	public ArrayList<Photos> getPhotoList(int gNo) {
		ArrayList<Photos> rst = new ArrayList<>();
		
		rst = (ArrayList)sqlSession.selectList("getPhotoList2", gNo);
		
		return rst;
	}
	
}
