package jdbc;

import java.io.IOException;
import java.io.StringReader;
import java.sql.DriverManager;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

/**
 * Application Lifecycle Listener implementation class DBCPInitListener
 *
 */
@WebListener
public class DBCPInitListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public DBCPInitListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
    	AbandonedConnectionCleanupThread.checkedShutdown();
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
    	String poolConfig = sce.getServletContext().getInitParameter("poolConfig");
		Properties prop = new Properties();

		try {
			prop.load(new StringReader(poolConfig));
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("config load fail", e);
		}
		loadJDBCDriver(prop);
		initConnectionPool(prop);
    }
    
    // JDBC 드라이버 로드
    private void loadJDBCDriver(Properties prop) {
		String driverClass = prop.getProperty("jdbcDriver");

		try {
			Class.forName(driverClass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new RuntimeException(
					"fail to load JDBC Driver", e);
		}
	}
    
    private void initConnectionPool(Properties prop) {
		try {
			String jdbcUrl = prop.getProperty("jdbcUrl");
			String username = prop.getProperty("dbUser");
			String pw = prop.getProperty("dbPass");

			// 커넥션팩토리생성
			ConnectionFactory connFactory = new DriverManagerConnectionFactory(jdbcUrl, username, pw);
			
			// 커넥션 풀 팩토리 생성
			PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
			String validationQuery = prop.getProperty("validationQuery");
			if (validationQuery != null && !validationQuery.isEmpty()) {
				poolableConnFactory.setValidationQuery(validationQuery);
			}

			// 커넥션 풀 설정 정보 설정
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			poolConfig.setTimeBetweenEvictionRunsMillis(1000 * 60 * 5);
			poolConfig.setTestWhileIdle(true);
			int minIdle = getIntProperty(prop, "minIdle", 5);
			poolConfig.setMinIdle(minIdle);
			int maxTotal = getIntProperty(prop, "maxTotal", 50);
			poolConfig.setMaxTotal(maxTotal);

			// 커넥션 풀 생성
			GenericObjectPool<PoolableConnection> connectionPool = new GenericObjectPool<>(poolableConnFactory, poolConfig);
			poolableConnFactory.setPool(connectionPool);

			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			String poolName = prop.getProperty("poolName");
			driver.registerPool(poolName, connectionPool);

		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}

	}
    
    // Property정보 String -> int 변환
    private int getIntProperty(Properties prop, String propName, int defaultValue) {
		String value = prop.getProperty(propName);
		if (value == null) {
			return defaultValue;
		}
		return Integer.parseInt(value);
	}
	
}
