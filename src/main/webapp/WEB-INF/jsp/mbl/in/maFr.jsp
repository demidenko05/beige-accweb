<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty ent.clsNm}">
  <c:set var="emptsel" value=""/>
</c:if>
<c:if test="${empty ent.clsNm}">
  <c:set var="emptsel" value="selected"/>
</c:if>
<tr>
  <td>
    <label for="MaFrn.clsNm">${i18n.getMsg("clsNm", rvs.upf.lng.iid)}</label>
  </td>
<tr>
</tr>
  <td>
    <div class="input-line">
      <select required name="MaFrn.clsNm" onchange="bsInpChn(this);">
        <option value=""${emptsel}>-</option>
        <c:if test="${ent.clsNm ne 'Itm'}">
          <c:set var="sel" value=""/>
        </c:if>
        <c:if test="${ent.clsNm eq 'Itm'}">
          <c:set var="sel" value="selected"/>
        </c:if>
        <option value="Itm"${sel}>${i18n.getMsg('Itm', rvs.upf.lng.iid)}</option>
        <c:if test="${ent.clsNm ne 'ItmCt'}">
          <c:set var="sel" value=""/>
        </c:if>
        <c:if test="${ent.clsNm eq 'ItmCt'}">
          <c:set var="sel" value="selected"/>
        </c:if>
        <option value="ItmCt"${sel}>${i18n.getMsg('ItmCt', rvs.upf.lng.iid)}</option>
        <c:if test="${ent.clsNm ne 'ItmTc'}">
          <c:set var="sel" value=""/>
        </c:if>
        <c:if test="${ent.clsNm eq 'ItmTc'}">
          <c:set var="sel" value="selected"/>
        </c:if>
        <option value="ItmTc"${sel}>${i18n.getMsg('ItmTc', rvs.upf.lng.iid)}</option>
        <c:if test="${ent.clsNm ne 'Tax'}">
          <c:set var="sel" value=""/>
        </c:if>
        <c:if test="${ent.clsNm eq 'Tax'}">
          <c:set var="sel" value="selected"/>
        </c:if>
        <option value="Tax"${sel}>${i18n.getMsg('Tax', rvs.upf.lng.iid)}</option>
        <c:if test="${ent.clsNm ne 'SrvSl'}">
          <c:set var="sel" value=""/>
        </c:if>
        <c:if test="${ent.clsNm eq 'SrvSl'}">
          <c:set var="sel" value="selected"/>
        </c:if>
        <option value="SrvSl"${sel}>${i18n.getMsg('SrvSl', rvs.upf.lng.iid)}</option>
        <c:if test="${ent.clsNm ne 'SrsCt'}">
          <c:set var="sel" value=""/>
        </c:if>
        <c:if test="${ent.clsNm eq 'SrsCt'}">
          <c:set var="sel" value="selected"/>
        </c:if>
        <option value="SrsCt"${sel}>${i18n.getMsg('SrsCt', rvs.upf.lng.iid)}</option>
        <c:if test="${ent.clsNm ne 'Uom'}">
          <c:set var="sel" value=""/>
        </c:if>
        <c:if test="${ent.clsNm eq 'Uom'}">
          <c:set var="sel" value="selected"/>
        </c:if>
        <option value="Uom"${sel}>${i18n.getMsg('Uom', rvs.upf.lng.iid)}</option>
        <c:if test="${ent.clsNm ne 'Wrh'}">
          <c:set var="sel" value=""/>
        </c:if>
        <c:if test="${ent.clsNm eq 'Wrh'}">
          <c:set var="sel" value="selected"/>
        </c:if>
        <option value="Wrh"${sel}>${i18n.getMsg('Wrh', rvs.upf.lng.iid)}</option>
        <c:if test="${ent.clsNm ne 'WrhSt'}">
          <c:set var="sel" value=""/>
        </c:if>
        <c:if test="${ent.clsNm eq 'WrhSt'}">
          <c:set var="sel" value="selected"/>
        </c:if>
        <option value="WrhSt"${sel}>${i18n.getMsg('WrhSt', rvs.upf.lng.iid)}</option>
      </select>
    </div>
  </td>
</tr>
