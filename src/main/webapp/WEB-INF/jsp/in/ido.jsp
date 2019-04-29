<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<input type="hidden" name="${cls.simpleName}.isNew" value="${ent.isNew}"/> 
<input type="hidden" name="${cls.simpleName}.dbOr" value="${ent.dbOr}"/> 
<input type="hidden" name="${cls.simpleName}.ownr" value="${ent.ownr.iid}"/> 
<c:if test="${ent.isNew}">
  <input type="hidden" name="ownrVr" value="${param.ownrVr}"/> 
</c:if>
<c:if test="${!ent.isNew}">
  <input type="hidden" name="ownrVr" value="${ent.ownr.ver}"/> 
  <input type="hidden" name="${cls.simpleName}.ver" value="${ent.ver}"/> 
  <jsp:include page="reo.jsp"/>
</c:if>
