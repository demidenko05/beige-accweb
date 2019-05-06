<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr>
  <td>
    <label for="${cls.simpleName}.${fdNm}">${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
  </td>
<tr>
</tr>
  <td>
    <div class="input-line">
      <c:set var="reqd" value=""/>
      <c:if test="${hldUvd.lazNulb(cls,fdNm)}">
        <c:set var="reqd" value="required"/>
      </c:if>
      <select ${auFoc} ${reqd} name="${cls.simpleName}.${fdNm}" onchange="bsInpChn(this);">
        <c:set var="selTrue" value=""/>
        <c:if test="${ent[fdNm]}"> <c:set var="selTrue" value="selected"/> </c:if>
        <option value="true" ${selTrue}>${i18n.getMsg("Yes", rvs.upf.lng.iid)}</option>
        <c:set var="selTrue" value=""/>
        <c:if test="${!ent[fdNm]}"> <c:set var="selF" value="selected"/> </c:if>
        <option value="false" ${selF}>${i18n.getMsg("No", rvs.upf.lng.iid)}</option>
      </select>
      <c:set var="auFoc" value="" scope="request"/>
    </div>
  </td>
</tr>
