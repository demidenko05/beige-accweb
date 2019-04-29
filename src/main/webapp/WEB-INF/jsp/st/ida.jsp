<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty ent.idOr}">
  ${ent.dbOr}-${ent.iid}
</c:if>
<c:if test="${not empty ent.idOr}">
  ${ent.dbOr}-${ent.idOr}
</c:if>
