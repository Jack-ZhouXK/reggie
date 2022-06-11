package pers.zhou.reggle.entity.dto;

import lombok.Data;
import pers.zhou.reggle.entity.OrderDetail;
import pers.zhou.reggle.entity.Orders;

import java.util.List;

@Data
public class OrdersDto extends Orders {

    private String userName;

    private String phone;

    private String address;

    private String consignee;

    private List<OrderDetail> orderDetails;
	
}
