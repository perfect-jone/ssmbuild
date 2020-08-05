package com.atjone.controller;

import com.atjone.bean.Department;
import com.atjone.bean.Message;
import com.atjone.service.DeptartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DeptartmentController {

    @Autowired
    DeptartmentService deptartmentService;
    @RequestMapping("/depts")
    @ResponseBody
    public Message getDepts(){
        List<Department> list = deptartmentService.getAll();
        return Message.success().add("depts",list);
    }
}
