<%@page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%-- 栅格系统--%>
<div class="container">
    <%-- 1.标题 --%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>

    <%-- 2.新增删除按钮 --%>
    <div class="row">
        <div class="col-md-4 col-md-offset-10">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_del_modal_btn">删除</button>
        </div>
    </div>

    <%-- 3.显示表格数据 --%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>empId</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>department</th>
                    <th>operate</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <!-- 员工修改的模态框 -->
    <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabe2">修改员工</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-8">
                                    <input type="text" name="empName" class="form-control" id="empName_update_input"
                                           placeholder="请输入员工姓名">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">邮箱</label>
                                <div class="col-sm-8">
                                    <input type="text" name="email" class="form-control" id="email_update_input"
                                           placeholder="请输入邮箱地址">
                                    <span class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-8">
                                    <label class="radio-inline ">
                                        <input type="radio" name="gender" id="gender_update_radio1" value="男"
                                               checked="checked"> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="gender_update_radio2" value="女"> 女
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">部门</label>
                                <div class="col-sm-4">
                                    <!-- 部门提交部门id即可 -->
                                    <select class="form-control" name="dId" id="dept_update_select">
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
                    </div>
                </div>
            </div>
        </div>

    <!-- 员工增加的模态框 -->
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">新增员工</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-8">
                                <input type="text" name="empName" class="form-control" id="empName_add_input"
                                       placeholder="请输入员工姓名">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-8">
                                <input type="text" name="email" class="form-control" id="email_add_input"
                                       placeholder="请输入邮箱地址">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-8">
                                <label class="radio-inline ">
                                    <input type="radio" name="gender" id="gender_add_radio1" value="男"
                                           checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender_add_radio2" value="女"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-4">
                                <!-- 部门提交部门id即可 -->
                                <select class="form-control" name="dId" id="dept_add_select">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>

    <%-- 4.分页信息 --%>
    <div class="row">
        <%-- 分页文字信息 --%>
        <div class="md-col-6" id="page_infao_area">

        </div>
        <%-- 分页条信息 --%>
        <div class="col-md-6 col-md-offset-8" id="page_nav_area">

        </div>
    </div>
</div>

<script>
    // 页面加载完成以后,直接去发送ajax请求,要到分页数据
    $(function () {
        // 去首页
        to_whichPage(1, 5, 5);
    })
    var totalRecord; //全局变量，总记录数
    // 跳转到哪一页
    function to_whichPage(pageNum, pageSize, navigatePages) {
        $.ajax({
            url: "${APP_PATH}/emps",
            data: {
                "pageNum": pageNum,
                "pageSize": navigatePages,
                "navigatePages": navigatePages
            },
            dataType: "json",
            type: "get",
            success: function (result) {
                // console.log(result);
                // 1.解析并显示员工数据
                build_emps_table(result);

                // 2.解析并显示分页信息
                page_info_area(result);

                // 3.解析并显示分页条
                page_nav_area(result);
            }
        });
    }

    // 构建员工表格
    function build_emps_table(result) {
        // 构建表格前先清空表格
        $("#emps_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, emp) {
            // alert(emp.email);
            // 构建表格的单元格信息
            var empId = $("<td></td>").append(emp.empId);
            var empName = $("<td></td>").append(emp.empName);
            var gender = $("<td></td>").append(emp.gender);
            var email = $("<td></td>").append(emp.email);
            var deptName = $("<td></td>").append(emp.department.deptName);
            var btn_edit = $("<button></button>").addClass("btn btn-warning btn-xs edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            var btn_del = $("<button></button>").addClass("btn btn-danger btn-xs delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            var btn = $("<td></td>").append(btn_edit).append(" ").append(btn_del);

            // 每行加入单元格信息,并追加到表格的tbody中
            $("<tr></tr>").append(empId)
                .append(empName)
                .append(gender)
                .append(email)
                .append(deptName)
                .append(btn)
                .appendTo("#emps_table tbody");
        });
    }

    // 分页信息
    function page_info_area(result) {
        // 显示分页信息前先清空之前的
        $("#page_infao_area").empty();
        var pageNum = result.extend.pageInfo.pageNum;
        var pages = result.extend.pageInfo.pages;
        totalRecord = result.extend.pageInfo.total;
        $("#page_infao_area").append("当前第" + pageNum + "页，共" + pages + "页，共" + totalRecord + "条");
    }

    // 分页导航信息
    function page_nav_area(result) {
        // 构建分页导航信息前先清空之前的
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var fistPage = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePage = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));

        // 如果当前页无前一页,则首页和前一页设置禁用状态
        if (result.extend.pageInfo.hasPreviousPage == false) {
            fistPage.addClass("disabled");
            prePage.addClass("disabled");
        } else { // 如果没有被禁用,才调用点击事件
            fistPage.click(function () {
                to_whichPage(1, 5, 5);
            });
            prePage.click(function () {
                to_whichPage(result.extend.pageInfo.pageNum - 1, 5, 5);
            });
        }
        ul.append(fistPage).append(prePage);

        // 获取连续显示页数数组
        var navigatepageNums = result.extend.pageInfo.navigatepageNums;
        // 页码号：1,2,3,4,5
        $.each(navigatepageNums, function (index, navigatepageNum) {
            var num = $("<li></li>").append($("<a></a>").append(navigatepageNum).attr("href", "#"));
            // 如果当前页为正在遍历的页码,则当前页高亮显示
            if (result.extend.pageInfo.pageNum == navigatepageNum) {
                num.addClass("active");
            }
            num.click(function () {
                to_whichPage(navigatepageNum, 5, 5);
            })
            ul.append(num);
        })

        var nextPage = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
        var lastPage = $("<li></li>").append($("<a></a>").append("尾页").attr("href", "#"));
        // 如果当前页无后一页,则尾页和后一页设置禁用状态
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPage.addClass("disabled");
            lastPage.addClass("disabled");
        } else { // 如果没有被禁用,才调用点击事件
            nextPage.click(function () {
                to_whichPage(result.extend.pageInfo.pageNum + 1, 5, 5);
            })

            lastPage.click(function () {
                to_whichPage(result.extend.pageInfo.pages, 5, 5);
            })
        }
        ul.append(nextPage).append(lastPage);

        $("#page_nav_area").append($("<nav></nav>").append(ul));
        //$("<nav></nav>").append(ul).appendTo("#page_nav_area")
    }

    // 部门信息
    function getDepts(ele) {
        $(ele).empty();

        $.ajax({
            url: "${APP_PATH}/depts",
            type: "get",
            success: function (result) {
                console.log(result);
                $.each(result.extend.depts, function () {
                    var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionEle.appendTo(ele);
                })
            }
        })
    }

    // 点击新增按钮弹出模态框
    $("#emp_add_modal_btn").click(function () {
        // 查出部门信息
        getDepts("#empAddModal select");
        // 弹出模态框
        $("#empAddModal").modal({
            backdrop: "static" // 点击其他部位不能关闭模态框，必须点击关闭按钮才关闭
        });
    });

    // 验证员工姓名是否重复
    $("#empName_add_input").change(function () {
        $.ajax({
            url:"${APP_PATH}/checkUser",
            data:{
                "empName":this.value // 表示当前输入框的值
            },
            type:"post",
            success:function (result) {
                if(result.code==200){ //姓名可用，不重复
                    show_validate_msg("#empName_add_input","success","姓名可用")
                }else if(result.code==100){ //姓名重复,不可用
                    show_validate_msg("#empName_add_input","error","姓名重复,不可用")
                }
            }
        })
    })
    // 保存员工
    $("#emp_save_btn").click(function () {
        // 模态框中填写的表单数据提交给服务器进行保存
        // 发送ajax请求之前先要对表单中用户填写的数据进行校验
        if (!validate_add_form()) {
            return false;
        }
        // 发送ajax请求保存员工
        $.ajax({
            url: "${APP_PATH}/saveEmp",
            data: $("#empAddModal form").serialize(),
            type: "post",
            success: function (result) {
                // 关闭模态框
                $("#empAddModal").modal('hide');
                // 跳转到最后一页，显示最新添加的数据
                to_whichPage(totalRecord, 5, 5);
            }
        })
    })

    // 校验保存员工表单数据
    function validate_add_form() {

        // 校验姓名:2到5位中文名
        var empName = $("#empName_add_input").val();
        var regName = /(^[\u2E80-\u9FFF]{2,5}$)|(^[a-z]{3,16}$)/;
        if (!regName.test(empName)) {
            // alert("请输入2到5位中文或者3到16位英文");
            show_validate_msg("#empName_add_input","error","请输入2到5位中文或者3到16位英文");
            return false;
        }else{
            show_validate_msg("#empName_add_input","success","");
        }

        // 校验邮箱
        var email = $("#email_add_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if (!regEmail.test(email)) {
                // alert("邮箱格式不正确");
                show_validate_msg("#email_add_input","error","邮箱格式不正确");
                return false;
            }else{
                show_validate_msg("#email_add_input","success","");
        }

        return true;
    }

    // 显示表单验证信息
    function show_validate_msg(ele,status,msg) {
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next().text("");
        if (status == "success") {
            $(ele).parent().addClass("has-success");
            $(ele).next().text(msg);
        }else if(status == "error"){
            $(ele).parent().addClass("has-error");
            $(ele).next().text(msg);
        }
    }

    // 修改员工
    $(document).on("click",".edit_btn",function () {
        // alert("edit")
        // 查出部门信息，显示部门列表和员工信息
        getDepts("#empUpdateModal select");
        // 弹出模态框
        $("#empUpdateModal").modal({
            backdrop: "static" // 点击其他部位不能关闭模态框，必须点击关闭按钮才关闭
        });
    })
    // 删除员工
    $(document).on("click",".delete_btn",function () {
        alert("delete")
    })

</script>
</body>
</html>
