package com.bgs.boot0828.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class ActiveData {

  private Integer id;
  private String userName;
  private String planTable;
  private Integer forecastId;
  private Integer actualNum;
  private String newClient;
  private String oldClient;
  private String potentialClient;
  private String money;
  @JsonFormat(pattern = "yyyy-MM-dd")
  private Date createtime;
  private String status;
  @JsonFormat(pattern = "yyyy-MM-dd")
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date activityTime;
  private long areaId;
  private Integer userId;


  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Integer getForecastId() {
    return forecastId;
  }

  public void setForecastId(Integer forecastId) {
    this.forecastId = forecastId;
  }

  public Integer getActualNum() {
    return actualNum;
  }

  public void setActualNum(Integer actualNum) {
    this.actualNum = actualNum;
  }

  public void setUserId(Integer userId) {
    this.userId = userId;
  }

  public String getNewClient() {
    return newClient;
  }

  public void setNewClient(String newClient) {
    this.newClient = newClient;
  }


  public String getOldClient() {
    return oldClient;
  }

  public void setOldClient(String oldClient) {
    this.oldClient = oldClient;
  }


  public String getPotentialClient() {
    return potentialClient;
  }

  public void setPotentialClient(String potentialClient) {
    this.potentialClient = potentialClient;
  }


  public String getMoney() {
    return money;
  }

  public void setMoney(String money) {
    this.money = money;
  }


  public Date getCreatetime() {
    return createtime;
  }

  public void setCreatetime(Date createtime) {
    this.createtime = createtime;
  }

  public Date getActivityTime() {
    return activityTime;
  }

  public void setActivityTime(Date activityTime) {
    this.activityTime = activityTime;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getPlanTable() {
    return planTable;
  }

  public void setPlanTable(String planTable) {
    this.planTable = planTable;
  }

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }





  public long getAreaId() {
    return areaId;
  }

  public void setAreaId(long areaId) {
    this.areaId = areaId;
  }

  public Integer getUserId() {
    return userId;
  }
}
