<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ent.isNew}">
  <jsp:include page="nme.jsp"/>
</c:if>
<c:if test="${!ent.isNew}">
  <jsp:include page="nmro.jsp"/>
</c:if>
