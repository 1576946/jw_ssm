package cn.ztl.ssm.dao;

import cn.ztl.ssm.domain.Rooming;
import cn.ztl.ssm.domain.Rooming_emergency;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import java.util.List;

public interface IRoomingDao {
    @Select("select * from rooming")
    public List<Rooming> findAll() throws Exception;

    //宿舍紧急情况进行存储
    @Insert("insert into rooming_emergency(R_theme,R_time,R_context,R_is_solve) values(#{R_theme},#{R_time},#{R_context},#{R_is_solve})")
    public void saveMiss(Rooming_emergency rooming_emergency) throws Exception;

    //增加宿舍
    @Insert("insert into rooming(S_roomOfNumber,numberOfPeople,waterOfFee,electricOfFee,errorOfAppliance)values(#{S_roomOfNumber},#{numberOfPeople},#{waterOfFee},#{electricOfFee},#{errorOfAppliance})")
    public void saveRooming(Rooming rooming) throws Exception;

}
