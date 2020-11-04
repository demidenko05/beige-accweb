<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="invNm" value="${cls.simpleName.toUpperCase()}"/>
<c:set var="frcd" value="${prfFlOr}frcd"/>
<c:set var="parVal" value="${prfFlOr}${fdNm}Vl"/>
<c:set var="parValue" value="${rvs.uvs.fltMp[parVal]}"/>
<c:set var="selDis1" value="selected"/>
<c:set var="flApGteq30" value="&gt;= 30%"/>
<c:set var="valGteq30" value="${invNm}.TOT gt 0 and TOPA/${invNm}.TOT gte 0.30"/>
<c:if test="${parValue eq valGteq30}">
  <c:set var="selectedGteq30" value="selected"/>
  <c:set var="selDis1" value=""/>
  <c:set var="flAp" value="${flApGteq30}"/>
</c:if>
<c:set var="flApGteq50" value="&gt;= 50%"/>
<c:set var="valGteq50" value="${invNm}.TOT gt 0 and TOPA/${invNm}.TOT gte 0.50"/>
<c:if test="${parValue eq valGteq50}">
  <c:set var="selectedGteq50" value="selected"/>
  <c:set var="selDis1" value=""/>
  <c:set var="flAp" value="${flApGteq50}"/>
</c:if>
<c:set var="flApGteq100" value="&gt;= 100%"/>
<c:set var="valGteq100" value="${invNm}.TOT gt 0 and TOPA/${invNm}.TOT gte 1"/>
<c:if test="${parValue eq valGteq100}">
  <c:set var="selectedGteq100" value="selected"/>
  <c:set var="selDis1" value=""/>
  <c:set var="flAp" value="${flApGteq100}"/>
</c:if>
<c:set var="flApLt30" value="&lt; 30%"/>
<c:set var="valLt30" value="${invNm}.TOT gt 0 and TOPA/${invNm}.TOT lt 0.30"/>
<c:if test="${parValue eq valLt30}">
  <c:set var="selectedLt30" value="selected"/>
  <c:set var="selDis1" value=""/>
  <c:set var="flAp" value="${flApLt30}"/>
</c:if>
<c:set var="flApLt50" value="&lt; 50%"/>
<c:set var="valLt50" value="${invNm}.TOT gt 0 and TOPA/${invNm}.TOT lt 0.50"/>
<c:if test="${parValue eq valLt50}">
  <c:set var="selectedLt50" value="selected"/>
  <c:set var="selDis1" value=""/>
  <c:set var="flAp" value="${flApLt50}"/>
</c:if>
<c:set var="flApLt100" value="&lt; 100%"/>
<c:set var="valLtTotal" value="TOPA lt ${invNm}.TOT"/>
<c:set var="valLt100" value="${invNm}.TOT gt 0 and TOPA/${invNm}.TOT lt 1"/>
<c:if test="${parValue eq valLt100 || parValue eq valLtTotal}">
  <c:set var="selectedLt100" value="selected"/>
  <c:set var="selDis1" value=""/>
  <c:set var="flAp" value="${flApLt100}"/>
</c:if>
<div class="input-line">
    <label>${i18n.getMsg('Curr', rvs.upf.lng.iid)}</label>
    <select onchange="bsMkFltPaTo(this,'${parVal}');bsInpChn(this);">
      <option value="TOT" selected>${i18n.getMsg("forNationalCurrency", rvs.upf.lng.iid)}</option>
      <option value="TOFC">${i18n.getMsg("forForeignCurrency", rvs.upf.lng.iid)}</option>
    </select>
    <label for="">${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
    <select id="${parVal}" name="${parVal}" onchange="bsInpChn(this);">
      <option value="disabled" ${selDis1}>${i18n.getMsg("disabled", rvs.upf.lng.iid)}</option>
      <option value="${valGteq30}" ${selectedGteq30}>${flApGteq30}</option>
      <option value="${valGteq50}" ${selectedGteq50}>${flApGteq50}</option>
      <option value="${valGteq100}" ${selectedGteq100}>${flApGteq100}</option>
      <option value="${valLt30}" ${selectedLt30}>${flApLt30}</option>
      <option value="${valLt50}" ${selectedLt50}>${flApLt50}</option>
      <option value="${valLt100}" ${selectedLt100}>${flApLt100}</option>
    </select>
</div>
