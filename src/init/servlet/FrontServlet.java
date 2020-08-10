package init.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;


public class FrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private Map<String ,Controller> controllerMap = new HashMap<>();
	
	@Override
	public void init() throws ServletException {
		String filePath = getInitParameter("configFileLocation");
		System.out.println("\n파일경로: "+filePath);
		String realPath = getServletContext().getRealPath(filePath);
		
		try (FileInputStream fis = new FileInputStream(realPath);){			
			Properties properties = new Properties();
			properties.load(fis);
			Enumeration<String> keys = (Enumeration<String>)properties.propertyNames();
			
			while(keys.hasMoreElements()) {
				String key = keys.nextElement();
				System.out.println("키 : " +key);
				String className = properties.getProperty(key);
				System.out.println("클래스이름 : "+className);
				
				Class<Controller> clazz = (Class<Controller>) Class.forName(className);
				
				Controller com = clazz.newInstance();
				System.out.println(com);
				
				controllerMap.put(key,com);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

    public FrontServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("작동");
		// 어떤 경로로 왔는지 파악, a.do b.do c.do
				String requestUri = request.getRequestURI();
				
				//localhost:8090/contextRoot/some/a.do
				String contextPath = request.getContextPath();
				int startIndex = requestUri.indexOf(contextPath);
				
				String uri = requestUri.substring(startIndex+contextPath.length(),requestUri.length());
				
				System.out.println(uri);
				
				Controller com = controllerMap.get(uri);
				String view ="";
//				System.out.println(com);
				try {
					view = com.process(request, response);	
					System.out.println("날아온 뷰코드 : "+view);
					System.out.println("요청 경로 : "+request.getServletPath());
				}catch(Throwable e) {
					throw new ServletException(e);
				}
				if(view != null ) {
					if(view.startsWith("redirect ")) {
						String redirectview = view.replace("redirect ", "");
						System.out.println("------------------------------------------------");
						System.out.println("리다이렉트 발생 : "+redirectview);
						System.out.println("------------------------------------------------");
						response.sendRedirect(request.getServletContext().getContextPath()+redirectview);
					}else {
						request.getRequestDispatcher(view).forward(request, response);
					}
				}
	}

}
