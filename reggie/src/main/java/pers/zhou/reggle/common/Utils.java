package pers.zhou.reggle.common;

import java.util.UUID;

/**
 * 自定义工具类
 */
public class Utils {

    /**
     * 获取去横线的UUID算法
     */
    public static String getUUID() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
}
