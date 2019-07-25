<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr>
  <td>
    <label>${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
  </td>
<c:if test="${not empty param.mbl}"></tr><tr></c:if>
  <td>
    <c:set var="mdl" value="${ent[fdNm]}" scope="request"/> 
    <jsp:include page="../st/${hldUvd.stgNn(cls,fdNm,'str')}.jsp"/>
    <input type="hidden" name="${cls.simpleName}.${fdNm}" value="${hldUvd.toStr(rvs,cls,fdNm,ent[fdNm])}"/> 
  </td>
</tr>
