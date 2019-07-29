package cn.ztl.ssm.service.impl;

import cn.ztl.ssm.dao.IRoomingDao;
import cn.ztl.ssm.domain.Rooming;
import cn.ztl.ssm.domain.Rooming_emergency;
import cn.ztl.ssm.service.IRoomService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class IRoomServiceImpl implements IRoomService {
    @Autowired
    private IRoomingDao iRoomingDao;

    @Override
    public List<Rooming> findAll(Integer page, Integer size) throws Exception {
        // PageHelper.startPage(1,5);
        PageHelper.startPage(page, size);
        return iRoomingDao.findAll();
    }

    @Override
    public void saveMiss(Rooming_emergency rooming_emergency) throws Exception {
        iRoomingDao.saveMiss(rooming_emergency);
    }

    @Override
    public void addHome(Rooming rooming) throws Exception {
        iRoomingDao.saveRooming(rooming);
    }
}
