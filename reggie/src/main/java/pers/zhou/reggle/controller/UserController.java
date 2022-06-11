package pers.zhou.reggle.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pers.zhou.reggle.common.R;
import pers.zhou.reggle.common.ValidateCodeUtils;
import pers.zhou.reggle.entity.User;
import pers.zhou.reggle.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * 用户 控制器
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 发送手机短信验证码
     */
    @PostMapping("/sendMsg")
    public R<String> sendMsg(@RequestBody User user, HttpSession httpSession) {
        String phone = user.getPhone();
        if (StringUtils.isBlank(phone)) {
            return R.error("手机号不能为空");
        }
        // 工具类获取 四位验证码
        String code = ValidateCodeUtils.generateValidateCode(6).toString();
        // 调用API发送短信
//        SMSUtils.sendMessage(phone, code);
        System.err.println("code = " + code);
        // 需要将生成的验证码保存到Session
        httpSession.setAttribute(phone, code);
        return R.error("短信发送成功");
    }

    /**
     * 登录接口
     */
    @PostMapping("/login")
    public R<User> login(@RequestBody Map<Object, Object> map, HttpSession session) {
        // 获取手机号,和code
        String phone = map.get("phone").toString();
        String code = map.get("code").toString();
        // 从session获取保存验证码
        String codeInSession = (String) session.getAttribute(phone);
        System.err.println("code = " + code);
        // 验证码进行比对
        if (codeInSession != null && codeInSession.equals(code)) { // 如果比对成功,则登录成功
            // --- 判断当前用户是否存在,如果不存在则自动注册
            LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
            queryWrapper.eq(User::getPhone, phone);
            User user = userService.getOne(queryWrapper);
            if (user == null) { //不存在自动注册,新用户自动注册
                user = new User();
                user.setPhone(phone);
                user.setStatus(1);
                userService.save(user);
            }
            session.setAttribute("user", user.getId());
            return R.success(user);
        }
        return R.error("登录失败");
    }


}
