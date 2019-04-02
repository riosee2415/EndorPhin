package kr.or.ddit.constant;

import java.util.HashMap;
import java.util.Map;

public class SalesCodeConstant {


	
		// 매출코드
		public static final Map<String,String> salesCode = new HashMap<String,String>();
			static {
				salesCode.put("11", "과세매출");
				salesCode.put("12", "영세율");
				salesCode.put("13", "계산서");
				salesCode.put("14", "과세무증빙");
				salesCode.put("15", "간이과세");
				salesCode.put("16", "수출L/C");
				salesCode.put("17", "카드과세");
				salesCode.put("18", "카드면세");
				salesCode.put("19", "카드영세");
				salesCode.put("20", "면세무증빙");
				salesCode.put("21", "전자화폐");
				salesCode.put("22", "현금과세");
				salesCode.put("23", "현금면세");
				salesCode.put("24", "현금영세");
			}
	
	
		// 매입코드
		public static final Map<String,String> purchaseCode = new HashMap<String,String>();
			static {
				purchaseCode.put("51", "과세매입");
				purchaseCode.put("52", "영세율");
				purchaseCode.put("53", "계산서");
				purchaseCode.put("54", "불공");
				purchaseCode.put("55", "수입분");
				purchaseCode.put("56", "금전등록");
				purchaseCode.put("57", "카드과세");
				purchaseCode.put("58", "카드면세");
				purchaseCode.put("59", "카드영세");
				purchaseCode.put("60", "무증빙");
				purchaseCode.put("61", "현금과세");
				purchaseCode.put("62", "현금면세");
			}
		
		
		
	
}
