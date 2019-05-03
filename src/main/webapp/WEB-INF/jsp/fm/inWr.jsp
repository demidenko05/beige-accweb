<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="inp" value="${hldUvd.stg(cls,fdNm,'inp')}"/>
<c:if test="${not empty inp}">
  <jsp:include page="../${param.mbl}in/${inp}.jsp"/>
</c:if>
