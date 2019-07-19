<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty txbl}">
  | <jsp:include page="../../st/${hldUvd.stgNn(cls,fdNm,'str')}.jsp"/>
</c:if>
<c:if test="${not empty txbl}">
  <c:if test="${empty ent.ownr.cuFr}">
    | ${hldUvd.toStr(rvs,cls,'pri',ent['pri'])}
    <c:if test="${txbl && !inTx || txb && stIb}">
      | ${hldUvd.toStr(rvs,cls,'subt',ent['subt'])}
    </c:if>
    <c:if test="${txbl && !stIb}">
      | ${hldUvd.toStr(rvs,cls,'toTx',ent['toTx'])}
    </c:if>
    <c:if test="${!txbl || !stIb}">
      | ${hldUvd.toStr(rvs,cls,'tot',ent['tot'])}
    </c:if>
  </c:if>
  <c:if test="${not empty ent.ownr.cuFr}">
    | ${hldUvd.toStr(rvs,cls,'prFc',ent['prFc'])}
    <c:if test="${txbl && !inTx || txb && stIb}">
      | ${hldUvd.toStr(rvs,cls,'suFc',ent['suFc'])}
    </c:if>
    <c:if test="${txbl && !stIb}">
      | ${hldUvd.toStr(rvs,cls,'txFc',ent['txFc'])}
    </c:if>
    <c:if test="${!txbl || !stIb}">
      | ${hldUvd.toStr(rvs,cls,'toFc',ent['toFc'])}
    </c:if>
  </c:if>
</c:if>