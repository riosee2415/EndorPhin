package kr.or.ddit.document.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.document.model.DocumentVo;

@Repository("documentDao")
public class DocumentDao implements IDocumentDao{

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertDocument(DocumentVo documentVo) {
		return sqlSessionTemplate.insert("document.insertDocument",documentVo);
	}
	
}
