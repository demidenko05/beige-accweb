<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr>
  <td>
    <label for="${cls.simpleName}.str1">${i18n.getMsg("nme", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input disabled  value="${ent.str1}"/> 
      <input type="hidden" name="${cls.simpleName}.str1" value="${ent.str1}"/>
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${cls.simpleName}.path">${i18n.getMsg("pth", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input disabled  value="${ent.str2}"/> 
      <input type="hidden" name="${cls.simpleName}.str2" value="${ent.str2}"/>
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
