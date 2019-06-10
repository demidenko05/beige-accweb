<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="now" class="java.util.Date" />
<dialog id="frmRepDlg" class="dlg" oncancel="return false;">
  <div class="form-std">
    <div class="dialog-title">
      ${i18n.getMsg("balance_sheet", rvs.upf.lng.iid)}
      <button onclick="bsClsDlgCf('frmRep')" class="btn-close">x</button>
    </div>
    <form id="frmRepFrm" action="pdf" method="GET" target="_blank">
      <input id="prcNm" type="hidden" name="prc" value="PrcBlnSht">
      <input type="hidden" name="rnd" value="blns">

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
      </table>
      <div class="form-actions">
        <button type="button" onclick="this.form.action='pdf';document.getElementById('prcNm').value='PrcBlnSht';bsSbFrmNw('frmRepFrm', false);">${i18n.getMsg("ReportPdf", rvs.upf.lng.iid)}</button>
        <button type="button" onclick="this.form.action='ntr';document.getElementById('prcNm').value='PrBlShTr';bsSbFrmNw('frmRepFrm', false);">${i18n.getMsg("Report", rvs.upf.lng.iid)}</button>
        <button type="button" onclick="bsClsDlgCf('frmRep');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</a>
      </div>
    </form>
  </div>
</dialog>
