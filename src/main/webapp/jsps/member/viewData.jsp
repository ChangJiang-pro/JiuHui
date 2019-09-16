<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/28
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
</head>
<body>
    <div style="width: 1200px;margin: 0 auto;">
        <div class="row" style="margin-top: 20px;">
            <%@include file="/common/left.jsp"%>
            <div class="col-sm-9">
                <form id="date_form" method="post" class="form-horizontal">
                    <div class="form-group">
                        <span class="col-sm-1">
                            <h5>开始：</h5>
                        </span>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="begin" style="width: 150px" placeholder="选择日期">
                        </div>
                        <span class="col-sm-1"><h5>结束：</h5></span>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" id="end" style="width: 150px" placeholder="选择日期">
                        </div>
                        <div class="col-sm-3">
                           <input type="button" class="btn btn-primary" id="date_btn" value="搜索">
                           <input type="button" class="btn btn-primary" id="poi_btn" value="导出活动数据">
                        </div>
                    </div>
                </form>
                <ul class="nav nav-tabs" id="myTabs">
                    <li class="active"><a href="#echarts" aria-controls="echarts" data-toggle="tab" id="echartsTab">统计图</a></li>
                    <li><a href="#list" aria-controls="list" data-toggle="tab" id="listTab">详细信息列表</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="echarts">
                       <div id="container" style="height: 100%;"></div>
                    </div>
                    <input type="hidden" id="user_name" value="${user.name}">
                <div class="tab-pane" id="list">
                    <table id="list_tab"></table>
                </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    $(function () {
            $("#list_tab").bootstrapTable({
                url:'${pageContext.request.contextPath}/tree/findActiveData',
                method:'post',//提交方式
                contentType:"application/x-www-form-urlencoded; charset=UTF-8",//发送到服务器的编码类型
                striped:true,
                pageNumber:1,
                pageSize:8,
                pageList:[6,7,8],
                pagination:true,//开启分页
                sidePagination:"client",//分页方式 'client'为客户端分页
                sortName:'id',//排序需要的属性
                sortOrder:'asc',//排序方式
                cache:false,//是否使用缓存
                //showColumns:true,
                queryParams:function(param){//请求参数 封装的表格对象
                    return{
                        id:$("#tab_id").val()
                    }
                },
                columns:[
                    {
                        title:'序号',//表头名
                        formatter :function (value,row,index){
                            return index+1;
                        }
                    },{
                        field:'userName',
                        title:'机构名称'
                    },{
                        field:'planTable',
                        title:'计划召开桌数'
                    },{
                        field:'actualNum',
                        title:'实际召开桌数'
                    },{
                        title:'执行率',
                        formatter:function (value,row,index) {
                            return "100%";
                        }
                    },{
                        field:'newClient',
                        title:'新客户'
                    },{
                        field:'oldClient',
                        title:'老客户'
                    },{
                        field:'potentialClient',
                        title:'意向客户'
                    },{
                        field:'money',
                        title:'预估保费'
                    }
                ]
            });
        //时间查询
        $("#begin").datetimepicker({
            format: "yyyy-mm-dd hh:ii:ss",
            minView: 1,
            autoclose: true,
            todayBtn: true,
            language: 'zh-CN'
        })
        $("#end").datetimepicker({
            format: "yyyy-mm-dd hh:ii:ss",
            minView: 1,
            autoclose: true,
            todayBtn: true,
            language: 'zh-CN'
        })
    })

    //地图
    var charts=[];
    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app = {};
    option = null;
    myChart.showLoading();
    charts.push(myChart)
    var username=$("#user_name").val();
 /*   $.ajax({
        type: "post",
        dataType: "json",
        url: "/manager02/Filine",
        data:{},
        processData:false,

    });*/
    $.get('/map/json/province/shandong.json', function (geoJson) {

        myChart.hideLoading();

        echarts.registerMap('SD', geoJson);

        myChart.setOption(option = {
            title: {
                text: username+'各市预估保费统计图 （2019）',
            },
            tooltip: {
                trigger: 'item',
                formatter: '{b}<br/>{c} (p / km2)'
            },
            visualMap: {
                  min: 800,
                  max: 50000,
                  text:['High','Low'],
                  realtime: false,
                  calculable: true,
                  inRange: {
                      color: ['lightskyblue','yellow', 'orangered']
                  }
            },
            series: [
                {
                    name: '山东省人口密度',
                    type: 'map',
                    mapType: 'SD', // 自定义扩展图表类型
                    layoutCenter: ['30%', '30%'],
                    layoutSize:'500',
                    itemStyle:{
                        normal:{label:{show:true}},
                        emphasis:{label:{show:true}}
                    },
                data:[
                    {name: '潍坊市', value: 50000}
                ],},
                {
                    name: '访问来源',
                    type: 'pie',
                    radius : '35%',
                    center: ['80%', '30%'],
                    data:[
                        {value:50000, name:'潍坊'}
                    ],
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        });
    });
    if (option1 && typeof option1 === "object") {
        myChart.setOption(option1, true);
    }







/*    var dom = document.getElementById("container");
    var myChart = echarts.init(dom);
    var app={};
    option = {
        title : {
            text: '山东预估保费统计图',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['潍坊','青岛','济南','泰安','烟台']
        },
        series : [
            {

                name: '访问来源',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[
                    {value:335, name:'潍坊'},
                    {value:310, name:'青岛'},
                    {value:234, name:'济南'},
                    {value:135, name:'泰安'},
                    {value:1548, name:'烟台'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    //柱状图结束
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }*/


</script>
</html>
