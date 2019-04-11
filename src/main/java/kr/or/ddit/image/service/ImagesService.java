package kr.or.ddit.image.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import kr.or.ddit.image.dao.IImagesDao;
import kr.or.ddit.image.model.ImagesVo;

@Service("imagesService")
public class ImagesService implements IImagesService{

	@Resource(name="imagesDao")
	IImagesDao imagesDao;

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
	public String updateOrInsertImages(ImagesVo imagesVo, MultipartRequest multparts) throws IllegalStateException, IOException {
		if(multparts != null){
			MultipartFile file = multparts.getFile("fileName");
			imagesVo.setImageRealpath("c:\\picture\\"); // 경로설정
			imagesVo.setImageRealname(UUID.randomUUID().toString());
			imagesVo.setImageName(file.getOriginalFilename());
			
			if (file.getSize() > 0) {
				int extendIndex = file.getOriginalFilename().lastIndexOf(".");
				file.transferTo(new File(imagesVo.getImageRealpath()+imagesVo.getImageRealname()
						+file.getOriginalFilename().substring(extendIndex)));
				if(imagesVo.getImageCode()==null)
					imagesDao.insertImages(imagesVo);
				else{
					imagesDao.updateImages(imagesVo);
				}
			}
		}
		return imagesVo.getImageCode();
	}

}
