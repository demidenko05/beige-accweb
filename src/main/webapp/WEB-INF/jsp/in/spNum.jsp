<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty ent.num1}">
  <c:set var="nm1" value="${0}"/>
</c:if>
<c:if test="${not empty ent.num1}">
  <c:set var="nm1" value="${ent.num1}"/>
</c:if>
<c:if test="${empty ent.lng1}">
  <c:set var="decpl" value="2"/>
</c:if>
<c:if test="${not empty ent.lng1}">
  <c:set var="decpl" value="${ent.lng1}"/>
</c:if>
<c:set target="${usdDp}" property="${decpl.toString()}" value="${decpl.toString()}"/>
<tr>
  <td>
    <label for="${cls.simpleName}.num1">${i18n.getMsg("val", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input type="text" class="bsNum${decpl}" required name="${cls.simpleName}.num1" value="${nm1}" onchange="bsInpChn(this);"/> 
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${cls.simpleName}.lng1">${i18n.getMsg("decimalPlaces", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input type="number" min="1" max="4" required name="${cls.simpleName}.lng1" value="${decpl}" onchange="bsInpChn(this);"/> 
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${cls.simpleName}.str2">${i18n.getMsg("Uom", rvs.upf.lng.iid)} ${i18n.getMsg("if_present", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input class="picked-appearence" id="${cls.simpleName}UomApVsb" disabled="disabled" type="text" value="${ent.str1}" onchange="bsInpChn(this);">
      <input id="${cls.simpleName}UomId" type="hidden" name="${cls.simpleName}.lng2" value="${ent.lng2}">
      <input id="${cls.simpleName}UomAp" type="hidden" name="${cls.simpleName}.str1" value="${ent.str1}">
      <button type="button" class="btn" onclick="bsPick('Uom','${cls.simpleName}', 'Uom');">...</button>
      <button type="button" class="btn" onclick="bsClrSelEnt('${cls.simpleName}Uom');">X</button>
    </div>
  </td>
</tr>
