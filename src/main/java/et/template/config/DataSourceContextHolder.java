package et.template.config;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;


public class DataSourceContextHolder extends AbstractRoutingDataSource {
    private static final ThreadLocal<String> dataSourceKey = new InheritableThreadLocal<String>();

    public static final String LOCAL_DB="localDB";
    
    public static final String TEST_DB="testDB";

    public static final String OPERATING_DB="operatingDB";
    
    public static void setDataSource(String dataSource) {
        dataSourceKey.set(dataSource);
    }

	public static void clearDataSource() {
		dataSourceKey.remove();
	}
	
    public static String getDataSource() {
        return dataSourceKey.get();
    }
    
    @Override
    protected Object determineCurrentLookupKey() {
        return dataSourceKey.get();
    }
}