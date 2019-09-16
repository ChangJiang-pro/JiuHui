<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/2
  Time: 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上报数据</title>
</head>
<body>
<div class="row clearfix">
    <div class="col-sm-12 column">
        <div class="row clearfix">
            <%@include file="/common/left.jsp"%>
            <div class="panel panel-default col-sm-9" style="padding-right: 0;padding-left: 0">
                <div class="panel-heading" style="background-color: #337ab7;color:white;">
                    <h3 class="panel-title" >
                        上报数据
                    </h3>
                </div>
                <div class="panel-body">
                    <div id="report_div">
                        <table id="plan_tab"></table>
                    </div>
                    <%--<c:if test="${}">
                    </c:if>--%>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function(){
        $("#report_div").show();
        $("#plan_tab").bootstrapTable({
            url:'${pageContext.request.contextPath}/data/findPlanAll',
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
                    field:'planName',
                    title:'计划名称'
                },{
                    field:'planTable',
                    title:'计划桌数'
                },{
                    field:'begintime',
                    title:'开始时间'
                },{
                    field:'endtime',
                    title:'结束时间'
                },{
                    title:'操作',
                    formatter :function (value,row,index){
                        return "<a href='${pageContext.request.contextPath}/jsps/member/actualData.jsp?name="+row.planName+"&&id="+row.id+"'>上报实际数据</a>";
                    }
                }
            ]
        });
    });
</script>
</html>
