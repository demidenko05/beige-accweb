<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty param.knCs}">
  <c:set var="inp" value="${hldUvd.stgNn(cls,fdNm,'inp')}"/>
</c:if>
<c:if test="${not empty param.knCs}">
  <c:set var="inp" value="gnc"/>
</c:if>
<jsp:include page="../${param.mbl}in/${inp}.jsp"/>
