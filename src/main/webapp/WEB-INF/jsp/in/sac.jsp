<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr>
  <td>
    <label for="SacntsacApVsb">${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
  </td>
<c:if test="${not empty param.mbl}"></tr><tr></c:if>
  <td>
    <div class="input-line">
      <input class="picked-appearence" id="SacntsacApVsb" disabled="disabled" type="text" value="${ent.saNm}">
      <input id="SacntsacAp" required type="hidden" name="Sacnt.saNm" value="${ent.saNm}">
      <input id="SacntsacId" required type="hidden" name="Sacnt.saId" value="${ent.saId}">
      <button type="button" class="btn" onclick="bsPick('${hlTySac.get(ent.saTy).simpleName}','Sacnt','sac','&mbl=${param.mbl}');">...</button>
      <button type="button" class="btn" onclick="bsClrSelEnt('Sacntsac');">X</button>
    </div>
  </td>
</tr>
