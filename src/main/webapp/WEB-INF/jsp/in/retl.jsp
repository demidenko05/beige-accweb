<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="txbl" value="${ent.ownr.inv.toTx.compareTo(java.math.BigDecimal.ZERO) eq 1}" scope="request"/>
<c:if test="${txbl && empty ent.ownr.dbcr.txDs}">
  <c:set var="stIb" value="${rvs.astg.stIb}" scope="request"/>
  <c:set var="stAg" value="${rvs.astg.stAg}" scope="request"/>
  <c:set var="stRm" value="${rvs.astg.stRm}" scope="request"/>
</c:if>
<c:if test="${txbl && not empty ent.ownr.dbcr.txDs}">
  <c:set var="stIb" value="${ent.ownr.dbcr.txDs.stIb}" scope="request"/>
  <c:set var="stAg" value="${ent.ownr.dbcr.txDs.stAg}" scope="request"/>
  <c:set var="stRm" value="${ent.ownr.dbcr.txDs.stRm}" scope="request"/>
</c:if>
<c:if test="${cls.simpleName eq 'PuRtLn'}"><c:set var="priDp" value="${rvs.astg.csDp}"/></c:if>
<c:if test="${cls.simpleName ne 'PuRtLn'}"><c:set var="priDp" value="${rvs.astg.prDp}"/></c:if>
<c:if test="${txbl && !stIb && (stAg || ent.ownr.inTx)}">
  <c:set var="calcTotalFnNm" value="bsClcToTx"/>
  <c:set var="calcPriceFnNm" value="bsClcPriTx"/>
  <c:set var="taxParam" value=",${ent.ownr.inTx},${rvs.astg.prDp},${stRm.ordinal()}"/>
</c:if>
<c:if test="${!(txbl && !stIb && (stAg || ent.ownr.inTx))}">
  <c:set var="calcTotalFnNm" value="bsClcTot"/>
  <c:set var="calcPriceFnNm" value="bsClcPri"/>
  <c:set var="taxParam" value=""/>
</c:if>
<tr>
  <td>
    <label for="${cls.simpleName}${fdNm}ApVsb">${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <c:if test="${not empty ent[fdNm]}">
        <c:set var="mdl" value="${ent[fdNm]}" scope="request"/>
        <c:if test="${cls.simpleName eq 'PuRtLn'}"><c:set var="prApr"><jsp:include page="../st/pinl.jsp"/></c:set></c:if>
        <c:if test="${cls.simpleName ne 'PuRtLn'}"><c:set var="prApr"><jsp:include page="../st/inl.jsp"/></c:set></c:if>
      </c:if>
      <input class="picked-appearence" id="${cls.simpleName}${fdNm}ApVsb" disabled="disabled" type="text" value="${prApr}">
      <input id="${cls.simpleName}${fdNm}Id" required type="hidden" name="${cls.simpleName}.${fdNm}" value="${ent[fdNm].iid}">
      <c:if test="${txbl}"><c:set var="flyInTx" value="&flyinTx=${ent.ownr.inTx}"/></c:if>
      <button type="button" class="btn" onclick="bsPick('${hldUvd.fldCls(cls,fdNm).simpleName}','${cls.simpleName}','${fdNm}','${flyInTx}&fopownrOpr=eq&fopownrVlId=${ent.ownr.inv.iid}&foprvIdOpr1=isnull&fopfrcd=ownr,rvId&mbl=${param.mbl}');">...</button>
      <button type="button" class="btn" onclick="bsClrSelEnt('${cls.simpleName}${fdNm}');">X</button>
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${cls.simpleName}.pri">
      <c:if test="${not empty ent.ownr.cuFr}">${i18n.getMsg("prFc", rvs.upf.lng.iid)}</c:if>
      <c:if test="${empty ent.ownr.cuFr}">${i18n.getMsg("pri", rvs.upf.lng.iid)}</c:if>
      <c:if test="${txbl && ent.ownr.inTx}">${i18n.getMsg("include_taxes", rvs.upf.lng.iid)}</c:if>
      <c:if test="${txbl && !ent.ownr.inTx}">${i18n.getMsg("without_taxes", rvs.upf.lng.iid)}</c:if>
    </label>
  </td>
  <td>
    <div class="input-line">
      <c:if test="${not empty ent.ownr.cuFr}">
        <input type="text" class="bsNum${priDp} changingTot" required id="${cls.simpleName}pri" name="${cls.simpleName}.prFc" value="${ent.prFc}"/> 
      </c:if>
      <c:if test="${empty ent.ownr.cuFr}">
        <input type="text" class="bsNum${priDp} changingTot" required id="${cls.simpleName}pri" name="${cls.simpleName}.pri" value="${ent.pri}"/> 
      </c:if>
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${cls.simpleName}.quan">${i18n.getMsg("quan", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input type="text" class="bsNum${rvs.astg.quDp} changingTot" required id="${cls.simpleName}quan" name="${cls.simpleName}.quan" value="${ent.quan}"/> 
    </div>
  </td>
</tr>
<c:if test="${!txbl || ent.ownr.inTx}">
<tr>
  <td>
    <label for="${cls.simpleName}.tot">
      <c:if test="${not empty ent.ownr.cuFr}">
        ${i18n.getMsg("toFc", rvs.upf.lng.iid)}
      </c:if>
      <c:if test="${empty ent.ownr.cuFr}">
        ${i18n.getMsg("tot", rvs.upf.lng.iid)}
      </c:if>
    </label>
  </td>
  <td>
    <div class="input-line">
      <c:if test="${not empty ent.ownr.cuFr}">
        <input type="text" class="bsNum${rvs.astg.prDp}" id="${cls.simpleName}tot" name="${cls.simpleName}.toFc" value="${ent.toFc}"/> 
      </c:if>
      <c:if test="${empty ent.ownr.cuFr}">
        <input type="text" class="bsNum${rvs.astg.prDp}" id="${cls.simpleName}tot" name="${cls.simpleName}.tot" value="${ent.tot}"/> 
      </c:if>
    </div>
  </td>
</tr>
</c:if>
<c:if test="${!(!txbl || ent.ownr.inTx)}">
<tr>
  <td>
    <label for="${cls.simpleName}.tot">
      <c:if test="${not empty ent.ownr.cuFr}">
        ${i18n.getMsg("suFc", rvs.upf.lng.iid)}
      </c:if>
      <c:if test="${empty ent.ownr.cuFr}">
        ${i18n.getMsg("subt", rvs.upf.lng.iid)}
      </c:if>
    </label>
  </td>
  <td>
    <div class="input-line">
      <c:if test="${not empty ent.ownr.cuFr}">
        <input type="text" class="bsNum${rvs.astg.prDp}" id="${cls.simpleName}tot" name="${cls.simpleName}.suFc" value="${ent.suFc}"/> 
      </c:if>
      <c:if test="${empty ent.ownr.cuFr}">
        <input type="text" class="bsNum${rvs.astg.prDp}" id="${cls.simpleName}tot" name="${cls.simpleName}.subt" value="${ent.subt}"/> 
      </c:if>
    </div>
  </td>
</tr>
</c:if>
<c:if test="${txbl}">
  <tr>
    <td>
      <label>
         ${i18n.getMsg("txCt", rvs.upf.lng.iid)}
      </label>
    </td>
    <td>
      <div class="input-line">
        <input type="text" disabled id="${cls.simpleName}txCt" value="${ent.txCt.nme}"/> 
      </div>
    </td>
  </tr>
  <c:if test="${!stIb && (stAg || ent.ownr.inTx)}">
    <tr>
      <td>
        <label>${i18n.getMsg("rate", rvs.upf.lng.iid)}</label>
      </td>
      <td>
        <div class="input-line">
          <c:if test="${not empty ent.txCt}">
            <c:set var="agRt" value="${numStr.frmt(ent.txCt.agRt.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.txDp,rvs.upf.dgInGr)}"/>
          </c:if>
          <c:if test="${empty ent.txCt}">
            <c:set var="agRt" value="${numStr.frmt('0.0',rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.txDp,rvs.upf.dgInGr)}"/>
          </c:if>
          <input type="text" disabled id="${cls.simpleName}rate" value="${agRt}"/> 
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <label>${i18n.getMsg("toTx", rvs.upf.lng.iid)}</label>
      </td>
      <td>
        <div class="input-line">
          <input type="text" required id="${cls.simpleName}toTx" name="${cls.simpleName}.toTx" class="bsNum${rvs.astg.prDp}" value="${ent.toTx}" onchange="bsInpChn(this);"/> 
        </div>
      </td>
    </tr>      
  </c:if>
</c:if>
<c:set target="${usdDp}" property="${priDp.toString()}" value="${priDp.toString()}"/>
<c:set target="${usdDp}" property="${rvs.astg.prDp.toString()}" value="${rvs.astg.prDp.toString()}"/>
<c:set target="${usdDp}" property="${rvs.astg.quDp.toString()}" value="${rvs.astg.quDp.toString()}"/>
<c:set var="numJsAfl" value="jQuery('#${cls.simpleName}tot').on('change', function(){${calcPriceFnNm}(this,'${cls.simpleName}','pri',${priDp},${rvs.astg.rndm.ordinal()}${taxParam});});"/>
<c:set var="numJsAfl" value="${numJsAfl}jQuery('.changingTot').on('change', function(){${calcTotalFnNm}(this,'${cls.simpleName}','pri',${priDp},${rvs.astg.rndm.ordinal()}${taxParam});});"/>
<c:if test="${not empty numJsAf}">
  <c:set var="numJsAf" value="${numJsAf}${numJsAfl}" scope="request"/>
</c:if>
<c:if test="${empty numJsAf}">
  <c:set var="numJsAf" value="${numJsAfl}" scope="request"/>
</c:if>
