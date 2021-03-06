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
      <button ${auFoc} type="button" class="btn" onclick="bsPick('Acnt','${cls.simpleName}','${fdNm}','&fopusedVl=true&fopblTyVl=0&fopblTyOpr=eq&fopfrcd=used&mbl=${param.mbl}');">...</button>
      <c:set var="auFoc" value="" scope="request"/>
      <button type="button" class="btn" onclick="bsClrSelEnt('${cls.simpleName}${fdNm}');bsClearSac('${cls.simpleName}','saNm');">X</button>
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${cls.simpleName}saNmApVsb">${i18n.getMsg("subacc", rvs.upf.lng.iid)}</label>
  </td>
<c:if test="${not empty param.mbl}"></tr><tr></c:if>
  <td>
    <div class="input-line">
      <input class="picked-appearence" id="${cls.simpleName}saNmApVsb" disabled="disabled" type="text" value="${ent.saNm}">
      <input id="${cls.simpleName}saNmId" type="hidden" name="${cls.simpleName}.saId" value="${ent.saId}">
      <input id="${cls.simpleName}saNmAp" type="hidden" name="${cls.simpleName}.saNm" value="${ent.saNm}">
      <c:set var="dis" value=""/>
      <c:if test="${empty ent[fdNm].saTy}">
        <c:set var="dis" value="disabled"/>
      </c:if>
      <button id="${cls.simpleName}${fdNm}SaPi" ${dis} type="button" class="btn" onclick="bsPickSac('${fdNm}','${cls.simpleName}','saNm','&mbl=${param.mbl}');">...</button>
      <button id="${cls.simpleName}${fdNm}SaCl" ${dis} type="button" class="btn" onclick="bsClearSac('${cls.simpleName}','saNm');">X</button>
    </div>
  </td>
</tr>
