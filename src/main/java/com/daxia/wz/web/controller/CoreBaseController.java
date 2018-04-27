package com.daxia.wz.web.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.daxia.core.exception.BizException;
import com.daxia.core.web.controller.KBaseController;
import com.daxia.wz.security.PasswordEncoder;
import com.daxia.wz.service.SystemConfigService;
import com.daxia.wz.util.EmailUtils;
import com.daxia.wz.util.ImageUtils;
import com.daxia.wz.util.JsonUtils;
import com.daxia.wz.util.ValidationUtils;

public class CoreBaseController extends KBaseController {

    protected  Logger logger = Logger.getLogger(getClass());
   
    @Autowired
    protected PasswordEncoder passwordEncoder;
    @Autowired
    protected EmailUtils emailUtils;
   
	@Autowired
	protected SystemConfigService systemConfigService;
	
    protected String toJson(Object obj) {
		return JsonUtils.toJson(obj);
	}

    protected String saveFileAndReturnFileName(HttpServletRequest request, String formInputName) throws IOException {
        MultipartHttpServletRequest mhs = (MultipartHttpServletRequest) request;  
        MultipartFile mf = mhs.getFile(formInputName);
        String fileName = null; 
        if (mf != null && !mf.isEmpty()) {
            return ImageUtils.uploadToCDNAndGetUrl(mf.getBytes());
        }
        return fileName;
    }
    
    protected String saveFilesAndReturnFileName(HttpServletRequest request) throws IOException {
    	String ret = "";
        MultipartHttpServletRequest mhs = (MultipartHttpServletRequest) request;  
        Map<String, MultipartFile> fileMap = mhs.getFileMap();
        for (String key : fileMap.keySet()) {
        	MultipartFile mf = fileMap.get(key);
        	if (mf != null && !mf.isEmpty()) {
        		String url = ImageUtils.uploadToCDNAndGetUrl(mf.getBytes());
        		if (StringUtils.isNotBlank(ret)) {
        			ret = ret + ",";
        		}
        		ret += url;
        	}
        }
        return ret;
    }
    
    protected String saveFileAndReturnFileNameForAdmin(HttpServletRequest request, String formInputName, String filePath, String userFileName) throws IOException {
        MultipartHttpServletRequest mhs = (MultipartHttpServletRequest) request;  
        MultipartFile mf = mhs.getFile(formInputName);
        
        
        String fileName = userFileName; 
        if (mf != null && !mf.isEmpty()) {
            if (StringUtils.isBlank(fileName)) { // 没有指定文件名就生成
                fileName = mf.getOriginalFilename();
                System.out.println("original file name: " + fileName);
                fileName = UUID.randomUUID().toString() + fileName.substring(fileName.lastIndexOf("."));
            }
            File path = new File(filePath);
            if (!path.exists()) {
                path.mkdirs();
            }
            File file = new File(filePath + "/" + fileName);
            if (!file.exists()) {
                mf.transferTo(file);
            } else {
                throw new BizException("该文件已经存在");
            }
        }
        return fileName;
    }
    
    protected void requiredString(String str, String msg) {
        ValidationUtils.assertTrue(StringUtils.isNotBlank(str), msg);
    }
    
    protected String formatDate(Date date, String pattern) {
        if (date == null) {
            return "";
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
        return dateFormat.format(date);
    }
    
    protected String wsAdminIndex() {
        return "wsadmin/wsadmin_index";
    }
    
}
