<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
