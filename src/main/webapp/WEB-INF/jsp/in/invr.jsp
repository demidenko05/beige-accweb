<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="txbl" value="${ent.inv != null && ent.inv.toTx.compareTo(java.math.BigDecimal.ZERO) eq 1}" scope="request"/>
<c:if test="${txbl && empty ent.dbcr.txDs}">
  <c:set var="stIb" value="${rvs.astg.stIb}" scope="request"/>
  <c:set var="stAg" value="${rvs.astg.stAg}" scope="request"/>
  <c:set var="stRm" value="${rvs.astg.stRm}" scope="request"/>
</c:if>
<c:if test="${txbl && not empty ent.dbcr.txDs}">
  <c:set var="stIb" value="${ent.dbcr.txDs.stIb}" scope="request"/>
  <c:set var="stAg" value="${ent.dbcr.txDs.stAg}" scope="request"/>
  <c:set var="stRm" value="${ent.dbcr.txDs.stRm}" scope="request"/>
</c:if>
<c:if test="${cls.simpleName eq 'PuInGdLn'}"><c:set var="priDp" value="${rvs.astg.csDp}"/></c:if>
<c:if test="${cls.simpleName ne 'PuInGdLn'}"><c:set var="priDp" value="${rvs.astg.prDp}"/></c:if>
<c:if test="${txbl && !stIb && (stAg || ent.inTx)}">
  <c:set var="calcTotalFnNm" value="bsClcToTx"/>
  <c:set var="calcPriceFnNm" value="bsClcPriTx"/>
  <c:set var="taxParam" value=",${ent.inTx},${rvs.astg.prDp},${stRm.ordinal()}"/>
</c:if>
<c:if test="${!(txbl && !stIb && (stAg || ent.inTx))}">
  <c:set var="calcTotalFnNm" value="bsClcTot"/>
  <c:set var="calcPriceFnNm" value="bsClcPri"/>
  <c:set var="taxParam" value=""/>
</c:if>
<tr>
  <td>
    <label for="${cls.simpleName}${fdNm}ApVsb">${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
  </td>
<c:if test="${not empty param.mbl}"></tr><tr></c:if>
  <td>
    <div class="input-line">
      <c:if test="${not empty ent[fdNm]}">
        <c:set var="mdl" value="${ent[fdNm]}" scope="request"/>
        <c:set var="prApr"><jsp:include page="../st/inv.jsp"/></c:set>
      </c:if>
      <input class="picked-appearence" id="${cls.simpleName}${fdNm}ApVsb" disabled="disabled" type="text" value="${prApr}">
      <input id="${cls.simpleName}${fdNm}Id" required type="hidden" name="${cls.simpleName}.${fdNm}" value="${ent[fdNm].iid}">
      <c:if test="${ent.tot.compareTo(java.math.BigDecimal.ZERO) eq 0}">
        <button type="button" class="btn" onclick="bsPick('${hldUvd.fldCls(cls,fdNm).simpleName}','${cls.simpleName}','${fdNm}','&fopmdEnrVl=true&foprvIdOpr1=isnull&fopfrcd=mdEnr,rvId&mbl=${param.mbl}');">...</button>
        <button type="button" class="btn" onclick="bsClrSelEnt('${cls.simpleName}${fdNm}');">X</button>
      </c:if>
    </div>
  </td>
</tr>
<c:if test="${not empty ent.inv}">
  <tr>
    <td>
      <label>${i18n.getMsg("dbcr", rvs.upf.lng.iid)}</label>
    </td>
  <c:if test="${not empty param.mbl}"></tr><tr></c:if>
    <td>
      <div class="input-line">
        <input disabled value="${ent.dbcr.nme}"/> 
        <input type="hidden" name="${cls.simpleName}.${fdNm}" value="${ent.dbcr.nme}"/> 
      </div>
    </td>
  </tr>
  <c:if test="${not empty ent.cuFr}">
    <c:set var="fdNm" value="cuFr" scope="request"/>
    <jsp:include page="nme.jsp"/>
    <c:set var="fdNm" value="exRt" scope="request"/>
    <jsp:include page="max.jsp"/>
  </c:if>
</c:if>
<c:if test="${txbl}">
  <tr>
    <td>
      <label>${i18n.getMsg("omTx", rvs.upf.lng.iid)}
        <c:if test="${!ent.omTx}">
          , ${i18n.getMsg("inTx", rvs.upf.lng.iid)}
        </c:if>
      </label>
    </td>
  <c:if test="${not empty param.mbl}"></tr><tr></c:if>
    <td>
      <div class="input-line">
        <c:if test="${!ent.omTx}">
          <input disabled value="${ent.omTx}, ${ent.inTx}"/> 
        </c:if>
        <c:if test="${ent.omTx}">
          <input disabled value="${ent.omTx}"/> 
        </c:if>
      </div>
    </td>
  </tr>
</c:if>
