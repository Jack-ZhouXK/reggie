package pers.zhou.reggle.entity.dto;
import lombok.Data;
import pers.zhou.reggle.entity.Setmeal;
import pers.zhou.reggle.entity.SetmealDish;

import java.util.List;

@Data
public class SetmealDto extends Setmeal {
    private List<SetmealDish> setmealDishes;
    private String categoryName;
}
