package kr.or.ddit.image.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import kr.or.ddit.employee.service.IEmployeeService;
import kr.or.ddit.image.model.ImagesVo;
import kr.or.ddit.image.service.IImagesService;

@RequestMapping("/images")
@Controller
public class ImagesController {

	@Resource(name="imagesService")
	IImagesService imagesService;
	
	@Resource(name="employeeService")
	IEmployeeService employeeService;
	
	@RequestMapping(path="/insOrUpdImages")
	public String insertImages(String imageCode,String userId,MultipartRequest multparts) 
								throws IllegalStateException, IOException{
		if(multparts != null){
			MultipartFile file = multparts.getFile("fileName");
			String realPath ="c:\\picture\\"; // 경로설정
			String realName = UUID.randomUUID().toString();
			
			ImagesVo imagesVo = new ImagesVo(file.getOriginalFilename()
					,realPath,realName);
			
			if(userId!=null&&!(userId.equals(""))){
				imagesVo.setUserId(userId);
			}
			
			if (file.getSize() > 0) {
				int extendIndex = file.getOriginalFilename().lastIndexOf(".");
				file.transferTo(new File(realPath+realName+file.getOriginalFilename().substring(extendIndex)));
				if(imageCode==null)
					imagesService.insertImages(imagesVo);
				else if(imageCode!=null){
					imagesVo.setImageCode(imageCode);
					imagesService.updateImages(imagesVo);
				}
				return imagesVo.getImageCode(); // 이미지 번호 반환
			}
		}	
		return null;
	}
}
