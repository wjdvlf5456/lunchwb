package com.lunchwb.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AloneDao {
	
	@Autowired
	private SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(AloneDao.class);
	
	
	
	

}
