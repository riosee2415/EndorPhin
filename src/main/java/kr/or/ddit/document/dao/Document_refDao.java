package kr.or.ddit.document.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.document.model.Document_refVo;

@Repository("document_refDao")
public class Document_refDao implements IDocument_refDao{


	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertDocument_ref(Document_refVo document_refVo) {
		return sqlSessionTemplate.insert("document_ref.insertDocument_ref",document_refVo);
	}

	
}
