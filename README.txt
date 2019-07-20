site: https://sites.google.com/site/beigesoftware

Beigesoft™ Enterprise Information System final standard WEB application (WAR).

debug range #14 (14000..14999)

It's WEB interface based on standard JEE MVC servlet, JSP, JSTL.
It's based on previous beigesoft-webcrud and weboio projects.
Default configuration is PostgreSQL (web.xml) and context.xml for Tomcat JEE JDBC authentication. For MySql rename web-mysql.xml and context-mysql.xml respectively.

To install application on Apache Tomcat 7/8:
1. you should have MySql server with created user and empty database
2. make sure that Tomcat has libraries: HikariCP-2.4.3.jar, postgresql-9.4-1206-jdbc4.jar (or mysql-connector-java-5.1.40.jar), slf4j-api-1.7.12.jar (versions may be different)
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

  Pack new WAR file (it is actually ZIP archive).
4. copy WAR file inside "[tomcat_home]/webapps"
5. type in browser address same as WAR file i.e. "https://[server-address]/beige-accweb"
6. after creating database add users with SQL query:
insert into USTMC (USR, PWD, VER) values ('[useradmin]', '[strongpassword]', 1);
insert into USTMC (USR, PWD, VER) values ('[useruser]', '[strongpassword]', 1);
insert into USRLTMC (USR, ROL, VER)  values ('[useradmin]', '[role1]', 1);
insert into USRLTMC (USR, ROL, VER)  values ('[useruser]', '[role2]', 1);

This is "cloud" version i.e. it's available through network (WEB), so you must make sure that it's used reliable encrypted (HTTPS) connection.

If you has different JEE server, then you have to make JEE-authentication by yourself. E.g. Jetty uses different database tables (USERJETTY ...). You may need to reassemble WAR with new XML settings.

for generating servlets from JSP/JSTL for beige-accjet:
1. Install a-tomcat-all
2. Run $ANT_HOME/bin/ant -Dtomcat.home=$TOMCATA_HOME -Dwebapp.path=target/beige-accweb
3. Copy generated servlets and web.xml config into beige-accjet, reinstall it and beige-accandr

licenses:
BSD 2-Clause License
https://sites.google.com/site/beigesoftware/bsd2csl
