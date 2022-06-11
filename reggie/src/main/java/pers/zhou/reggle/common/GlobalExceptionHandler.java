package pers.zhou.reggle.common;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import pers.zhou.reggle.CustomException;

import java.sql.SQLIntegrityConstraintViolationException;

/**
 * 全局异常处理
 */
@ResponseBody
@Slf4j
@ControllerAdvice(annotations = {RestController.class, Controller.class})  //拦截带有RestController或者Controller注解的接口
public class GlobalExceptionHandler {

    /**
     * sql异常处理
     */
    @ExceptionHandler(SQLIntegrityConstraintViolationException.class)
    public R<String> exceptionHandler(SQLIntegrityConstraintViolationException exception) {
        log.error("拦截异常，{}", exception.getMessage());
        if (exception.getMessage().contains("Duplicate entry")) {   // 如果sql错误中包含"Duplicate entry"关键字，证明是违反了唯一约束的错误
            String[] split = exception.getMessage().split(" ");//以空格进行分割 获取重复字段
            String msg = split[2] + "已存在";
            return R.error(msg);
        }
        return R.error("未知错误");
    }

    /**
     * 业务异常处理
     */
    @ExceptionHandler(CustomException.class)
    public R<String> exceptionHandler(CustomException exception) {
        return R.error(exception.getMessage());
    }
}
