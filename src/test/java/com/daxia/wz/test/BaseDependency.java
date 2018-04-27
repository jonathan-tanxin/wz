package com.daxia.wz.test;

import org.apache.log4j.Logger;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

public abstract class BaseDependency extends AbstractTransactionalJUnit4SpringContextTests {

    protected  Logger logger = Logger.getLogger(getClass());

}
