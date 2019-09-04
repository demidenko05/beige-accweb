<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<dialog id="frmRepDlg" class="dlg" oncancel="return false;">
  <div class="form-std">
    <div class="dialog-title">
      ${i18n.getMsg("RefreshItemsInList", rvs.upf.lng.iid)}
      <button onclick="bsClsDlgCf('frmRep')" class="btn-close">x</button>
    </div>
    <form id="frmRepFrm" action="ntr" method="GET" target="_blank">
      <input type="hidden" name="prc" value="RefrLst">
      <table class="tbl-fieldset">
        <tr>
          <td>
            <label for="priCt">${i18n.getMsg("priCt", rvs.upf.lng.iid)}</label>
          </td>
          <td>
            <div class="input-line">
              <input class="picked-appearence" id="priCtApVsb" disabled="disabled" type="text" onchange="bsInpChn(this);">
              <input id="priCtId" type="hidden" name="priCt">
              <button type="button" class="btn" onclick="bsPick('PriCt','', 'priCt', '&mbl=${param.mbl}');">...</button>
              <button type="button" class="btn" onclick="bsClrSelEnt('priCt');">X</button>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            <label for="refrAll">${i18n.getMsg("RefreshItemsInListAll", rvs.upf.lng.iid)}</label>
          </td>
          <td>
            <div class="input-line">
              <select name="refrAll" onchange="bsInpChn(this);">
                <option value="true">${i18n.getMsg("Yes", rvs.upf.lng.iid)}</option>
                <option value="false" selected>${i18n.getMsg("No", rvs.upf.lng.iid)}</option>
              </select>
            </div>
          </td>
        </tr>
      </table>
      <div class="form-actions">
        <button type="button" onclick="bsSbFrmNw('frmRepFrm', true);">${i18n.getMsg("RefreshItemsInList", rvs.upf.lng.iid)}</button>
        <button type="button" onclick="bsClsDlgCf('frmRep');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</a>
      </div>
    </form>
  </div>
</dialog>
