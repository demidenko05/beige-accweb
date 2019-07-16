<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty txbl}">
  | ${i18n.getMsg(fdNm, rvs.upf.lng.iid)}
</c:if>
<c:if test="${not empty txbl}">
  <c:if test="${empty rvs.uvs.ent.cuFr}">
    | ${i18n.getMsg("pri", rvs.upf.lng.iid)}
    <c:if test="${txbl && !inTx || txb && stIb}">
      | ${i18n.getMsg("subt", rvs.upf.lng.iid)}
    </c:if>
    <c:if test="${txbl && !stIb}">
      | ${i18n.getMsg("toTx", rvs.upf.lng.iid)}
    </c:if>
    <c:if test="${!txbl || !stIb}">
      | ${i18n.getMsg("tot", rvs.upf.lng.iid)}
    </c:if>
  </c:if>
  <c:if test="${not empty rvs.uvs.ent.cuFr}">
    | ${i18n.getMsg("prFc", rvs.upf.lng.iid)}
    <c:if test="${txbl && !inTx || txb && stIb}">
      | ${i18n.getMsg("suFc", rvs.upf.lng.iid)}
    </c:if>
    <c:if test="${txbl && !stIb}">
      | ${i18n.getMsg("txFc", rvs.upf.lng.iid)}
    </c:if>
    <c:if test="${!txbl || !stIb}">
      | ${i18n.getMsg("toFc", rvs.upf.lng.iid)}
    </c:if>
  </c:if>
</c:if>
