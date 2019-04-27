<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="fn" items="${hldUvd.lstFds}">
  <c:set var="fdNm" value="${fn}" scope="request"/>
  <c:set var="mdl" value="${ent[fn]}" scope="request"/>
  <jsp:include page="${hldUvd.stg(cls,fn,'ceDe')}.jsp"/>
</c:forEach>
