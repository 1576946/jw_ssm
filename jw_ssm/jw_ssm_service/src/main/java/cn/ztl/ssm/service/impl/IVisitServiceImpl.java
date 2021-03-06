package cn.ztl.ssm.service.impl;

import cn.ztl.ssm.dao.IVisitDao;
import cn.ztl.ssm.domain.VisitMan;
import cn.ztl.ssm.service.IVisitService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class IVisitServiceImpl implements IVisitService {
    @Autowired
    private IVisitDao iVisitDao;

    @Override
    public List<VisitMan> findAll(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page, size);
        return iVisitDao.findAll();
    }

    @Override
    public void saveVisit(VisitMan visitMan) throws Exception {
        iVisitDao.saveVisit(visitMan);
    }
}
