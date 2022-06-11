package pers.zhou.reggle.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import pers.zhou.reggle.common.R;
import pers.zhou.reggle.entity.Category;
import pers.zhou.reggle.service.CategoryService;
import pers.zhou.reggle.service.DishService;
import pers.zhou.reggle.service.SetmealService;

import java.util.List;

/**
 * 分类管理
 */
@RestController
@RequestMapping("/category")
@Slf4j
public class CategoryController {

    @Autowired
    private CategoryService categoryService;


    /**
     * 新增分类
     */
    @PostMapping
    public R<String> save(@RequestBody Category category) {
        log.info("新增分类category:{}", category);
        categoryService.save(category);
        return R.success("新增分类成功");
    }

    /**
     * 分类信息分页查询
     */
    @GetMapping("/page")
    public R<Page<Category>> page(int page, int pageSize) {
        Page<Category> pageInfo = new Page<>(page, pageSize);
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.orderByAsc(Category::getSort);
        categoryService.page(pageInfo, queryWrapper);
        return R.success(pageInfo);
    }

    /**
     * 根据ID删除分类信息
     */
    @DeleteMapping
    public R<String> delete(Long id) {
        categoryService.remove(id);
        return R.success("分类信息删除成功");
    }

    /**
     * 修改分类信息
     */
    @PutMapping
    public R<String> update(@RequestBody Category category) {
        categoryService.updateById(category);
        return R.success("修改分类信息成功");
    }

    /**
     * 获取菜品分类数据
     */
    @GetMapping("/list")
    public R<List<Category>> list(Category category) {
        LambdaQueryWrapper<Category> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(category.getType() != null, Category::getType, category.getType());
        wrapper.orderByAsc(Category::getSort).orderByDesc(Category::getUpdateTime);
        List<Category> list = categoryService.list(wrapper);
        return R.success(list);
    }
}
