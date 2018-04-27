package com.daxia.wz.aop;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class ServiceAOP {
	private static Logger timeLogger = Logger.getLogger("timeLogger");
    public static final String EDP = "execution(* com.daxia.wy.service..*.*(..))";
    
    @Pointcut(EDP)  
    public void pointcut(){}  
    
    @Before("pointcut()")
    // spring中Before通知
    public void logBefore() {
    }

    @After("pointcut()")
    // spring中After通知
    public void logAfter() {
    }

    @Around("pointcut()")
    // spring中Around通知
    public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable {
    	long start = System.currentTimeMillis();
        Object[] args = joinPoint.getArgs();
        Object obj = null;
        obj = joinPoint.proceed(args);
        if (timeLogger.isDebugEnabled()) {
       		timeLogger.debug("花费[" + (System.currentTimeMillis() - start) + "]处理" + joinPoint.getSignature());
        }
        return obj;
    }
}
