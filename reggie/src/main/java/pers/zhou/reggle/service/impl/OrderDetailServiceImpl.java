package pers.zhou.reggle.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import pers.zhou.reggle.entity.OrderDetail;
import pers.zhou.reggle.mapper.OrderDetailMapper;
import pers.zhou.reggle.service.OrderDetailService;

@Service
public class OrderDetailServiceImpl extends ServiceImpl<OrderDetailMapper, OrderDetail> implements OrderDetailService {

}