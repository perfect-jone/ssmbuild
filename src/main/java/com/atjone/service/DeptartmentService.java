package com.atjone.service;

import com.atjone.bean.Department;
import com.atjone.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptartmentService {
    @Autowired
    DepartmentMapper departmentMapper;
    public List<Department> getAll() {
        List<Department> list = departmentMapper.selectByExample(null);
        return list;
    }
}
