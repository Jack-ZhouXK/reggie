package pers.zhou.reggle.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import pers.zhou.reggle.entity.ShoppingCart;
import pers.zhou.reggle.mapper.ShoppingCartMapper;
import pers.zhou.reggle.service.ShoppingCartService;

@Service
public class ShoppingCartServiceImpl extends ServiceImpl<ShoppingCartMapper, ShoppingCart> implements ShoppingCartService {

}
