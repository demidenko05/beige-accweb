<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="now" class="java.util.Date" />
<dialog id="frmRepDlg" class="dlg" oncancel="return false;">
  <div class="form-std">
    <div class="dialog-title">
      ${i18n.getMsg("trial_balance", rvs.upf.lng.iid)}
      <button onclick="bsClsDlgCf('frmRep')" class="btn-close">x</button>
    </div>
    <form id="frmRepFrm" action="ntr" method="GET" target="_blank">
      <input type="hidden" name="prc" value="PrcBln">
      <input type="hidden" name="rnd" value="bln">

      <table class="tbl-fieldset">
        <tr>
          <td>
            <label for="dt">${i18n.getMsg("dat", rvs.upf.lng.iid)}:</label>
          </td>
        </tr>
        <tr>
          <td>
            <input type="datetime-local" required name="dt" value="${srvDt.to8601DateTime(now)}" onchange="bsInpChn(this);"/> 
          </td>
        </tr>
        <tr>
    <td>
      <div class="input-line">
        <select name="actAdd" onchange="bsInpChn(this);">
          <option value="" selected>-</option>
          <option value="recalc">${i18n.getMsg("recalculate__balances", rvs.upf.lng.iid)}</option>
        </select>
      </div>
    </td>
        </tr>
      </table>
      <div class="form-actions">
        <button type="button" onclick="bsSbFrmNw('frmRepFrm', false);">${i18n.getMsg("Report", rvs.upf.lng.iid)}</button>
        <button type="button" onclick="bsClsDlgCf('frmRep');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</a>
      </div>
    </form>
  </div>
</dialog>
