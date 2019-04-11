package kr.or.ddit.image.service;

import java.util.List;

import kr.or.ddit.image.model.ImagesVo;

public interface IImagesService {
	int insertImages(ImagesVo imagesVo);
	List<ImagesVo> getAllImages();
	ImagesVo selectImages(String imageCode);
	int deleteImages(String imageCode);
	int updateImages(ImagesVo imagesVo);
}
