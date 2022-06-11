package pers.zhou.reggle.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;
import pers.zhou.reggle.common.R;
import pers.zhou.reggle.entity.Employee;
import pers.zhou.reggle.service.EmployService;

import javax.servlet.http.HttpServletRequest;

@Slf4j //日志
@RestController
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployService employService;

    /**
     * 登录
     */
    @PostMapping("/login")
    public R<Employee> login(HttpServletRequest request, @RequestBody Employee employee) {
        //将页面提交的密码password进行`md5`加密处理
        String password = employee.getPassword();
        password = DigestUtils.md5DigestAsHex(password.getBytes());
        //根据页面提交的用户名`username`查询数据库
        LambdaQueryWrapper<Employee> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(Employee::getUsername, employee.getUsername());
        Employee resultEmployee = employService.getOne(wrapper);
        if (resultEmployee == null) {  //如果没有查询到则返回登录失败结果
            return R.error("登录失败，账户不存在");
        }
        if (!password.equals(resultEmployee.getPassword())) { //密码比对，如果不一致则返回登录失败结果
            return R.error("登录失败，密码错误");
        }
        if (resultEmployee.getStatus() == 0) { //查看员工状态，如果为已禁用状态，则返回员工已禁用结果
            return R.error("登录失败，账号已禁用 ");
        }
        request.getSession().setAttribute("employee", resultEmployee.getId());      //登录成功，将员工id存入Session并返回登录成功结果

        return R.success(resultEmployee);
    }

    /**
     * 员工退出
     */
    @PostMapping("/logout")
    public R<String> loginOut(HttpServletRequest request) {
        request.getSession().removeAttribute("employee"); //清理Session中的用户id
        return R.success("退出成功");
    }

    /**
     * 新增员工
     */
    @PostMapping
    public R<String> save(HttpServletRequest request, @RequestBody Employee employee) {
        employee.setPassword(DigestUtils.md5DigestAsHex("123456".getBytes())); //设置初始密码123456，进行md5加密处理
        employService.save(employee);
        return R.success("新增员工成功");
    }

    /**
     * 分页查询员工信息
     */
    @GetMapping("/page")
    public R<Page<Employee>> page(int page, int pageSize, String name) {
        Page<Employee> pageEmployee = new Page<>(page, pageSize);  //构建分页构造器
        LambdaQueryWrapper<Employee> queryWrapper = new LambdaQueryWrapper<>();  //构建条件构造器
        queryWrapper.like(StringUtils.isNotEmpty(name), Employee::getName, name); // 如果name不等于空，则通过~name~模糊查询
        queryWrapper.orderByDesc(Employee::getUpdateTime);   // 通过更新时间进行排序
        employService.page(pageEmployee, queryWrapper);  //进行查询
        log.info("page:{}", page);
        return R.success(pageEmployee);
    }

    /**
     * 更新员工信息操作
     */
    @PutMapping
    public R<String> update(HttpServletRequest request, @RequestBody Employee employee) {
        employService.updateById(employee);
        return R.success("员工信息修改成功~");
    }

    /**
     * 通过ID获取用户信息
     */
    @GetMapping("/{id}")
    public R<Employee> getById(@PathVariable Long id) {
        Employee employee = employService.getById(id);
        if (employee == null) {
            return R.error("当前用户不存在");
        }
        return R.success(employee);
    }

}

