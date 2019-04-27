<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="${lsPlNm}lst">
  <jsp:include page="lst.jsp"/>
</div>
<c:set var="flOr" value="${hldUvd.stg(cls, 'flOr')}"/>
<c:if test="${not empty flOr}">
  <jsp:include page="fo/${flOr}.jsp"/>
</c:if>
