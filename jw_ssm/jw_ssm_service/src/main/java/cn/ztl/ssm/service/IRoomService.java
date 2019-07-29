package cn.ztl.ssm.service;

import cn.ztl.ssm.domain.Rooming;
import cn.ztl.ssm.domain.Rooming_emergency;

import java.util.List;

public interface IRoomService {

    public List<Rooming> findAll() throws Exception;

    public void saveMiss(Rooming_emergency rooming_emergency) throws Exception;


    public void addHome(Rooming rooming) throws Exception;
}
