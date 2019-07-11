<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty ent.txCt}">
  <c:set var="tcf" value="bsSetTxCt(0.0,'','${lsPlNm}${param.ent}',${param.flyinTx},${rvs.astg.txDp},${rvs.astg.stRm.ordinal()},${rvs.astg.prDp});"/>
</c:if>
<c:if test="${not empty ent.txCt}">
  <c:set var="tcf" value="bsSetTxCt(${ent.txCt.agRt},'${ent.txCt.nme}','${lsPlNm}${param.ent}',${param.flyinTx},${rvs.astg.txDp},${rvs.astg.stRm.ordinal()},${rvs.astg.prDp});"/>
</c:if>
<c:set var="mdl" value="${ent}" scope="request"/>
<c:set var="apr"><jsp:include page="../st/inl.jsp"/></c:set>
<button class="btn" onClick="bsSelEnt('${ent.iid}',&quot;${apr}&quot;,'${lsPlNm}${param.ent}');bsSetCost(${ent.pri},'${lsPlNm}${param.ent}');${tcf}">${i18n.getMsg("Pick", rvs.upf.lng.iid)}</button>
