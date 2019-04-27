<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${mdl}">
  ${i18n.getMsg('Yes', rvs.upf.lng.iid)}
</c:if>
<c:if test="${not mdl}">
  ${i18n.getMsg('No', rvs.upf.lng.iid)}
</c:if>
