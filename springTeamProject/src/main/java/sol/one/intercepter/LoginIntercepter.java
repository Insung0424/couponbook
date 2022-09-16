package sol.one.intercepter;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import sol.one.VO.MemberVO;

public class LoginIntercepter extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		MemberVO mem = (MemberVO) session.getAttribute("mem");
		
		if(mem == null) {
			PrintWriter printwriter = response.getWriter();
			printwriter.print("<script>alert('로그인후 이용할 수 있습니다'); history.go(-1); </script>");

			printwriter.flush();

			printwriter.close();
			return false;
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		/*
		 *  로그인 기록용 파일을 만들어서 로그인 기록 추적?
		 */
		
	}

}
