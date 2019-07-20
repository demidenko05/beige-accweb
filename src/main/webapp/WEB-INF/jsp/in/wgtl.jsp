<%@ page rvs.upf.lng.iiduage="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr>
  <td>
    <label>${i18n.getMsg("grWg", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input disabled value="${ent.ownr.tot}"/> 
    </div>
  </td>
</tr>
<tr>
  <td>
    <label>${i18n.getMsg("alw", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input type="text" class="bsNum${rvs.astg.prDp} mkTax" required id="${ent.getClass().simpleName}alw" name="${ent.getClass().simpleName}.alw" value="${ent.alw}"/> 
    </div>
  </td>
</tr>
<tr>
  <td>
    <label>${i18n.getMsg("plAm", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input type="text" class="bsNum${rvs.astg.prDp} mkTax" required id="${ent.getClass().simpleName}plAm" name="${ent.getClass().simpleName}.plAm" value="${ent.plAm}"/> 
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${ent.getClass().simpleName}.rate">${i18n.getMsg("rate", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input type="text" class="bsNum${rvs.astg.txDp} mkTax" required id="${ent.getClass().simpleName}rate" name="${ent.getClass().simpleName}.rate" value="${ent.rate}"/> 
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${ent.getClass().simpleName}.tot">${i18n.getMsg("tot", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input type="text" class="bsNum${rvs.astg.prDp}" id="${ent.getClass().simpleName}tot" name="${ent.getClass().simpleName}.tot" value="${ent.tot}"/> 
    </div>
  </td>
</tr>
<c:set target="${usdDp}" property="${rvs.astg.prDp.toString()}" value="${rvs.astg.prDp.toString()}"/>
<c:set target="${usdDp}" property="${rvs.astg.txDp.toString()}" value="${rvs.astg.txDp.toString()}"/>
<c:set var="numJsAfl" value="jQuery('.mkTax').on('change', function(){bsMkWgToTx(this,'${ent.getClass().simpleName}',${ent.ownr.tot},${rvs.astg.prDp},${rvs.astg.rndm.ordinal()});});"/>
<c:if test="${not empty numJsAf}">
  <c:set var="numJsAf" value="${numJsAf}${numJsAfl}" scope="request"/>
</c:if>
<c:if test="${empty numJsAf}">
  <c:set var="numJsAf" value="${numJsAfl}" scope="request"/>
</c:if>
