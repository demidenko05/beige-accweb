<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty txbl}">
  <td>
    <jsp:include page="../st/${hldUvd.stgNn(cls,fdNm,'str')}.jsp"/>
  </td>
</c:if>
<c:if test="${not empty txbl}">
  <c:if test="${empty ent.ownr.cuFr}">
    <td>${hldUvd.toStr(rvs,cls,'pri',ent['pri'])}</td>
    <c:if test="${txbl && !inTx || txb && stIb}">
      <td>${hldUvd.toStr(rvs,cls,'subt',ent['subt'])}</td>
    </c:if>
    <c:if test="${txbl && !stIb}">
      <td>${hldUvd.toStr(rvs,cls,'toTx',ent['toTx'])}</td>
    </c:if>
    <c:if test="${!txbl || !stIb}">
      <td>${hldUvd.toStr(rvs,cls,'tot',ent['tot'])}</td>
    </c:if>
  </c:if>
  <c:if test="${not empty ent.ownr.cuFr}">
    <td>${hldUvd.toStr(rvs,cls,'prFc',ent['prFc'])}</td>
    <c:if test="${txbl && !inTx || txb && stIb}">
      <td>${hldUvd.toStr(rvs,cls,'suFc',ent['suFc'])}</td>
    </c:if>
    <c:if test="${txbl && !stIb}">
      <td>${hldUvd.toStr(rvs,cls,'txFc',ent['txFc'])}</td>
    </c:if>
    <c:if test="${!txbl || !stIb}">
      <td>${hldUvd.toStr(rvs,cls,'toFc',ent['toFc'])}</td>
    </c:if>
  </c:if>
</c:if>
