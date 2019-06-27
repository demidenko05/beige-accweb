<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty ent.cuFr}">
  <th>${i18n.getMsg("pri", rvs.upf.lng.iid)}</th>
  <c:if test="${txbl && !inTx || txb && stIb}">
    <th>${i18n.getMsg("subt", rvs.upf.lng.iid)}</th>
  </c:if>
  <c:if test="${txbl && !stIb}">
    <th>${i18n.getMsg("toTx", rvs.upf.lng.iid)}</th>
  </c:if>
  <c:if test="${!txbl || !stIb}">
    <th>${i18n.getMsg("tot", rvs.upf.lng.iid)}</th>
  </c:if>
</c:if>
<c:if test="${not empty ent.cuFr}">
  <th>${i18n.getMsg("priFc", rvs.upf.lng.iid)}</th>
  <c:if test="${txbl && !inTx || txb && stIb}">
    <th>${i18n.getMsg("suFc", rvs.upf.lng.iid)}</th>
  </c:if>
  <c:if test="${txbl && !stIb}">
    <th>${i18n.getMsg("txFc", rvs.upf.lng.iid)}</th>
  </c:if>
  <c:if test="${!txbl || !stIb}">
    <th>${i18n.getMsg("toFc", rvs.upf.lng.iid)}</th>
  </c:if>
</c:if>
