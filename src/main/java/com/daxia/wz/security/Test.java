package com.daxia.wz.security;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;

public class Test {
	
	public static void main(String[] args) throws IOException {
		File[] files = new File("/Users/kevin/git/wz/src/main/webapp/WEB-INF/jsp/wx").listFiles();
		for (File file : files) {
			String name = file.getName().replace("wx_", "").replace(".jsp", "");
			
			String s = "@RequestMapping(\"" + name + "\")";
			s += "public String " + name + "(Map<String, Object> map) throws Exception {";
			s += "return \"wx/wx_" + name + "\";";
			s += "}";
			System.out.println(s);
			}
	}
    
}
