<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr>
  <td>
    <label for="${cls.simpleName}${fdNm}ApVsb">${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
  </td>
<tr>
</tr>
  <td>
    <div class="input-line">
      <input class="picked-appearence" id="${cls.simpleName}${fdNm}ApVsb" disabled="disabled" type="text" value="${ent[fdNm].nme}" onchange="bsInpChn(this);">
      <input type="hidden" name="${cls.simpleName}.${fdNm}" value="${ent[fdNm].iid}">
    </div>
  </td>
</tr>
