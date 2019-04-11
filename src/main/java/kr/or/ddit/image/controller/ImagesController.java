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
	
}
