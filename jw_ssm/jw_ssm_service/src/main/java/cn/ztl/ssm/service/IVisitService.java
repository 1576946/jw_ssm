package cn.ztl.ssm.service;

import cn.ztl.ssm.domain.VisitMan;

import java.util.List;

public interface IVisitService {

    public List<VisitMan> findAll(Integer page, Integer size) throws Exception;

    public void saveVisit(VisitMan visitMan) throws Exception;
}
