package pers.zhou.reggle.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import pers.zhou.reggle.entity.Dish;

/**
 * 菜品
 */
@Mapper
public interface DishMapper extends BaseMapper<Dish> {
}
