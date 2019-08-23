<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
  <div class="col-12 col-md-3 mb-3">
    <label>${fltSpf.catSpf.spec.nme}:</label>
  </div>
  <div class="col-12 col-md-3 mb-3">
    <select name="fltSp${fltSpf.catSpf.spec.iid}Op" class="form-control">
      <c:if test="${fltSpf.flt.opr ne 'NOT_IN'}"> <c:set var="selNotIn" value=""/> </c:if>
      <c:if test="${fltSpf.flt.opr eq 'NOT_IN'}"> <c:set var="selNotIn" value="selected"/> </c:if>
      <c:if test="${fltSpf.flt.opr ne 'IN'}"> <c:set var="selIn" value=""/> </c:if>
      <c:if test="${fltSpf.flt.opr eq 'IN'}"> <c:set var="selIn" value="selected"/> </c:if>
      <c:if test="${empty selIn && empty selNotIn}"> <c:set var="selNon" value=""/> </c:if>
      <c:if test="${!(empty selIn && empty selNotIn)}"> <c:set var="selNon" value="selected"/> </c:if>
      <option value="" ${selNon}>-</option>
      <option value="IN" ${selIn}>${i18n.getMsg("IN", rvs.upf.lng.iid)}</option>
      <option value="NOT_IN" ${selNotIn}>${i18n.getMsg("NOT_IN", rvs.upf.lng.iid)}</option>
    </select>
  </div>
  <div class="col-12 col-md-6 mb-3">
    <select multiple name="fltSp${fltSpf.catSpf.spec.iid}Val" class="form-control">
      <c:forEach var="itma" items="${fltSpf.flt.itemsAll}">
        <c:set var="itmSel" value=""/>
        <c:forEach var="itms" items="${fltSpf.flt.items}">
          <c:if test="${itms.iid eq itma.iid}">
            <c:set var="itmSel" value="selected"/>
          </c:if>
        </c:forEach>
        <option value="${itma.iid}" ${itmSel}>${itma.nme}</option>
      </c:forEach>
    </select>
  </div>
</div>
