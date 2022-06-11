package pers.zhou.reggle.service;

import com.baomidou.mybatisplus.extension.service.IService;
import pers.zhou.reggle.entity.Category;

/**
 * 分类管理
 */
public interface CategoryService extends IService<Category> {
    /**
     * 删除分类
     */
    void remove(Long id);
}
