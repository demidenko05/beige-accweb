<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr>
  <td>
    <label>${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
  </td>
<tr>
</tr>
  <td>
    <div class="input-line">
      <c:set var="mdl" value="${ent[fdNm]}" scope="request"/> 
      <jsp:include page="../../st/${hldUvd.stg(cls,fdNm,'str')}.jsp"/>
    </div>
  </td>
</tr>
