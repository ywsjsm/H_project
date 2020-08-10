package init;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;



public class AddContestPathListener implements ServletContextListener {

    public AddContestPathListener() {
    }


    public void contextDestroyed(ServletContextEvent sce)  { 
    }

    public void contextInitialized(ServletContextEvent sce)  { 
        ServletContext applicatiocn = sce.getServletContext();
        applicatiocn.setAttribute("contextPath", applicatiocn.getContextPath());
    }
	
}
