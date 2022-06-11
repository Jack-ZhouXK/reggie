package pers.zhou.reggle.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import pers.zhou.reggle.entity.Employee;

@Mapper
public interface EmployeeMapper extends BaseMapper<Employee> {

}
