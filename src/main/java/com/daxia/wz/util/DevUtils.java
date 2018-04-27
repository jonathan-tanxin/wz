package com.daxia.wz.util;

import java.io.File;

public class DevUtils {

    public static boolean isLocal() {
        return (new File("/Users/kevin").exists() || new File("/Users").exists());
        //return false;
    }
}
