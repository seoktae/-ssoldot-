package org.ssoldot.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.ssoldot.domain.FileVO;

public class UploadDAOImpl implements UploadDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "org.ssoldot.mapper.UploadMapper";
	
	
}
