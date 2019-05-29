<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty mdl}">
  ${i18n.getMsg(hlTySac.clsMp.get(mdl).simpleName, rvs.upf.lng.iid)}
</c:if>
