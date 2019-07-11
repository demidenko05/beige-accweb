<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<td>
  <jsp:include page="../st/${hldUvd.stgNn(cls,fdNm,'str')}.jsp"/>
</td>
<c:if test="${empty ent.ownr.cuFr}">
  <c:if test="${empty cls.simpleName eq 'PuRtLn'}">
    <td>${numStr.frmt(ent.pri.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.csDp,rvs.upf.dgInGr)}</td>
  </c:if>
  <c:if test="${empty cls.simpleName ne 'PuRtLn'}">
    <td>${numStr.frmt(ent.pri.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}</td>
  </c:if>
  <c:if test="${txbl && !inTx || txb && stIb}">
    <td>${numStr.frmt(ent.subt.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}</td>
  </c:if>
  <c:if test="${txbl && !stIb}">
    <td>${numStr.frmt(ent.toTx.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}</td>
  </c:if>
  <c:if test="${!txbl || !stIb}">
    <td>${numStr.frmt(ent.tot.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}</td>
  </c:if>
</c:if>
<c:if test="${not empty ent.ownr.cuFr}">
  <c:if test="${empty cls.simpleName eq 'PuRtLn'}">
    <td>${numStr.frmt(ent.prFc.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.csDp,rvs.upf.dgInGr)}</td>
  </c:if>
  <c:if test="${empty cls.simpleName ne 'PuRtLn'}">
    <td>${numStr.frmt(ent.prFc.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}</td>
  </c:if>
  <c:if test="${txbl && !inTx || txb && stIb}">
    <td>${numStr.frmt(ent.suFc.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}</td>
  </c:if>
  <c:if test="${txbl && !stIb}">
    <td>${numStr.frmt(ent.txFc.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}</td>
  </c:if>
  <c:if test="${!txbl || !stIb}">
    <td>${numStr.frmt(ent.toFc.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}</td>
  </c:if>
</c:if>
