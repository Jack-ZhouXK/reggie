package pers.zhou.reggle.service;

import com.baomidou.mybatisplus.extension.service.IService;
import pers.zhou.reggle.entity.Setmeal;
import pers.zhou.reggle.entity.dto.SetmealDto;

import java.util.List;

public interface SetmealService extends IService<Setmeal> {
    /**
     * 新增套餐 同时需要保存 套餐和菜品的关系
     */
    void saveWithDish(SetmealDto setmealDto);

    /**
     * 删除套餐
     */
    void removeWithDish(List<Long> ids);

}
