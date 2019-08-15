<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="isFiAc" value="${ent.spec.typ eq 'FILE' || ent.spec.typ eq 'IMAGE' || ent.spec.typ eq 'IMAGE_IN_SET'}" scope="request"/>
<c:if test="${isFiAc}">
  <c:set var="frAct" value="upl" scope="request"/>
</c:if>
<jsp:include page="ed.jsp"/>
