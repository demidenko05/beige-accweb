<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr>
  <td>
    <label for="${cls.simpleName}.${fdNm}">${srvI18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <select name="${cls.simpleName}.${fdNm}" onchange="bsInpChn(this);">
        <c:set var="sel1" value=""/>
        <c:if test="${entity[fdNm] == 1}"> <c:set var="sel1" value="selected"/> </c:if>
        <option value="1" ${sel1}>1</option>
        <c:set var="sel1" value=""/>
        <c:if test="${entity[fdNm] == 2}"> <c:set var="sel2" value="selected"/> </c:if>
        <option value="2" ${sel2}>2</option>
      </select>
    </div>
  </td>
</tr>
