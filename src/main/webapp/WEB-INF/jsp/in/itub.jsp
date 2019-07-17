<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr>
  <td>
    <label for="${cls.simpleName}${fdNm}ApVsb">${i18n.getMsg(fdNm, rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input class="picked-appearence" id="${cls.simpleName}${fdNm}ApVsb" disabled="disabled" type="text" value="${ent[fdNm].nme}">
      <input id="${cls.simpleName}${fdNm}Id" required type="hidden" name="${cls.simpleName}.${fdNm}" value="${ent[fdNm].iid}">
      <button autofocus type="button" class="btn" onclick="bsPick('Acnt','${cls.simpleName}','${fdNm}','&fopusedVl=true&fopsaTyVl1=1004&fopsaTyOpr1=eq&fopblTyVl=0&fopblTyOpr=eq&foptypVl=4&foptypOpr=eq&fopfrcd=used&mbl=${param.mbl}');">...</button>
      <button type="button" class="btn" onclick="bsClrSelEnt('${cls.simpleName}${fdNm}');bsClearSac('${cls.simpleName}','saNm');">X</button>
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${cls.simpleName}saNmApVsb">${i18n.getMsg("subacc", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input class="picked-appearence" id="${cls.simpleName}saNmApVsb" disabled="disabled" type="text" value="${ent.saNm}">
      <input id="${cls.simpleName}saNmId" required type="hidden" name="${cls.simpleName}.saId" value="${ent.saId}">
      <input id="${cls.simpleName}saNmAp" type="hidden" name="${cls.simpleName}.saNm" value="${ent.saNm}">
      <button id="${cls.simpleName}${fdNm}SaPi" type="button" class="btn" onclick="bsPickSac('${fdNm}','${cls.simpleName}','saNm','&mbl=${param.mbl}');">...</button>
      <button id="${cls.simpleName}${fdNm}SaCl" type="button" class="btn" onclick="bsClearSac('${cls.simpleName}','saNm');">X</button>
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${cls.simpleName}itmApVsb">${i18n.getMsg('itm', rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input class="picked-appearence" id="${cls.simpleName}itmApVsb" disabled="disabled" type="text" value="${ent.itm.nme}">
      <input id="${cls.simpleName}itmId" required type="hidden" name="${cls.simpleName}.itm" value="${ent.itm.iid}">
      <button type="button" ${auFoc} class="btn" onclick="bsPick('${hldUvd.fldCls(cls,'itm').simpleName}','${cls.simpleName}','itm','&flyPi=iuom&mbl=${param.mbl}');">...</button>
      <button type="button" class="btn" onclick="bsClrSelEnt('${cls.simpleName}itm');">X</button>
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${cls.simpleName}uomApVsb">${i18n.getMsg('uom', rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input class="picked-appearence" id="${cls.simpleName}uomApVsb" disabled="disabled" type="text" value="${ent.uom.nme}">
      <input id="${cls.simpleName}uomId" required type="hidden" name="${cls.simpleName}.uom" value="${ent.uom.iid}">
      <button type="button" class="btn" onclick="bsPick('${hldUvd.fldCls(cls,'uom').simpleName}','${cls.simpleName}','uom','&mbl=${param.mbl}');">...</button>
      <button type="button" class="btn" onclick="bsClrSelEnt('${cls.simpleName}uom');">X</button>
    </div>
  </td>
</tr>
<tr>
  <td>
    <label for="${cls.simpleName}.quan">${i18n.getMsg("quan", rvs.upf.lng.iid)}</label>
  </td>
  <td>
    <div class="input-line">
      <input type="text" class="bsNum${rvs.astg.quDp}" required id="${cls.simpleName}quan" name="${cls.simpleName}.quan" value="${ent.quan}"/> 
    </div>
  </td>
</tr>
<c:set target="${usdDp}" property="${rvs.astg.quDp.toString()}" value="${rvs.astg.quDp.toString()}"/>
