package com.bgs.boot0828.controller;


import com.bgs.boot0828.pojo.ActiveData;
import com.bgs.boot0828.pojo.Area;
import com.bgs.boot0828.pojo.User;
import com.bgs.boot0828.service.TreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("tree")
public class TreeController {

    @Autowired
    private TreeService treeService;

    @RequestMapping("findAll")
    @ResponseBody
    public List<Area> findAll(HttpSession session){
        User user=(User)session.getAttribute("user");
        if(user==null){
            return null;
        }
        return treeService.findAll();
    }

    @RequestMapping("update")
    @ResponseBody
    public int update(Area area){
        return treeService.update(area);
    }

    @RequestMapping("delete")
    @ResponseBody
    public int delete(Integer []ids){
        return treeService.delete(ids);
    }

    @RequestMapping("add")
    @ResponseBody
    public int add(Area area){
        return treeService.add(area);
    }

    @RequestMapping("findAreaAll")
    @ResponseBody
    public List<Area> findAreaAll(Integer id){
        return treeService.findAreaAll(id);
    }

    @RequestMapping("addUser")
    @ResponseBody
    public int addUser(User user){
        return treeService.addUser(user);
    }

    @RequestMapping("findActiveData")
    @ResponseBody
    public List<ActiveData> findActiveData(HttpSession session){
        User user=(User)session.getAttribute("user");
        return treeService.findActiveData(user.getId());
    }
}
