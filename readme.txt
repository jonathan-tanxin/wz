这是一个maven项目，关于如果导进eclipse，可参照网上的教程。
打成war包是在项目目录下(trunk/code/xxx)执行命令mvn clean package -Dmaven.test.skip，生成的war包就会在该目录下的target文件夹下.
运行：
	可以在eclipse里配置tomcat的方式运行，这种方式的话起来后访问地址就是http://localhost:8080/xxx/admin/index
	也可以在eclipse里用jetty:run的方式运行，具体步骤参照网上教程，这种方式的话起来后访问地址就是http://localhost:8080/admin/index
	登陆用户名密码是admin/333333
数据库文件是项目下的 doc/db.sql
数据库配置文件是项目下的 src/main/resources/app.properties

框架说明在doc文件夹下，针对每个功能模块的修改可参考该文档

