package com.bgs.boot0828.service;

import com.bgs.boot0828.pojo.ActiveData;
import com.bgs.boot0828.pojo.Forecast;
import com.bgs.boot0828.pojo.Gallery;

import java.util.List;

public interface DataService {
    int addPlan(Forecast forecast);

    List<Forecast> findPlanAll();

    int addActiveData(ActiveData activeData);

    int addPicture(Gallery gallery);

    Integer getId();

    int delForecast(Integer id);
}
