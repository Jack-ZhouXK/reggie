package pers.zhou.reggle.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import pers.zhou.reggle.common.R;
import pers.zhou.reggle.common.Utils;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.UUID;

/**
 * 文件上传和下载
 */
@RequestMapping("/common")
@Slf4j
@RestController
public class CommonController {
    @Value("${reggie.path}")
    private String filePath;

    /**
     * 文件上传
     */
    @PostMapping("/upload")
    public R<String> upload(MultipartFile file) {  //文件名称必须和前端保持一致,否则接收不到
        //file 是一个临时文件,所以需要保存到本地,否则本次上传结束后就会删除
        if (file == null) {
            return R.error("获取文件失败");
        }
        // 获取后缀
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        //使用UUID随机生成一个名字,防止重名造成的覆盖
        String fileName = Utils.getUUID() + suffix;
        File dir = new File(filePath);
        if (!dir.exists()) {//判断当前路径是否存在
            dir.mkdirs();    //目录不存在 需要创建
        }
        try {
            file.transferTo(new File(filePath + fileName));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return R.success(fileName);
    }

    /**
     * 文件下载
     */
    @GetMapping("/download")
    public void download(String name, HttpServletResponse response) {
        try {
            // 输入流读取文件内容
            FileInputStream fileInputStream = new FileInputStream(new File(filePath + name));
            // 输出流将文件写回浏览器
            ServletOutputStream outputStream = response.getOutputStream();
            //设置响应类型
            response.setContentType("image/jpeg");
            // 读取数据
            int len = 0;
            byte[] bytes = new byte[1024];
            while ((len = fileInputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, len);
                outputStream.flush(); //刷新
            }
            // 关闭资源
            outputStream.close();
            fileInputStream.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
