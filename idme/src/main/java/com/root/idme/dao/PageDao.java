package com.root.idme.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.root.idme.dto.Product;
import com.root.idme.util.Constant;

@Component
public class PageDao implements PageIDao {
	private static final Logger logger = LoggerFactory.getLogger(PageDao.class);
	
	private final SqlSession sqlSession;
	
	@Autowired
	public PageDao (SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Constant.pBiz = this;
	}

	@Override
	public Product getTestData() {

		Product product = sqlSession.selectOne("selectTestProduct");
		
		logger.info(product.getpName());
		
		return product;
	}
	
	
}
