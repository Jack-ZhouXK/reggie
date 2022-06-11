package pers.zhou.reggle.service;

import com.baomidou.mybatisplus.extension.service.IService;
import pers.zhou.reggle.entity.Dish;
import pers.zhou.reggle.entity.dto.DishDto;


public interface DishService  extends IService<Dish> {
    /**
     * 新增菜品同时添加口味数据
     */
    void saveWithFlavor(DishDto dishDto);

    /**
     * 根据Id查询对应的菜品信息和口味信息
     */
    DishDto getByIdWithFlavor(Long id);

    /**
     * 更新菜品信息和口味信息
     */
    void updateWithFlavor(DishDto dishDto);
}
