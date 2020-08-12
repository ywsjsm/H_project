package filter;

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


@WebFilter(urlPatterns= {"/modify.do","/delete.do","/withDrawal.do","/logout.do","/withDrawal/redirect.do",
		"/withDrawal/redirect.do","/delete/redirect.do","/comment/delete.do","/comments/write.do"})
public class CheckLoginFilter implements Filter {


    public CheckLoginFilter() {
    }


	public void destroy() {
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		System.out.println("==============================");
		System.out.println("로그인 필터 작동 ");
		System.out.println("==============================");
		
		HttpSession session =req.getSession();
		
		Object userInfo_ = session.getAttribute("userInfo");
		if(userInfo_ == null) {
			HttpServletResponse res = (HttpServletResponse)response;
			res.sendRedirect(req.getContextPath());
			return;
		}
		chain.doFilter(request, response);
	}


	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
