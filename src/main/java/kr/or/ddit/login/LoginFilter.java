package kr.or.ddit.login;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.employee.model.EmployeeVo;

@WebFilter("/*")
public class LoginFilter implements Filter{


	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest hsr = (HttpServletRequest) request;
		HttpServletResponse hsresp = (HttpServletResponse) response;
		
		HttpSession session = hsr.getSession();
		EmployeeVo employeeVo =(EmployeeVo) session.getAttribute("employeeVo");
		
		// 2-1. 정상 로그인 상태이면 --> chain.doFilter 호출
		if(employeeVo!=null)
			chain.doFilter(request, response);
		
		// 2-2. 로그인 상태가 아니라면 --> 로그인 화면으로 이동 (/login get)
		
		// *** 모든 페이지에 대해 적용 해야하나??
		// 세션이 필요한 페이지랑, 필요 없는 페이지 구분 필요
		// 세션 검증이 필요없는 요청 (대다수는 검증이 필요함
		// ** login 페이지 화면요청(/login get) session 검증이 필요 없음
		// ** login 요청 처리(/login post) session 검증이 필요 없음
		// ** /js/*, /css/* 폴더 하위 모든 파일
		// ex) localhost/login
		else{
			String uri = hsr.getRequestURI();	// /login
			if(uri.equals("/login")|| uri.startsWith("/js")
					||uri.endsWith(".css")
					||uri.endsWith(".jpg")
					||uri.endsWith(".jpeg")
					||uri.endsWith(".gif")
					||uri.endsWith(".png")
					){
				chain.doFilter(request, response);
			}else{
				hsresp.sendRedirect("/login");
			}
		}
		
	}

	@Override
	public void destroy() {
		
	}
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}
