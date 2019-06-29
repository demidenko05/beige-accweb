<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty ent.ownr.cuFr}">
  <td><jsp:include page="../st/${hldUvd.stgNn(cls,'pri','str')}.jsp"/></td>
  <c:if test="${txbl && !inTx || txb && stIb}">
    <td><jsp:include page="../st/${hldUvd.stgNn(cls,'subt','str')}.jsp"/></td>
  </c:if>
  <c:if test="${txbl && !stIb}">
    <td><jsp:include page="../st/${hldUvd.stgNn(cls,'toTx','str')}.jsp"/></td>
  </c:if>
  <c:if test="${!txbl || !stIb}">
    <td><jsp:include page="../st/${hldUvd.stgNn(cls,'tot','str')}.jsp"/></td>
  </c:if>
</c:if>
<c:if test="${not empty ent.ownr.cuFr}">
  <td><jsp:include page="../st/${hldUvd.stgNn(cls,'prFc','str')}.jsp"/></td>
  <c:if test="${txbl && !inTx || txb && stIb}">
    <td><jsp:include page="../st/${hldUvd.stgNn(cls,'suFc','str')}.jsp"/></td>
  </c:if>
  <c:if test="${txbl && !stIb}">
    <td><jsp:include page="../st/${hldUvd.stgNn(cls,'txFc','str')}.jsp"/></td>
  </c:if>
  <c:if test="${!txbl || !stIb}">
    <td><jsp:include page="../st/${hldUvd.stgNn(cls,'toFc','str')}.jsp"/></td>
  </c:if>
</c:if>
