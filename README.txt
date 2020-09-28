site: https://sites.google.com/site/beigesoftware

Beigesoft™ Enterprise Information System final standard WEB application (WAR).

debug range #14 (14000..14999)

It's WEB interface based on standard JEE MVC servlet, JSP, JSTL.
It's based on previous beigesoft-webcrud and weboio projects.
Default configuration is PostgreSQL (web.xml) and context.xml for Tomcat JEE JDBC authentication. For MySql rename web-mysql.xml and context-mysql.xml respectively.

Tested/works OK on last Java8 (and last Android 30), Tomcat 7.0.105, Maven 3.6.3, Ant 1.10.8, PostgreSQL 11.7, MySQL 5.5.5-10.3.23-MariaDB (Debian 10)
!!!Tomcat8 can load JARs in different orders, so you should reassemble WAR to use beige-acc.jar XML resources that override beige-blc.jar ones!!!
making own org.apache.tomcat.JarScanner implementation is non-optimal!

To install application on Apache Tomcat 7 (8! jars order loading problem):
1. you should have [postgres/mysql/sqlite] server with created user and empty database
  * default is Postgres, change web.xml and context.xml to other RDBMS if you want
2. make sure that Tomcat has libraries: HikariCP-3.4.5.jar, postgresql-42.2.16.jar/mysql-connector-java-8.0.21.jar/sqlite-jdbc-3.32.3.2.jar, slf4j-api-1.7.30.jar (versions may be different)
3. Unpack WAR file and change user/password/database with yours ones in WEB-INF/classes/potrgres(or mysql)/cmnst.xml:
...
<entry key="dbUrl">[yourdb]</entry>
<entry key="dbUsr">[yourdbusername]</entry>
<entry key="dbPsw">[yourdbuserpass]</entry>
...
or MySql:
...
<entry key="dbUrl">jdbc:mysql://localhost/[yourdb]</entry>
<entry key="checkTbl">select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='[yourdb]' and TABLE_NAME=':tblNm';</entry>
...

change security roles in web.xml

  3.1 !remove duplicates - just unpack beige-acc.jar then beige-blc.jar into WEB-INF/classes without overwriting, then delete them from lib folder
  3.2 Pack new WAR file (it is actually ZIP archive).
4. copy WAR file inside "[tomcat_home]/webapps"
5. type in browser address same as WAR file i.e. "https://[server-address]/beige-accweb"
6. after creating database add users with SQL query:
insert into USTMC (USR, PWD, VER) values ('[useradmin]', '[strongpassword]', 1);
insert into USTMC (USR, PWD, VER) values ('[useruser]', '[strongpassword]', 1);
insert into USRLTMC (USR, ROL, VER)  values ('[useradmin]', '[role1]', 1);
insert into USRLTMC (USR, ROL, VER)  values ('[useruser]', '[role2]', 1);

This is "cloud" version i.e. it's available through network (WEB), so you must make sure that it's used reliable encrypted (HTTPS) connection.

If you has different JEE server, then you have to make JEE-authentication by yourself. E.g. Jetty uses different database tables (USERJETTY ...). You might need to reassemble WAR with new XML settings.

for generating servlets from JSP/JSTL for beige-accjet:
1. Install a-tomcat-all
2. Run $ANT_HOME/bin/ant -Dtomcat.home=$TOMCATA_HOME -Dwebapp.path=target/beige-accweb
3. Copy generated servlets and web.xml config into beige-accjet, reinstall it and beige-accandr

licenses:
BSD 2-Clause License
https://sites.google.com/site/beigesoftware/bsd2csl

TODO: remove duplicates automatically with proguard
