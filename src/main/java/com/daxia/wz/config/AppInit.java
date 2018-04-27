package com.daxia.wz.config;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.daxia.kwx.service.IWxService;

@Component
public class AppInit {
	
	@Autowired
	private IWxService wxService;
	
	@PostConstruct
	public void init() {
		// wxService.init("wx7fce7bda33e3c832", "d4624c36b6795d1d99dcf0547af5443d", ""); // 测试的
		wxService.init("wxee8acc0092afe13c", "60c7eb25223c41278b8c969342327411", 
				"1295829501", "WZsw8888wzsw1299fan5688changsha8", 
				"/data/apiclient_cert.p12"); // 纬中正式的
	}
}
