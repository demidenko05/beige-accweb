<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tr>
  <td>
    <label for="${cls.simpleName}.pri">${i18n.getMsg("pri", rvs.upf.lng.iid)}</label>
  </td>
<c:if test="${not empty param.mbl}"></tr><tr></c:if>
  <td>
    <div class="input-line">
      <input type="text" class="bsNum${rvs.astg.csDp} changingTot" required id="${cls.simpleName}pri" name="${cls.simpleName}.pri" value="${ent.pri}"/> 
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${cls.simpleName}.quan">${i18n.getMsg("quan", rvs.upf.lng.iid)}</label>
  </td>
<c:if test="${not empty param.mbl}"></tr><tr></c:if>
  <td>
    <div class="input-line">
      <input type="text" class="bsNum${rvs.astg.quDp} changingTot" required id="${cls.simpleName}quan" name="${cls.simpleName}.quan" value="${ent.quan}"/> 
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${cls.simpleName}.tot">${i18n.getMsg("tot", rvs.upf.lng.iid)}</label>
  </td>
<c:if test="${not empty param.mbl}"></tr><tr></c:if>
  <td>
    <div class="input-line">
      <input type="text" class="bsNum${rvs.astg.prDp}" id="${cls.simpleName}tot" name="${cls.simpleName}.tot" value="${ent.tot}"/> 
    </div>
  </td>
</tr>
<c:set target="${usdDp}" property="${rvs.astg.csDp.toString()}" value="${rvs.astg.csDp.toString()}"/>
<c:set target="${usdDp}" property="${rvs.astg.quDp.toString()}" value="${rvs.astg.quDp.toString()}"/>
<c:set var="numJsAfl" value="jQuery('#${cls.simpleName}tot').on('change', function(){bsClcPri(this,'${cls.simpleName}','pri',${rvs.astg.csDp},${rvs.astg.rndm.ordinal()});});"/>
<c:set var="numJsAfl" value="${numJsAfl}jQuery('.changingTot').on('change', function(){bsClcTot(this,'${cls.simpleName}','pri',${rvs.astg.csDp},${rvs.astg.rndm.ordinal()});});"/>
<c:if test="${not empty numJsAf}">
  <c:set var="numJsAf" value="${numJsAf}${numJsAfl}" scope="request"/>
</c:if>
<c:if test="${empty numJsAf}">
  <c:set var="numJsAf" value="${numJsAfl}" scope="request"/>
</c:if>
