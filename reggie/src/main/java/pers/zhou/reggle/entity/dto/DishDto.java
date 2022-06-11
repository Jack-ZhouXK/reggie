package pers.zhou.reggle.entity.dto;

import lombok.Data;
import pers.zhou.reggle.entity.Dish;
import pers.zhou.reggle.entity.DishFlavor;

import java.util.ArrayList;
import java.util.List;

@Data
public class DishDto extends Dish {

    private List<DishFlavor> flavors = new ArrayList<>();

    private String categoryName;

    private Integer copies;
}
