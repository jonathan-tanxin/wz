package com.daxia.wz.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class WXUrlUtils {

    // snsapi_userinfo
    private static final String URL_TEMPLATE = "https://open.weixin.qq.com/connect/oauth2/authorize?appid={appid}&redirect_uri={url}&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect";
    
    // snsapi_userbase
    //private static final String URL_TEMPLATE = "https://open.weixin.qq.com/connect/oauth2/authorize?appid={appid}&redirect_uri={url}&response_type=code&scope=snsapi_userbase&state=123#wechat_redirect";
    
    public static String buildWxUrl(String originalUrl, String appid) {
        try {
            originalUrl = URLEncoder.encode(originalUrl, "utf-8");
            //System.out.println(originalUrl);
            String url = URL_TEMPLATE;
            url = url.replace("{appid}", appid);
            url = url.replace("{url}", originalUrl);
            return url;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return originalUrl;
    }

    public static void main(String[] args) {
        String url = "http://www.wzsw28.com/wx/memberCenter";
        //String appid = "wx7fce7bda33e3c832"; // kevin test
        String appid = "wxee8acc0092afe13c"; // wz生物
        System.out.println(buildWxUrl(url, appid));
    }

}
