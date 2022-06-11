package pers.zhou.reggle.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import pers.zhou.reggle.entity.Category;

/**
 * 分类管理
 */
@Mapper
public interface CategoryMapper extends BaseMapper<Category> {
}
