package pers.zhou.reggle.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import pers.zhou.reggle.entity.User;
import pers.zhou.reggle.mapper.UserMapper;
import pers.zhou.reggle.service.UserService;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {


}
