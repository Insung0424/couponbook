package sol.one.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@Log4j
public class AdminChkIntercepter implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 로그인 전에 권한 체크
		log.info("--- preHandle --- ");
		log.info("[preHandle][" + request + "]" + "[" + request.getMethod() + "]" 
        					+ request.getRequestURI());
		log.info("[handler][" + handler.toString() + "]");
        
        HttpSession session = request.getSession();
        if(session==null || session.getAttribute("admin")==null){
        	session.setAttribute("msg", "관리자만 접근 가능합니다.");
        	response.sendRedirect("/errorPage");
            return false;
        }

        return true;
    }
        

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		/* TODO Auto-generated method stub
		 * System.out.println("--- postHandle --- ");
		 * System.out.println("[ModelAndView][ model 이름 : " + modelAndView.getViewName()
		 * + "][ model 내용 :" + modelAndView.getModel() + "]" );
		 */
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
	}
	
	

}
