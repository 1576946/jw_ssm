package cn.ztl.ssm.service;

import cn.ztl.ssm.domain.Student;


import java.util.List;

public interface IStudentService {
    public List<Student> findAll(Integer page, Integer size) throws Exception;

    public void saveStudent(Student student) throws Exception;
}
