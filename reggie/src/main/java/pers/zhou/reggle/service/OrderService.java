package pers.zhou.reggle.service;

import com.baomidou.mybatisplus.extension.service.IService;
import pers.zhou.reggle.entity.Orders;

public interface OrderService extends IService<Orders> {

    /**
     * 用户下单
     * @param orders
     */
    public void submit(Orders orders);
}
