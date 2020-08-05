package com.atjone.test;

import com.atjone.bean.Department;
import com.atjone.bean.Employee;
import com.atjone.dao.DepartmentMapper;
import com.atjone.dao.EmployeeMapper;
import com.atjone.utils.RandomUtils;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 测试dao层的工作
 *
 * 推荐Spring的项目就可以使用Spring的单元测试，可以自动注入我们需要的组件
 * 1、导入SpringTest模块
 * 2、@ContextConfiguration指定Spring配置文件的位置
 * 3、直接autowired要使用的组件即可
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;

    @Test
    public void testCRUD() {

        //departmentMapper.insertSelective(new Department(null,"开发部"));
        for (int i = 0; i < 500; i++) {
            Employee employee = new Employee(null, RandomUtils.getChineseName(),
                    RandomUtils.name_sex, RandomUtils.getEmail(6, 9), 4, null);
            employeeMapper.insertSelective(employee);
        }

    }
}
