<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty txbl}">
  <c:if test="${empty param.mbl}">
    <th>${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</th>
  </c:if>
  <c:if test="${not empty param.mbl}">
    <c:if test="${!isFst}">| </c:if>${i18n.getMsg(fdNm, rvs.upf.lng.iid)}
  </c:if>
</c:if>
