package com.bgs.boot0828.service.impl;

import com.bgs.boot0828.mapper.TreeMapper;
import com.bgs.boot0828.pojo.ActiveData;
import com.bgs.boot0828.pojo.Area;
import com.bgs.boot0828.pojo.User;
import com.bgs.boot0828.service.TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class TreeServiceImpl implements TreeService {
    @Resource
    private TreeMapper treeMapper;

    @Override
    public List<Area> findAll() {
        return treeMapper.findAll();
    }

    @Override
    public int update(Area area) {
        return treeMapper.update(area);
    }

    @Override
    public int delete(Integer[] ids) {
        return treeMapper.delete(ids);
    }

    @Override
    public int add(Area area) {
        return treeMapper.add(area);
    }

    @Override
    public List<Area> findAreaAll(Integer id) {
        return treeMapper.findAreaAll(id);
    }

    @Override
    public int addUser(User user) {
        return treeMapper.addUser(user);
    }

    @Override
    public List<ActiveData> findActiveData(Integer id) {
        return treeMapper.findActiveData(id);
    }
}
