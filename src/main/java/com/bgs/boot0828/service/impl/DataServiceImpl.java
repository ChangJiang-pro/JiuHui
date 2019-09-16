package com.bgs.boot0828.service.impl;

import com.bgs.boot0828.mapper.DataMapper;
import com.bgs.boot0828.pojo.ActiveData;
import com.bgs.boot0828.pojo.Forecast;
import com.bgs.boot0828.pojo.Gallery;
import com.bgs.boot0828.service.DataService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DataServiceImpl implements DataService {
    @Resource
    private DataMapper dataMapper;

    @Override
    public int addPlan(Forecast forecast) {
        return dataMapper.addPlan(forecast);
    }

    @Override
    public List<Forecast> findPlanAll() {
        return dataMapper.findPlanAll();
    }

    @Override
    public int addActiveData(ActiveData activeData) {
        return dataMapper.addActiveData(activeData);
    }

    @Override
    public int addPicture(Gallery gallery) {
        return dataMapper.addPicture(gallery);
    }

    @Override
    public Integer getId() {
        return dataMapper.getId();
    }

    @Override
    public int delForecast(Integer id) {
        return dataMapper.delForecast(id);
    }
}
