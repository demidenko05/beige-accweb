<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr>
  <td>
    <label for="${cls.simpleName}.lng2">${i18n.getMsg("choTy", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input class="picked-appearence" id="${cls.simpleName}chSpTyApVsb" disabled="disabled" type="text" value="${ent.str2}" onchange="bsInpChn(this);">
      <input id="${cls.simpleName}chSpTyId" type="hidden" name="${cls.simpleName}.lng2" value="${ent.lng2}">
      <input id="${cls.simpleName}chSpTyAp" type="hidden" name="${cls.simpleName}.str2" value="${ent.str2}">
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${cls.simpleName}.lng2">${i18n.getMsg("val", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input class="picked-appearence" id="${cls.simpleName}chSpApVsb" disabled="disabled" type="text" value="${ent.str1}" onchange="bsInpChn(this);">
      <input id="${cls.simpleName}chSpId" required type="hidden" name="${cls.simpleName}.lng1" value="${ent.lng1}">
      <input id="${cls.simpleName}chSpAp" type="hidden" name="${cls.simpleName}.str1" value="${ent.str1}">
      <c:set var="filterType" value="&fopchoTyOpr=eq&fopchoTyVlId=${ent.lng2}&fopchoTyVlAp=${ent.str2}&fopfrcd=choTy"/>
      <button type="button" class="btn" onclick="bsPick('ChoSp','${cls.simpleName}', 'chSp','&flyPi=spCho${filterType}');">...</button>
      <button type="button" class="btn" onclick="bsClrSelEnt('${cls.simpleName}chSp');">X</button>
    </div>
  </td>
</tr>
