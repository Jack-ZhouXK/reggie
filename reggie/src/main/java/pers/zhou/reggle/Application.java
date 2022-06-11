package pers.zhou.reggle;


import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@Slf4j // 可以直接使用log日志
@ServletComponentScan // 扫描ServletFilter
@EnableTransactionManagement //开启事务注解支持
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
        log.info("项目启动成功.....");
    }
}
