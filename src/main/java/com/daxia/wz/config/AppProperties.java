package com.daxia.wz.config;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;

import com.daxia.wz.common.AppPropertyKey;

/**
 * This class will read classpath file app.properties
 * 
 * @date 2013-2-14
 */
public class AppProperties {
    private static Logger logger = Logger.getLogger(AppProperties.class);
    private static Map<String, String> map = new HashMap<String, String>();
    static {
        try {
            InputStream is = AppProperties.class.getClassLoader().getResourceAsStream("app.properties");
            Properties props = new Properties();
            props.load(is);
            for (Object key : props.keySet()) {
                map.put(key.toString(), props.get(key).toString());
            }
        } catch (IOException e) {
            logger.error(e, e);
        }
        
        try {
            InputStream is = AppProperties.class.getClassLoader().getResourceAsStream("config.properties");
            Properties props = new Properties();
            props.load(is);
            for (Object key : props.keySet()) {
                map.put(key.toString(), props.get(key).toString());
            }
        } catch (IOException e) {
            logger.error(e, e);
        }
    }
    
    public static String get(String key) {
        return map.get(key);
    }
    
    public static String get(AppPropertyKey key) {
        return map.get(key.getRemark());
    }
}
