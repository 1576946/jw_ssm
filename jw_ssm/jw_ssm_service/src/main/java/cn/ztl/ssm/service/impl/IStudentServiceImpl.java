package cn.ztl.ssm.service.impl;

import cn.ztl.ssm.dao.IStudentDao;
import cn.ztl.ssm.domain.Product;
import cn.ztl.ssm.domain.Student;
import cn.ztl.ssm.service.IStudentService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class IStudentServiceImpl implements IStudentService {
    @Autowired
    private IStudentDao iStudentDao;

    @Override
    public List<Student> findAll(int page, int size) throws Exception {
        PageHelper.startPage(page, size);
        return iStudentDao.findAll();
    }

    @Override
    public void saveStudent(Student student) throws Exception {
        iStudentDao.saveStudent(student);
    }
}
