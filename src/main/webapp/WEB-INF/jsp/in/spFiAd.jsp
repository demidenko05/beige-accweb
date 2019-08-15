<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr>
  <td>
    <b>${i18n.getMsg("enterEitherAlreadyOrLoadNew", rvs.upf.lng.iid)}</b>
  </td>
</tr>
<tr>
  <td>
    <label for="${cls.simpleName}.str1">${i18n.getMsg("alreadyLoadedUrl", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input id="${cls.simpleName}.str1" required name="${cls.simpleName}.str1" value="${ent.str1}" onchange="bsFlUpPhChd(this, '${cls.simpleName}.path', '${cls.simpleName}.parFile');"/> 
      <input type="hidden" name="fdFlNm" value="str1">
      <input type="hidden" name="fdFlPth" value="str2">
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${cls.simpleName}.path">${i18n.getMsg("file_to_load", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input id="${cls.simpleName}.path" required type="file" name="${cls.simpleName}.path" onchange="bsFlUpChd(this, '${cls.simpleName}.str1', '${cls.simpleName}.parFile');"/> 
      <input id="${cls.simpleName}.parFile" type="hidden" name="parFile" value="${cls.simpleName}.path">
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${cls.simpleName}.str3">${i18n.getMsg("item_description", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input id="${cls.simpleName}.str3" name="${cls.simpleName}.str3" value="${ent.str3}" onchange="bsInpChn(this);"/> 
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${cls.simpleName}.str4">${i18n.getMsg("group_description", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input id="${cls.simpleName}.str4" name="${cls.simpleName}.str4" value="${ent.str4}" onchange="bsInpChn(this);"/> 
    </div>
  </td>
</tr>
