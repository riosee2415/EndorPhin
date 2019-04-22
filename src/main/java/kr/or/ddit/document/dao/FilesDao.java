package kr.or.ddit.document.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.document.model.FilesVo;

@Repository("filesDao")
public class FilesDao implements IFilesDao{

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertFiles(FilesVo filesVo) {
		return sqlSessionTemplate.insert("files.insertFiles",filesVo);
	}

}
