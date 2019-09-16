package com.bgs.boot0828.controller;

import com.bgs.boot0828.pojo.ActiveData;
import com.bgs.boot0828.pojo.Forecast;
import com.bgs.boot0828.pojo.Gallery;
import com.bgs.boot0828.pojo.User;
import com.bgs.boot0828.service.DataService;
import com.bgs.boot0828.service.TreeService;
import com.bgs.boot0828.utils.TemplateExcelUtil;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("data")
public class DataController {
    @Autowired
    private DataService dataService;
    @Autowired
    private TreeService treeService;

    @Value("${path}")
    private String path;

    @RequestMapping("addPlan")
    @ResponseBody
    public int addPlan(Forecast forecast){
        return dataService.addPlan(forecast);
    }

    @RequestMapping("findPlanAll")
    @ResponseBody
    public List<Forecast> findPlanAll(){
        return dataService.findPlanAll();
    }

    @RequestMapping("addActiveData")
    @ResponseBody
    public int addActiveData(ActiveData activeData,HttpSession session){

        int i= dataService.addActiveData(activeData);
        if(i>0){
            session.setAttribute("activeId",activeData.getId());
        }
        return i;
    }

    @RequestMapping("addPicture")
    @ResponseBody
    public Map<String,Object> addPicture(MultipartFile goodsImg, HttpSession session) throws IOException {

        Map<String, Object> map = new HashMap<>();
        User user = (User) session.getAttribute("user");
        Integer activeId=(Integer)session.getAttribute("activeId");
        if (user != null) {
            String fileName = String.valueOf(System.currentTimeMillis());
            String target = path+File.separator+"active" +File.separator+fileName + ".jpg";
            Gallery gallery=new Gallery();
            gallery.setActiveId(activeId);
            gallery.setName(fileName);
            gallery.setUrl(path+File.separator+"active" +File.separator);
            File temp = new File(target);
            //把图片写入磁盘中
            goodsImg.transferTo(temp);
            int i = dataService.addPicture(gallery);
            //int j=dataService.delForecast(dataService.getId());
            if (i > 0) {
                map.put("state", true);
                map.put("Image", fileName);
            } else {
                map.put("state", false);
            }
        } else {
            map.put("state", false);
        }
        return map;
    }

//    导出
   @RequestMapping("outPoi")
    @ResponseBody
    public Boolean outPoi(HttpSession session,String type,Integer limit,Integer offset) {
        boolean falg=true;
        String temp="dataTemp.xlsx";
        temp=session.getServletContext().getRealPath("/tempPlent")+File.separator+temp;
        String target="E:"+File.separator+"image"+File.separator+System.currentTimeMillis()+".xlsx";
        User user=(User)session.getAttribute("user");
        List<ActiveData> list=treeService.findActiveData(user.getId());


        //params
        String[] params=new String[2];
        params[0]=user.getName();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        params[1]=sdf.format(new Date());
        //list
        List<String> tlist=titleList();
        try {
            new TemplateExcelUtil().exportExcel(temp, target, params, tlist, list);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }

        return falg;
    }
    //获取字段
    public List<String> titleList(){
        List<String> list=new ArrayList<>();
        list.add("userName");
        list.add("planTable");
        list.add("actualNum");
        list.add("newClient");
        list.add("oldClient");
        list.add("potentialClient");
        list.add("money");
        return list;
    }
}
