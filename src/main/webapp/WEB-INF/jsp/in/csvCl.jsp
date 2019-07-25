<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr>
  <td>
    <label for="${cls.simpleName}${fdNm}ApVsb">${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
  </td>
<c:if test="${not empty param.mbl}"></tr><tr></c:if>
  <td>
    <div class="input-line">
      <input class="picked-appearence" id="${cls.simpleName}${fdNm}ApVsb" disabled="disabled" type="text" value="${ent[fdNm].nme}">
      <input id="${cls.simpleName}${fdNm}Id" required type="hidden" name="${cls.simpleName}.${fdNm}" value="${ent[fdNm].iid}">
      <button type="button" class="btn" onclick="bsPick('${hldUvd.fldCls(cls,fdNm).simpleName}','${cls.simpleName}','${fdNm}','&fopownrOpr=eq&fopownrVlId=' + document.getElementsByName('${cls.simpleName}.mth')[0].value + '&fopfrcd=ownr&mbl=${param.mbl}');">...</button>
      <button type="button" class="btn" onclick="bsClrSelEnt('${cls.simpleName}${fdNm}');">X</button>
    </div>
  </td>
</tr>
