package kr.or.ddit.document.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.document.dao.IFilesDao;
import kr.or.ddit.document.model.FilesVo;

@Service
public class FilesService implements IFilesService{

	@Resource(name="filesDao")
	private IFilesDao filesDao;
	
	@Override
	public int insertFiles(FilesVo filesVo) {
		return filesDao.insertFiles(filesVo);
	}

}
