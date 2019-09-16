package com.bgs.boot0828.mapper;

import com.bgs.boot0828.pojo.ActiveData;
import com.bgs.boot0828.pojo.Area;
import com.bgs.boot0828.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TreeMapper {
    List<Area> findAll();

    int update(Area area);

    int delete(@Param("ids") Integer[] ids);

    int add(Area area);

    List<Area> findAreaAll(Integer id);

    int addUser(User user);

    List<ActiveData> findActiveData(@Param("id") Integer id);
}
