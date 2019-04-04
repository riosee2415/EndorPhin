package kr.or.ddit.Attitude.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.payment.model.PaymentVo;
import kr.or.ddit.payment.service.IPaymentService;


@Controller
public class ExcelController {
	
	@Resource(name="paymentService")
	IPaymentService paymentService;
	
	@RequestMapping(value = "/paymentPersonalExceldown")
	public void excelDown(HttpServletResponse response,String userid, String paydayTo,String paydayFrom) throws Exception {
		
		String[] paymentPersonal = {"사번","성명","지급일자",	"부서명","총급여액","총공제액","총지급액"};
		
		// 게시판 목록조회
		
		Map<String, Object> map = new HashMap<>();
		map.put("paydayTo", paydayTo);
		map.put("paydayFrom", paydayFrom);
		map.put("userid", userid);
		
		List<PaymentVo> list = paymentService.selectPersonalPaymentList(map);

		// 워크북 생성

		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("개인별 급여 조회");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;

		// 테이블 헤더용 스타일

		CellStyle headStyle = wb.createCellStyle();

		// 가는 경계선을 가집니다.

		headStyle.setBorderTop(BorderStyle.THIN);

		headStyle.setBorderBottom(BorderStyle.THIN);

		headStyle.setBorderLeft(BorderStyle.THIN);

		headStyle.setBorderRight(BorderStyle.THIN);

		// 배경색은 노란색입니다.

		headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());

		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

		// 데이터는 가운데 정렬합니다.

		headStyle.setAlignment(HorizontalAlignment.CENTER);

		// 데이터용 경계 스타일 테두리만 지정

		CellStyle bodyStyle = wb.createCellStyle();

		bodyStyle.setBorderTop(BorderStyle.THIN);

		bodyStyle.setBorderBottom(BorderStyle.THIN);

		bodyStyle.setBorderLeft(BorderStyle.THIN);

		bodyStyle.setBorderRight(BorderStyle.THIN);

		// 헤더 생성

		row = sheet.createRow(rowNo++);
		row.createCell(0);
		
		for (int i = 0; i < paymentPersonal.length; i++) {
			cell = row.createCell(i);
			
			cell.setCellStyle(headStyle);
			
			cell.setCellValue(paymentPersonal[i]);
		}
		
		// 데이터 부분 생성

		for (PaymentVo vo : list) {

			row = sheet.createRow(rowNo++);

			cell = row.createCell(0);

			cell.setCellStyle(bodyStyle);

			cell.setCellValue(vo.getUserId());

			cell = row.createCell(1);

			cell.setCellStyle(bodyStyle);

			cell.setCellValue(vo.getUsernm());

			cell = row.createCell(2);

			cell.setCellStyle(bodyStyle);

			cell.setCellValue(vo.getPayDay());
			
			cell = row.createCell(3);
			
			cell.setCellStyle(bodyStyle);
			
			cell.setCellValue(vo.getDeptname());
			
			cell = row.createCell(4);
			
			cell.setCellStyle(bodyStyle);
			
			cell.setCellValue(vo.getTotalSalary());
			
			cell = row.createCell(5);
			
			cell.setCellStyle(bodyStyle);
			
			cell.setCellValue(vo.getTotalWage());
			
			cell = row.createCell(6);
			
			cell.setCellStyle(bodyStyle);
			
			cell.setCellValue(Integer.parseInt(vo.getTotalSalary())-Integer.parseInt(vo.getTotalWage()));
			

		}

		// 컨텐츠 타입과 파일명 지정

		response.setContentType("ms-vnd/excel");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		response.setHeader("Content-Disposition", "attachment;filename="+sdf.format(new Date())+"_paymentInfo.xls");

		// 엑셀 출력

		wb.write(response.getOutputStream());

		wb.close();

	}
}
