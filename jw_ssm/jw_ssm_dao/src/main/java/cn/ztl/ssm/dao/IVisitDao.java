package cn.ztl.ssm.dao;

import cn.ztl.ssm.domain.VisitMan;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IVisitDao {
    @Select("select * from visitman")
    public List<VisitMan> findAll() throws Exception;

    @Insert("insert into visitman (theme_cause,theme_enter,theme_out,theme_name,theme_causeContext) values(#{theme_cause},#{theme_enter},#{theme_out},#{theme_name},#{theme_causeContext})")
    public void saveVisit(VisitMan visitMan) throws Exception;
}
