package com.cow.controller;

import com.baomidou.mybatisplus.extension.api.R;
import com.cow.entity.InfFileDO;
import com.cow.service.impl.UploadLoadSerivceImpl;
import com.cow.util.general.CommonResult;
import com.cow.util.oss.AliyunOssUtil;
import com.cow.vo.Result;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Date;

/**
 *
 */
@Slf4j
@CrossOrigin
@RestController
public class OssController {
    @Autowired
    private AliyunOssUtil ossUtil;


    @Resource
    UploadLoadSerivceImpl uploadLoadSerivce;

    @RequestMapping("/uploadImage")
    public CommonResult upload(@RequestParam("name") String folderName,
                               @RequestParam("file") MultipartFile file) throws IOException {
        if (file.isEmpty()) {
            return CommonResult.error("上传文件不能为空");
        }
        String fileExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
        String fileName = new Date().getTime()+"."+fileExt;

        String savePath = Paths.get(System.getProperty("user.dir"), ("/upload/")).toString() + "/" + fileName;
        File dest = new File(savePath);

        file.transferTo(dest);
        String url = "http://localhost:9999/upload/" + fileName;
        return new CommonResult(200, "上传成功", url);
    }
}
