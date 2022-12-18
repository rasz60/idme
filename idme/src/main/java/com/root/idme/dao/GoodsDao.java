package com.root.idme.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.root.idme.dto.Goods;
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
	public Goods getDetails() {

		Goods goods = sqlSession.selectOne("goodsDetails");
		
		logger.info(goods.getgName());
		
		return goods;
	}
	
	
}
