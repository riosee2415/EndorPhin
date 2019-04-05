package kr.or.ddit.constant;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class SalesCodeConstant {
	
	// 매출코드
	public static final Map<String, String> salesCode = new HashMap<String, String>();
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
	public static final Map<String, String> purchaseCode = new HashMap<String, String>();
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

	//정률법 //정액법
	public static final LinkedHashMap<String, String> straight = new LinkedHashMap<String, String>();
	static {
		straight.put("0.500", "0.777");
		straight.put("0.333", "0.632");
		straight.put("0.250", "0.528");
		straight.put("0.200", "0.451");
		straight.put("0.166", "0.394");
		straight.put("0.142", "0.349");
		straight.put("0.125", "0.313");
		straight.put("0.111", "0.284");
		straight.put("0.100", "0.259");
		straight.put("0.090", "0.239");
		straight.put("0.083", "0.221");
		straight.put("0.076", "0.206");
		straight.put("0.071", "0.193");
		straight.put("0.066", "0.182");
		straight.put("0.062", "0.171");
		straight.put("0.058", "0.162");
		straight.put("0.055", "0.154");
		straight.put("0.052", "0.146");
		straight.put("0.050", "0.140");
		straight.put("0.048", "0.133");
		straight.put("0.046", "0.128");
		straight.put("0.044", "0.123");
		straight.put("0.042", "0.118");
		straight.put("0.040", "0.113");
		straight.put("0.039", "0.109");
		straight.put("0.037", "0.106");
		straight.put("0.036", "0.102");
		straight.put("0.035", "0.099");
		straight.put("0.034", "0.096");
		straight.put("0.033", "0.093");
		straight.put("0.032", "0.090");
		straight.put("0.031", "0.090");
		straight.put("0.030", "0.085");
		straight.put("0.029", "0.085");
		straight.put("0.028", "0.080");
		straight.put("0.027", "0.078");
		straight.put("0.027", "0.076");
		straight.put("0.026", "0.074");
		straight.put("0.025", "0.073");
		straight.put("0.025", "0.071");
		straight.put("0.024", "0.069");
		straight.put("0.024", "0.068");
		straight.put("0.024", "0.066");
		straight.put("0.024", "0.065");
		straight.put("0.022", "0.064");
		straight.put("0.022", "0.062");
		straight.put("0.021", "0.061");
		straight.put("0.021", "0.060");
		straight.put("0.020", "0.059");
		straight.put("0.020", "0.059");
		straight.put("0.020", "0.056");
		straight.put("0.019", "0.055");
		straight.put("0.019", "0.054");
		straight.put("0.019", "0.054");
		straight.put("0.018", "0.053");
		straight.put("0.018", "0.052");
		straight.put("0.018", "0.051");
		straight.put("0.017", "0.050");
		straight.put("0.017", "0.049");
	}
	
	
	// 정률법
	public static final Map<String, String> declining = new HashMap<String, String>();
	static {
		
		declining.put("2", " ");
		declining.put("3", " ");
		declining.put("4", " ");
		declining.put("5", " ");
		declining.put("6", " ");
		declining.put("7", " ");
		declining.put("8", " ");
		declining.put("9", " ");
		declining.put("10", "");
		
		declining.put("11", "");
		declining.put("12", "");
		declining.put("13", "");
		declining.put("14", "");
		declining.put("15", "");
		declining.put("16", "");
		declining.put("17", "");
		declining.put("18", "");
		declining.put("19", "");
		declining.put("20", "");
		
		declining.put("21", "");
		declining.put("22", "");
		declining.put("23", "");
		declining.put("24", "");
		declining.put("25", "");
		declining.put("26", "");
		declining.put("27", "");
		declining.put("28", "");
		declining.put("29", "");
		declining.put("30", "");
		
		declining.put("31", "");
		declining.put("32", "");
		declining.put("33", "");
		declining.put("34", "");
		declining.put("35", "");
		declining.put("36", "");
		declining.put("37", "");
		declining.put("38", "");
		declining.put("39", "");
		declining.put("40", "");
		
		declining.put("41", "");
		declining.put("42", "");
		declining.put("43", "");
		declining.put("44", "");
		declining.put("45", "");
		declining.put("46", "");
		declining.put("47", "");
		declining.put("48", "");
		declining.put("49", "");
		declining.put("50", "");
		
		declining.put("51", "");
		declining.put("52", "");
		declining.put("53", "");
		declining.put("54", "");
		declining.put("55", "");
		declining.put("56", "");
		declining.put("57", "");
		declining.put("58", "");
		declining.put("59", "");
		declining.put("60", "");
	}
	
	
	 
}
