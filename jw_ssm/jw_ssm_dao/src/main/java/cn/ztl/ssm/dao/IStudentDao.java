package cn.ztl.ssm.dao;

import cn.ztl.ssm.domain.Product;
import cn.ztl.ssm.domain.Student;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Controller;

import java.util.List;

public interface IStudentDao {
    //查询所有学生
    @Select("select * from student")
    public List<Student> findAll() throws Exception;

    //插入学生
    @Insert("Insert into student(S_number,S_name,S_sex,S_age,S_academy,S_sclass,S_roomOfNumber,S_tel) " +
            "values(#{S_number},#{S_name},#{S_sex},#{S_age},#{S_academy},#{S_sclass},#{S_roomOfNumber},#{S_tel})")
    public void saveStudent(Student student) throws Exception;
}
