package kr.or.ddit.image.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.image.dao.IImagesDao;
import kr.or.ddit.image.model.ImagesVo;

@Service("imagesService")
public class ImagesService implements IImagesService{

	@Resource(name="imagesDao")
	IImagesDao imagesDao;
	
	@Override
	public int insertImages(ImagesVo imagesVo) {
		return imagesDao.insertImages(imagesVo);
	}

	@Override
	public List<ImagesVo> getAllImages() {
		return imagesDao.getAllImages();
	}

	@Override
	public ImagesVo selectImages(String imageCode) {
		return imagesDao.selectImages(imageCode);
	}

	@Override
	public int deleteImages(String imageCode) {
		return imagesDao.deleteImages(imageCode);
	}

	@Override
	public int updateImages(ImagesVo imagesVo) {
		return imagesDao.updateImages(imagesVo);
	}

}
