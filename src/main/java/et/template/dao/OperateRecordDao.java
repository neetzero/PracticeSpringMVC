package et.template.dao;

import et.template.annotation.DataSource;
import et.template.config.DataSourceContextHolder;
import et.template.model.OperateRecord;

public interface OperateRecordDao {

	@DataSource(DataSourceContextHolder.LOCAL_DB)
	OperateRecord findByUser(Integer operatorId);

	@DataSource(DataSourceContextHolder.LOCAL_DB)
    int insertRecord(OperateRecord record);

	@DataSource(DataSourceContextHolder.LOCAL_DB)
    int insertRecordSelective(OperateRecord record);
	
}
