<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr>
  <td>
    <label for="Entr${fdNm}ApVsb">${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input class="picked-appearence" id="Entr${fdNm}ApVsb" disabled="disabled" type="text" value="${ent[fdNm].nme}">
      <input id="Entr${fdNm}Id" type="hidden" name="Entr.${fdNm}" value="${ent[fdNm].iid}">
      <button type="button" class="btn" onclick="bsPick('Acnt','Entr','${fdNm}','&mbl=${param.mbl}');">...</button>
      <button type="button" class="btn" onclick="bsClrSelEnt('Entr${fdNm}');">X</button>
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="Entr${saNm}ApVsb">${i18n.getMsg("subacc", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input class="picked-appearence" id="Entr${saNm}ApVsb" disabled="disabled" type="text" value="${ent[saNm]}">
      <input id="Entr${saNm}Id" type="hidden" name="Entr.${saId}" value="${ent[saId]}">
      <c:set var="dis" value=""/>
      <c:if test="${empty ent[saTy]}">
        <c:set var="dis" value="disabled"/>
      </c:if>
      <button id="Entr${fdNm}SaPi" ${dis} type="button" class="btn" onclick="bsPickSac('${fdNm}','${saNm}','&mbl=${param.mbl}');">...</button>
      <button id="Entr${fdNm}SaCl" ${dis} type="button" class="btn" onclick="bsClearSac('${saNm}');">X</button>
    </div>
  </td>
</tr>
