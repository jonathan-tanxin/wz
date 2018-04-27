package com.daxia.wz.util;

import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.alibaba.fastjson.JSONObject;
import com.daxia.wz.common.AppPropertyKey;
import com.daxia.wz.config.AppProperties;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

public class QiniuUtils {
    private static Logger logger = Logger.getLogger(QiniuUtils.class);
    
    private static String ak = AppProperties.get(AppPropertyKey.QiniuAK);
    private static String sk = AppProperties.get(AppPropertyKey.QiniuSK);
    private static String domain = AppProperties.get(AppPropertyKey.QiniuDomain);
    
    private static String bucket = "daxia";

    public static String upload(byte[] data) {
    	return upload(data, null);
    }
    
    public static String upload(byte[] data, String originalFilename) {
        Auth auth = Auth.create(ak, sk);

        // 简单上传，使用默认策略
        // private String getUpToken0(){
        String upToken = auth.uploadToken(bucket);
        //构造一个带指定Zone对象的配置类
        Configuration cfg = new Configuration(Zone.zone2());
        
        UploadManager uploadManager = new UploadManager(cfg);

        String key = originalFilename;
        if (StringUtils.isBlank(key)) {
        	key = UUID.randomUUID().toString();
        }
        try {
            Response res = uploadManager.put(data, key, upToken);
            
            JSONObject json = JSONObject.parseObject(res.bodyString());
            String fileName = json.getString("key");
            String url = "http://" + domain + "/" + fileName;
            return url;
        } catch (QiniuException e) {
            logger.error(e, e);
            Response r = e.response;
            try {
                // 响应的文本信息
                logger.error(r.bodyString());
            } catch (QiniuException e1) {
                // ignore
            }
        }
        return null;
    }

    public static String download(String Filename) {
        Auth auth = Auth.create(ak, sk);
        long expireInSeconds = 3600;//1小时，可以自定义链接过期时间
        String finalUrl = auth.privateDownloadUrl(Filename, expireInSeconds);
        return finalUrl;
    }
    
    public class MyRet {
        public long fsize;
        public String key;
        public String hash;
        public int width;
        public int height;
    }
}
