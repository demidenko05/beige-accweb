<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="frcd" value="${prfFlOr}frcd"/>
<c:set var="parOpr" value="${prfFlOr}${fdNm}Opr"/>
<c:set var="parVlId" value="${prfFlOr}${fdNm}VlId"/>
<c:set var="parVlAp" value="${prfFlOr}${fdNm}VlAp"/>
<div class="input-line">
  <c:if test="${rvs.uvs.fltMp[frcd].contains(fdNm)}">
    <b>${i18n.getMsg("forced", rvs.upf.lng.iid)}</b>
    ${i18n.getMsg(fdNm, rvs.upf.lng.iid)}
    ${i18n.getMsg(rvs.uvs.fltMp[parOpr], rvs.upf.lng.iid)}
    ${rvs.uvs.fltMp[parVlAp]}
    <input type="hidden" name="${parVlAp}" value="${rvs.uvs.fltMp[parVlAp]}">
    <input type="hidden" name="${parOpr}" value="${rvs.uvs.fltMp[parOpr]}">
    <input type="hidden" name="${parVlId}" value="${rvs.uvs.fltMp[parVlId]}">
  </c:if>
  <c:if test="${!rvs.uvs.fltMp[frcd].contains(fdNm)}">
    <c:set var="selDis" value=""/>
    <c:if test="${rvs.uvs.fltMp[parOpr] eq 'disabled' or empty rvs.uvs.fltMp[parOpr]}"> <c:set var="selDis" value="selected"/> </c:if>
    <c:set var="selEq" value=""/>
    <c:if test="${rvs.uvs.fltMp[parOpr] eq 'eq'}"> <c:set var="selEq" value="selected"/> </c:if>
    <c:set var="selEeq" value=""/>
    <c:if test="${rvs.uvs.fltMp[parOpr] eq 'ne'}"> <c:set var="selectedNe" value="selected"/> </c:if>
    <label>${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
    <select id="${parOpr}" name="${parOpr}" onchange="bsInpChn(this);">
      <option value="disabled" ${selDis}>${i18n.getMsg("disabled", rvs.upf.lng.iid)}</option>
      <option value="eq" ${selEq}>=</option>
      <option value="ne" ${selectedNe}>!=</option>
    </select>
    <input id="${parVlAp}Vsb" disabled="disabled" type="text" value="${rvs.uvs.fltMp[parVlAp]}" onchange="bsInpChn(this);">
    <input id="${parVlAp}" name="${parVlAp}" type="hidden" value="${rvs.uvs.fltMp[parVlAp]}">
    <input id="${parVlId}" type="hidden" name="${parVlId}" value="${rvs.uvs.fltMp[parVlId]}">
    <button type="button" class="btn" onclick="bsPick('${hldUvd.fldCls(cls, fdNm).simpleName}','${prfFlOr}','${fdNm}Vl','&mbl=${param.mbl}');">...</button>
    <button type="button" class="btn" onclick="bsClrSelEnt('${prfFlOr}${fdNm}Vl');">X</button>
  </c:if>
</div>
