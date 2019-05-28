<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr>
  <td>
    <label for="Entr${fdNm}ApVsb">${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input class="picked-appearence" id="Entr${fdNm}ApVsb" disabled="disabled" type="text" value="${ent[fdNm].nme}" onchange="bsInpChn(this);">
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
      <input class="picked-appearence" id="Entr${saNm}ApVsb" disabled="disabled" type="text" value="${ent[saNm]}" onchange="bsInpChn(this);">
      <input id="Entr${saNm}Id" type="hidden" name="Entr.${saId}" value="${ent[saId]}">
      <button type="button" class="btn" onclick="var bsAcId=document.getElementById('Entr${fdNm}Id').value; if(bsAcId!='') bsPick('Sacnt','Entr','${saNm}','&fopownrVlId='+bsAcId+'&fopownrOpr=eq&fopfrcd=ownr&mbl=${param.mbl}'); else bsShwErr(BSMSG['choose_account_first']);">...</button>
      <button type="button" class="btn" onclick="document.getElementById('Entr${saNm}ApVsb').value='';document.getElementById('Entr${saNm}Id').value='';">X</button>
    </div>
  </td>
</tr>
