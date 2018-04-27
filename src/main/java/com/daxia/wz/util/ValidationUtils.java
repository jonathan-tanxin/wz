package com.daxia.wz.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.daxia.core.exception.BizException;

public class ValidationUtils {

    public static void assertTrue(boolean value, String msg) {
        if (!value) {
            throw new BizException(msg);
        }

    }

    public static void validateMobile(String mobile, String msg) {
        Pattern p = Pattern.compile("^1\\d{10}$");
        Matcher m = p.matcher(mobile);
        if (!m.matches()) {
            throw new BizException(msg);
        }
    }
    
    public static void main(String[] args) {
        validateMobile("18670053471", "aa");
    }
}
