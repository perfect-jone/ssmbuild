package com.atjone.controller;

import com.atjone.bean.Employee;
import com.atjone.bean.Message;
import com.atjone.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    /**
     * 检查员工姓名是否重复
     */

    @ResponseBody
    @RequestMapping("/checkUser")
    public Message checkUser(@RequestParam("empName") String empName) {

        String regName = "(^[\u2E80-\u9FFF]{2,5}$)|(^[a-z]{3,16}$)";
        if (!empName.matches(regName)) {
            return Message.fail().add("validate_Message", "员工姓名必须是2到5位中文或者3到16位英文");
        }
        boolean b = employeeService.checkuser(empName);
        if (b) {
            return Message.success();
        } else {
            return Message.fail().add("validate_Message","用户名不可用");
        }
    }

    /**
     * 保存员工
     */
    @ResponseBody
    @RequestMapping(value = "/saveEmp", method = RequestMethod.POST)
    public Message saveEmployee(Employee employee) {
        employeeService.saveEmp(employee);
        return Message.success();
    }

    /**
     * 查询所有员工，分页查询，返回json数据
     *
     * @param pageNum       显示第几页
     * @param pageSize      每页显示多少条
     * @param navigatePages 分页导航栏连续显示多少页
     * @return PageInfo
     */
    @ResponseBody
    @RequestMapping("/emps")
    public Message getEmpsWithJson(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                   @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                   @RequestParam(value = "navigatePages", defaultValue = "5") Integer navigatePages
    ) {
        PageHelper.startPage(pageNum, pageSize);
        List<Employee> employees = employeeService.getAll();
        PageInfo pageInfo = new PageInfo(employees, navigatePages);
        return Message.success().add("pageInfo", pageInfo);
    }

    /**
     * 查询所有员工，分页查询
     *
     * @return 通过http://localhost:8080/ssmbuild/emps跳转到list.jsp页面
     */
    //@RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, Model model) {

        //引入pageHelper分页插件,查第几页，每页显示几条信息
        PageHelper.startPage(pageNum, 5);

        List<Employee> employees = employeeService.getAll();

        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo pageInfo = new PageInfo(employees, 5);
        model.addAttribute("pageInfo", pageInfo);

        return "list";
    }
}
