<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<td>
<c:forEach var="fn" items="${hldUvd.lazLstFds(cls)}" varStatus="varStatus">
  <c:set var="varStatus" value="${varStatus}" scope="request"/>
  <c:set var="ceDe" value="${hldUvd.stg(cls,fn,'ceDe')}" scope="request"/>
  <c:if test="${not empty ceDe}">
    <c:set var="fdNm" value="${fn}" scope="request"/>
    <c:set var="mdl" value="${ent[fn]}" scope="request"/>
    <jsp:include page="${ceDe}.jsp"/>
  </c:if>
</c:forEach>
</td>
