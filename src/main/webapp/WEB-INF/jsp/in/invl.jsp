<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${txbl && stIb && (stAg || ent.ownr.inTx)}">
  <c:set var="calcTotalFnNm" value="calcTotalTax"/>
  <c:set var="calcPriceFnNm" value="calcPriceTax"/>
  <c:set var="taxParam" value=",${ent.ownr.inTx},${rvs.astg.prDp},${rvs.astg.salTaxRoundMode.ordinal()}"/>
</c:if>
<c:if test="${!(txbl && stIb && (stAg || ent.ownr.inTx))}">
  <c:set var="calcTotalFnNm" value="calcTotal"/>
  <c:set var="calcPriceFnNm" value="calcPrice"/>
  <c:set var="taxParam" value=""/>
</c:if>
<tr>
  <td>
    <label for="${ent.getClass().simpleName}.pri">
      <c:if test="${not empty ent.ownr.cuFr}">
        ${i18n.getMsg("prFc", rvs.upf.lng.iid)}
      </c:if>
      <c:if test="${empty ent.ownr.cuFr}">
        ${i18n.getMsg("pri", rvs.upf.lng.iid)}
      </c:if>
      <c:if test="${txbl && ent.ownr.inTx}">
        ${i18n.getMsg("include_taxes", rvs.upf.lng.iid)}
      </c:if>
      <c:if test="${txbl && !ent.ownr.inTx}">
        ${i18n.getMsg("without_taxes", rvs.upf.lng.iid)}
      </c:if>
    </label>
  </td>
  <td>
    <div class="input-line">
      <c:if test="${not empty ent.ownr.cuFr}">
        <input type="text" class="bsNum${rvs.astg.prDp} changingTot" required id="${ent.getClass().simpleName}pri" name="${ent.getClass().simpleName}.prFc" value="${ent.prFc}"/> 
      </c:if>
      <c:if test="${empty ent.ownr.cuFr}">
        <input type="text" class="bsNum${rvs.astg.prDp} changingTot" required id="${ent.getClass().simpleName}pri" name="${ent.getClass().simpleName}.pri" value="${ent.pri}"/> 
      </c:if>
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${ent.getClass().simpleName}.quan">${i18n.getMsg("quan", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input type="text" class="bsNum${rvs.astg.quDp} changingTot" required id="${ent.getClass().simpleName}quan" name="${ent.getClass().simpleName}.quan" value="${ent.quan}"/> 
    </div>
  </td>
</tr>
<c:if test="${!txbl || ent.ownr.inTx}">
<tr>
  <td>
    <label for="${ent.getClass().simpleName}.tot">
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
        <input type="text" class="bsNum${rvs.astg.prDp}" id="${ent.getClass().simpleName}tot" name="${ent.getClass().simpleName}.toFc" value="${ent.toFc}"/> 
      </c:if>
      <c:if test="${empty ent.ownr.cuFr}">
        <input type="text" class="bsNum${rvs.astg.prDp}" id="${ent.getClass().simpleName}tot" name="${ent.getClass().simpleName}.tot" value="${ent.tot}"/> 
      </c:if>
    </div>
  </td>
</tr>
</c:if>
<c:if test="${!(!txbl || ent.ownr.inTx)}">
<tr>
  <td>
    <label for="${ent.getClass().simpleName}.tot">
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
        <input type="text" class="bsNum${rvs.astg.prDp}" id="${ent.getClass().simpleName}tot" name="${ent.getClass().simpleName}.suFc" value="${ent.suFc}"/> 
      </c:if>
      <c:if test="${empty ent.ownr.cuFr}">
        <input type="text" class="bsNum${rvs.astg.prDp}" id="${ent.getClass().simpleName}tot" name="${ent.getClass().simpleName}.subt" value="${ent.subt}"/> 
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
        <c:if test="${empty ent.txCt && not empty ent.ownr.dbcr.txDs}">
          <button type="button" id="${ent.getClass().simpleName}btTxDs" class="btn" onclick="if (document.getElementById('${invLnItId}').value != '') { getHtmlByAjax('GET', 'nontransact/?nmPrc=PrcRevealTaxCat&nmRnd=revealTaxCatJson&flyPrIncTax=${ent.ownr.inTx}&nmEnt=${ent.getClass().simpleName}&taxDestId=${ent.ownr.dbcr.txDs.itsId}&itemId=' + document.getElementById('${invLnItId}').value + '');}">${i18n.getMsg("Reveal", rvs.upf.lng.iid)}</button>
        </c:if>
      </label>
    </td>
    <td>
      <div class="input-line">
        <input type="text" disabled id="${ent.getClass().simpleName}txCt" value="${ent.txCt.nme}"/> 
      </div>
    </td>
  </tr>
  <c:if test="${stIb && (stAg || ent.ownr.inTx)}">
    <tr>
      <td>
        <label>
           ${i18n.getMsg("rate", rvs.upf.lng.iid)}
        </label>
      </td>
      <td>
        <div class="input-line">
           <c:if test="${empty ent.txCt && not empty ent.ownr.dbcr.txDs}">
            <c:set var="agRt" value=""/>
          </c:if>
          <c:if test="${empty ent.txCt && empty ent.ownr.dbcr.txDs}">
            <c:set var="agRt" value="${numStr.frmt('0.0',rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.txDp,rvs.upf.dgInGr)}"/>
          </c:if>
          <c:if test="${not empty ent.txCt}">
            <c:set var="agRt" value="${numStr.frmt(ent.txCt.agRt.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.txDp,rvs.upf.dgInGr)}"/>
          </c:if>
          <input type="text" disabled id="${ent.getClass().simpleName}rate" value="${agRt}"/> 
        </div>
      </td>
    </tr>
    <tr>
      <td>
        <label>
           ${i18n.getMsg("toTx", rvs.upf.lng.iid)}
        </label>
      </td>
      <td>
        <div class="input-line">
          <input type="text" required id="${ent.getClass().simpleName}toTx" name="${ent.getClass().simpleName}.toTx" class="bsNum${rvs.astg.prDp}" value="${ent.toTx}" onchange="bsInpChn(this);"/> 
        </div>
      </td>
    </tr>      
  </c:if>
</c:if>
<c:set target="${usdDp}" property="${rvs.astg.prDp.toString()}" value="${rvs.astg.prDp.toString()}"/>
<c:set target="${usdDp}" property="${rvs.astg.quDp.toString()}" value="${rvs.astg.quDp.toString()}"/>
<c:set var="numJsAfl" value="jQuery('#${ent.getClass().simpleName}tot').on('change', function(){${calcPriceFnNm}(this,'${ent.getClass().simpleName}','pri',${rvs.astg.prDp},${rvs.astg.rdMd.ordinal()}${taxParam});});"/>
<c:set var="numJsAfl" value="${numJsAfl}jQuery('.changingTot').on('change', function(){${calcTotalFnNm}(this,'${ent.getClass().simpleName}','pri',${rvs.astg.prDp},${rvs.astg.rdMd.ordinal()}${taxParam});});"/>
<c:if test="${not empty numJsAf}">
  <c:set var="numJsAf" value="${numJsAf}${numJsAfl}" scope="request"/>
</c:if>
<c:if test="${empty numJsAf}">
  <c:set var="numJsAf" value="${numJsAfl}" scope="request"/>
</c:if>
