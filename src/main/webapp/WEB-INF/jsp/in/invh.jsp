<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ent.getClass().simpleName eq 'PurInv'}"><c:set var="txbl" value="${rvs.astg.stExp && !ent.omTx}" scope="request"/><c:set var="extTx" value="${rvs.astg.stExp}" scope="request"/></c:if>
<c:if test="${ent.getClass().simpleName eq 'SalInv'}"><c:set var="txbl" value="${rvs.astg.stExs && !ent.omTx}" scope="request"/><c:set var="extTx" value="${rvs.astg.stExs}" scope="request"/></c:if>
<c:if test="${txbl && empty ent.dbcr.txDs}">
  <c:set var="stIb" value="${rvs.astg.stIb}" scope="request"/>
  <c:set var="stAg" value="${rvs.astg.stAg}" scope="request"/>
  <c:set var="stRm" value="${rvs.astg.stRm}" scope="request"/>
</c:if>
<c:if test="${txbl && not empty ent.dbcr.txDs}">
  <c:set var="txDs" value="${ent.dbcr.txDs}" scope="request"/>
  <c:set var="stIb" value="${ent.dbcr.txDs.stIb}" scope="request"/>
  <c:set var="stAg" value="${ent.dbcr.txDs.stAg}" scope="request"/>
  <c:set var="stRm" value="${ent.dbcr.txDs.stRm}" scope="request"/>
</c:if>
<c:set var="inTx" value="${ent.inTx}" scope="request"/>
<c:if test="${empty ent.prep && (ent.tot.compareTo(java.math.BigDecimal.ZERO) eq 0 || empty ent.dbcr.txDs)}">
  <tr>
    <td>
      <label for="${cls.simpleName}${fdNm}ApVsb">${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
    </td>
  <c:if test="${not empty param.mbl}"></tr><tr></c:if>
    <td>
      <div class="input-line">
        <input class="picked-appearence" id="${cls.simpleName}${fdNm}ApVsb" disabled="disabled" type="text" value="${ent[fdNm].nme}">
        <input id="${cls.simpleName}${fdNm}Id" required type="hidden" name="${cls.simpleName}.${fdNm}" value="${ent[fdNm].iid}">
        <button type="button" class="btn" onclick="bsPick('${hldUvd.fldCls(cls,fdNm).simpleName}','${cls.simpleName}','${fdNm}','&mbl=${param.mbl}');">...</button>
        <button type="button" class="btn" onclick="bsClrSelEnt('${cls.simpleName}${fdNm}');">X</button>
      </div>
    </td>
  </tr>
</c:if>
<c:if test="${!(empty ent.prep && (ent.tot.compareTo(java.math.BigDecimal.ZERO) eq 0 || empty ent.dbcr.txDs))}">
  <jsp:include page="reo.jsp"/>
</c:if>
<c:if test="${ent.tot.compareTo(java.math.BigDecimal.ZERO) eq 0}">
  <c:set var="fdNm" value="cuFr" scope="request"/>
  <jsp:include page="nme.jsp"/>
  <c:set var="fdNm" value="exRt" scope="request"/>
  <jsp:include page="max.jsp"/>
</c:if>
