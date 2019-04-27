<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="fn" items="${hldUvd.lstFds}">
  <c:set var="fdNm" value="${fn}" scope="request"/>
  <jsp:include page="${hldUvd.stg(cls,fn,'ceHe')}.jsp"/>
</c:forEach>
