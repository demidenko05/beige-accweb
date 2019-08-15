<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="langRequired" value=""/>
<c:if test="${not empty ent.str1}">
  <c:set var="langRequired" value="required"/>
  <tr>
    <td>
      <label>URL</label>
    </td>
    <td>
      <div class="input-line">
        <input disabled value="${ent.str1}"/> 
        <input type="hidden" name="${cls.simpleName}.str1" value="${ent.str1}"/> 
      </div>
    </td>
  </tr>
  <tr>
    <td>
      <label>${i18n.getMsg("pth", rvs.upf.lng.iid)}</label>
    </td>
    <td>
      <div class="input-line">
        <input disabled value="${ent.str2}"/> 
        <input type="hidden" name="${cls.simpleName}.str2" value="${ent.str2}"/> 
      </div>
    </td>
  </tr>
  <tr>
    <td>
      <label for="fileLang">${i18n.getMsg("Lng", rvs.upf.lng.iid)}</label>
    </td>
    <td>
      <div class="input-line">
        <input required name="fileLang" onchange="bsInpChn(this);"/> 
      </div>
    </td>
  </tr>
</c:if>
<tr>
  <td>
    <label for="${cls.simpleName}.str3">${i18n.getMsg("Lngs", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input ${langRequired} name="${cls.simpleName}.str3" value="${ent.str3}" onchange="bsInpChn(this);"/> 
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${cls.simpleName}.path">${i18n.getMsg("file_to_load", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input required type="file" name="${cls.simpleName}.path" onchange="bsInpChn(this);"/> 
      <input type="hidden" name="paramNameFileToUpload" value="${cls.simpleName}.path">
    </div>
  </td>
</tr>
