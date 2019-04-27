<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${rvs.cpf.usLoc}" scope="request"/>
<c:if test="${not empty param.mbl}">
  <c:set var="flyPar" value="&mbl=${param.mbl}" scope="request"/>
</c:if>
<c:forEach var="entry" items="${hldUvd.fltMp}">
  <c:set var="flyPar" value="${flyPar}&${entry.key}=${entry.value}" scope="request"/>
</c:forEach>
<c:forEach var="entry" items="${hldUvd.ordMp}">
  <c:set var="flyPar" value="${flyPar}&${entry.key}=${entry.value}" scope="request"/>
</c:forEach>
<c:forEach items="${param}" var="par">
  <c:if test="${par.key.startsWith('fly')}">
    <c:set var="flyPar" value="${flyPar}&${par.key}=${par.value}" scope="request"/>
  </c:if>
</c:forEach>
<c:set var="cls" value="${hldUvd.cls}" scope="request"/>
