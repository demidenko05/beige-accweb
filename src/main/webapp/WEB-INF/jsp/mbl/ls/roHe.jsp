<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<th>
<c:forEach var="fn" items="${hldUvd.lazLstFds(cls)}" varStatus="varStatus">
  <c:set var="varStatus" value="${varStatus}" scope="request"/>
  <c:set var="ceHe" value="${hldUvd.stg(cls,fn,'ceHe')}" scope="request"/>
  <c:if test="${not empty ceHe}">
    <c:set var="fdNm" value="${fn}" scope="request"/>
    <jsp:include page="${ceHe}.jsp"/>
  </c:if>
</c:forEach>
</th>
