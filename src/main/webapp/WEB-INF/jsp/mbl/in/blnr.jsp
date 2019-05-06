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
      <input type="hidden" name="${cls.simpleName}.${fdNm}" value="${ent[fdNm]}">
      <c:if test="${ent[fdNm]}">${i18n.getMsg("Yes", rvs.upf.lng.iid)}></c:if>
      <c:if test="${!ent[fdNm]}">${i18n.getMsg("No", rvs.upf.lng.iid)}</c:if>
    </div>
  </td>
</tr>
