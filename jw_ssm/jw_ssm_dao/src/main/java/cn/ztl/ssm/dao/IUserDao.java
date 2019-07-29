package cn.ztl.ssm.dao;

import cn.ztl.ssm.domain.Admin;
import org.apache.ibatis.annotations.Select;

public interface IUserDao {
    @Select("select * from admin where username=#{username}")
    public Admin findByUsername(String username) throws Exception;
}
