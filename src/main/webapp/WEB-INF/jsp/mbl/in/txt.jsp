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
      <textarea rows="2" ${auFoc} ${reqd} name="${cls.simpleName}.${fdNm}" onchange="bsInpChn(this);">${ent[fdNm]}</textarea>
      <c:set var="auFoc" value="" scope="request"/>
    </div>
  </td>
</tr>
