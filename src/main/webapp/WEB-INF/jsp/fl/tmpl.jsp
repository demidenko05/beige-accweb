<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="frcd" value="${prfFlOr}frcd"/>
<c:set var="parVl1" value="${prfFlOr}${fdNm}Vl1"/>
<c:set var="parOpr1" value="${prfFlOr}${fdNm}Opr1"/>
<c:set var="parVl2" value="${prfFlOr}${fdNm}Vl2"/>
<c:set var="parOpr2" value="${prfFlOr}${fdNm}Opr2"/>
<div class="input-line">
  <c:if test="${hldUvd.fltMp[frcd].contains(fdNm)}">
    <b>${i18n.getMsg("forced", rvs.upf.lng.iid)}</b>
    <label>${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
    ${i18n.getMsg(hldUvd.fltMp[parOpr1], rvs.upf.lng.iid)}
    <input type="hidden" name="${parOpr1}" value="${hldUvd.fltMp[parOpr1]}">
    ${hldUvd.fltMp[parVl1]}
    <input type="hidden" name="${parVl1}" value="${hldUvd.fltMp[parVl1]}">
    <c:if test="${not empty hldUvd.fltMp[parOpr2]}">
      <label>${i18n.getMsg("and", rvs.upf.lng.iid)}</label>
      ${i18n.getMsg(hldUvd.fltMp[parOpr2], rvs.upf.lng.iid)}
      <input type="hidden" name="${parOpr2}" value="${hldUvd.fltMp[parOpr2]}">
      ${hldUvd.fltMp[parVl2]}
      <input type="hidden" name="${parVl2}" value="${hldUvd.fltMp[parVl2]}">
    </c:if>
  </c:if>
  <c:if test="${!hldUvd.fltMp[frcd].contains(fdNm)}">
    <c:if test="${hldUvd.fltMp[parOpr1] eq 'gt'}"> <c:set var="selGt1" value="selected"/> </c:if>
    <c:if test="${hldUvd.fltMp[parOpr1] eq 'lt'}"> <c:set var="selLt1" value="selected"/> </c:if>
    <c:if test="${hldUvd.fltMp[parOpr1] eq 'eq'}"> <c:set var="selEq1" value="selected"/> </c:if>
    <c:if test="${hldUvd.fltMp[parOpr1] eq 'disabled' or empty hldUvd.fltMp[parOpr1]}"> <c:set var="selDis1" value="selected"/> </c:if>
    <label for="${parOpr1}">${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
    <select name="${parOpr1}" onchange="bsFltOprChd(this, '${prfFlOrFrm}${parVl1}');">
      <option value="disabled" ${selDis1}>${i18n.getMsg("disabled", rvs.upf.lng.iid)}</option>
      <option value="gt" ${selGt1}>&gt;</option>
      <option value="lt" ${selLt1}>&lt;</option>
      <option value="eq" ${selEq1}>=</option>
    </select>
    <c:if test="${empty selEq1 && empty selGt1 && empty selLt1}"> <c:set var="dsbl" value="disabled"/> </c:if>
    <input id="${prfFlOrFrm}${parVl1}"  type="${inpTy}" ${dsbl} required name="${parVl1}" value="${hldUvd.fltMp[parVl1]}" onchange="bsInpChn(this);" ${inpAdd}>

    <c:if test="${hldUvd.fltMp[parOpr2] eq 'gt'}"> <c:set var="selGt2" value="selected"/> </c:if>
    <c:if test="${hldUvd.fltMp[parOpr2] eq 'lt'}"> <c:set var="selLt2" value="selected"/> </c:if>
    <c:if test="${hldUvd.fltMp[parOpr2] eq 'eq'}"> <c:set var="selEq2" value="selected"/> </c:if>
    <c:if test="${hldUvd.fltMp[parOpr2] eq 'disabled' or empty hldUvd.fltMp[parOpr2]}"> <c:set var="selDis2" value="selected"/> </c:if>
    <label for="${parOpr2}">${i18n.getMsg("and", rvs.upf.lng.iid)}</label>
    <select name="${parOpr2}" onchange="bsFltOprChd(this, '${prfFlOrFrm}${parVl2}');">
      <option value="disabled" ${selDis2}>${i18n.getMsg("disabled", rvs.upf.lng.iid)}</option>
      <option value="gt" ${selGt2}>&gt;</option>
      <option value="lt" ${selLt2}>&lt;</option>
      <option value="eq" ${selEq2}>=</option>
    </select>
    <c:if test="${empty selEq2 && empty selGt2 && empty selLt2}"> <c:set var="dsbl" value="disabled"/> </c:if>
    <input id="${prfFlOrFrm}${parVl2}" type="${inpTy}" ${dsbl} required name="${parVl2}" value="${hldUvd.fltMp[parVl2]}" onchange="bsInpChn(this);" ${inpAdd}>
  </c:if>
</div>
