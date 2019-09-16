package com.bgs.boot0828.service;

import com.bgs.boot0828.pojo.ActiveData;
import com.bgs.boot0828.pojo.Area;
import com.bgs.boot0828.pojo.User;

import java.util.List;

public interface TreeService {
    List<Area> findAll();

    int update(Area area);

    int delete(Integer[] ids);

    int add(Area area);

    List<Area> findAreaAll(Integer id);

    int addUser(User user);

    List<ActiveData> findActiveData(Integer id);
}
