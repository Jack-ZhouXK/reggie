package pers.zhou.reggle.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.zhou.reggle.CustomException;
import pers.zhou.reggle.entity.Category;
import pers.zhou.reggle.entity.Dish;
import pers.zhou.reggle.entity.Setmeal;
import pers.zhou.reggle.mapper.CategoryMapper;
import pers.zhou.reggle.service.CategoryService;
import pers.zhou.reggle.service.DishService;
import pers.zhou.reggle.service.SetmealService;

/**
 * 分类管理
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

    @Autowired
    private DishService dishService;

    @Autowired
    private SetmealService setmealService;

    /**
     * 根据ID删除分类
     * 删除之前需要判断 是否关联其余菜品或者套餐
     * 如果已经关联则抛出业务异常即可
     */
    @Override
    public void remove(Long id) {
        LambdaQueryWrapper<Dish> dishLambdaQueryWrapper = new LambdaQueryWrapper<Dish>();
        dishLambdaQueryWrapper.eq(Dish::getCategoryId, id);
        if (dishService.count(dishLambdaQueryWrapper) > 0) {
            throw new CustomException("当前分类项关联了菜品,不能删除~");
        }
        LambdaQueryWrapper<Setmeal> SetmealQueryWrapper = new LambdaQueryWrapper<Setmeal>();
        SetmealQueryWrapper.eq(Setmeal::getCategoryId, id);
        if (setmealService.count(SetmealQueryWrapper) > 0) {
            throw new CustomException("当前分类项关联了套餐,不能删除~");
        }
        super.removeById(id);
    }
}
