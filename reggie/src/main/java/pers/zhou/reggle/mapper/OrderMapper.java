package pers.zhou.reggle.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import pers.zhou.reggle.entity.Orders;

@Mapper
public interface OrderMapper extends BaseMapper<Orders> {

}