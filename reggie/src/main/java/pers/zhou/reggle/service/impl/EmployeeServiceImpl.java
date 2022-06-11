package pers.zhou.reggle.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import pers.zhou.reggle.entity.Employee;
import pers.zhou.reggle.mapper.EmployeeMapper;
import pers.zhou.reggle.service.EmployService;

@Service
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, Employee> implements EmployService {
}
