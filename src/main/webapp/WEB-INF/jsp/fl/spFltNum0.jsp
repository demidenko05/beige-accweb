<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
  <div class="col-12 col-md-4 mb-3">
    <label>${fltSpf.catSpf.spec.nme}:</label>    
    <c:set var="fltSpVal1" value="fltSp${fltSpf.catSpf.spec.iid}Val1"/>
    <c:set var="fltSpVal2" value="fltSp${fltSpf.catSpf.spec.iid}Val2"/>
    <select name="fltSp${fltSpf.catSpf.spec.iid}Op" onchange="bsFltNumOpChg(this, '${fltSpVal1}', '${fltSpVal2}');" class="form-control">
      <c:if test="${fltSpf.flt.opr ne 'GREATER_THAN_EQUAL'}"> <c:set var="selGreater" value=""/> </c:if>
      <c:if test="${fltSpf.flt.opr eq 'GREATER_THAN_EQUAL'}"> <c:set var="selGreater" value="selected"/> </c:if>
      <c:if test="${fltSpf.flt.opr ne 'LESS_THAN_EQUAL'}"> <c:set var="selLess" value=""/> </c:if>
      <c:if test="${fltSpf.flt.opr eq 'LESS_THAN_EQUAL'}"> <c:set var="selLess" value="selected"/> </c:if>
      <c:if test="${fltSpf.flt.opr ne 'BETWEEN_INCLUDE'}"> <c:set var="selBetween" value=""/> </c:if>
      <c:if test="${fltSpf.flt.opr eq 'BETWEEN_INCLUDE'}"> <c:set var="selBetween" value="selected"/> </c:if>
      <c:if test="${empty selGreater && empty selLess && empty selBetween}"> <c:set var="selNon" value=""/> </c:if>
      <c:if test="${!(empty selGreater && empty selLess && empty selBetween)}"> <c:set var="selNon" value="selected"/> </c:if>
      <option value="" ${selNon}>-</option>
      <option value="GREATER_THAN_EQUAL" ${selGreater}>${i18n.getMsg("GREATER_THAN_EQUAL", rvs.upf.lng.iid)}</option>
      <option value="LESS_THAN_EQUAL" ${selLess}>${i18n.getMsg("LESS_THAN_EQUAL", rvs.upf.lng.iid)}</option>
      <option value="BETWEEN_INCLUDE" ${selBetween}>${i18n.getMsg("BETWEEN_INCLUDE", rvs.upf.lng.iid)}</option>
    </select>
  </div>
  <div class="col-12 col-md-4 mb-3">
    <c:if test="${empty selGreater && empty selLess && empty selBetween}"> <c:set var="disbV1" value="disabled"/> </c:if>
    <c:if test="${!(empty selGreater && empty selLess && empty selBetween)}"> <c:set var="disbV1" value=""/> </c:if>
    <label style="padding-left: 1rem;">${i18n.getMsg("Value1", rvs.upf.lng.iid)}:</label>
    <input id="${fltSpVal1}" name="${fltSpVal1}" type="text" ${inpAdd} ${disbV1} value="${fltSpf.flt.value1}">
  </div>
  <div class="col-12 col-md-4 mb-3">
    <c:if test="${fltSpf.flt.opr ne 'BETWEEN_INCLUDE'}"> <c:set var="disbV2" value="disabled"/> </c:if>
    <c:if test="${fltSpf.flt.opr eq 'BETWEEN_INCLUDE'}"> <c:set var="disbV2" value=""/> </c:if>
    <label style="padding-left: 1rem;">${i18n.getMsg("Value2", rvs.upf.lng.iid)}:</label>
    <input id="${fltSpVal2}" name="${fltSpVal2}" type="text" ${inpAdd} ${disbV2} value="${fltSpf.flt.value2}">
  </div>
</div>
