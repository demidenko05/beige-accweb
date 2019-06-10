<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="now" class="java.util.Date" />
<dialog id="frmRepDlg" class="dlg" oncancel="return false;">
  <div class="form-std">
    <div class="dialog-title">
      ${i18n.getMsg("Ledger", rvs.upf.lng.iid)}
      <button onclick="bsClsDlgCf('frmRep')" class="btn-close">x</button>
    </div>
    <form id="frmRepFrm" action="ntr" method="GET" target="_blank">
      <input type="hidden" name="prc" value="PrLdgr">
      <table class="tbl-fieldset">
        <tr>
          <td>
            <label for="dt1">${i18n.getMsg("dt1", rvs.upf.lng.iid)}:</label>
          </td>
        </tr>
        <tr>
          <td>
            <input autofocus type="datetime-local" required name="dt1" value="${srvDt.to8601DateTime(now)}" onchange="bsInpChn(this);"/> 
          </td>
        </tr>
        <tr>
          <td>
            <label for="dt2">${i18n.getMsg("dt2", rvs.upf.lng.iid)}:</label>
          </td>
        </tr>
        <tr>
          <td>
            <input type="datetime-local" required name="dt2" value="${srvDt.to8601DateTime(now)}" onchange="bsInpChn(this);"/> 
          </td>
        </tr>
        <tr>
          <td>
            <label for="ldgAccApVsb">${i18n.getMsg("Acnt", rvs.upf.lng.iid)}:</label>
          </td>
        <tr>
        </tr>
          <td>
            <div class="input-line">
              <input class="picked-appearence" id="ldgAccApVsb" disabled="disabled" type="text">
              <input id="ldgAccId" required type="hidden" name="accId">
              <input id="ldgAccAp" required type="hidden" name="accNm">
              <button type="button" class="btn" onclick="bsPick('Acnt','ldg','Acc','&mbl=${param.mbl}');">...</button>
              <button type="button" class="btn" onclick="bsClrSelEnt('ldgAcc');bsClearSac('ldg','Sac');">X</button>
            </div>
          </td>
        </tr>
        <tr>
          <td>
            <label for="ldgSacApVsb">${i18n.getMsg("subacc", rvs.upf.lng.iid)}:</label>
          </td>
        <tr>
        </tr>
          <td>
            <div class="input-line">
              <input class="picked-appearence" id="ldgSacApVsb" disabled="disabled" type="text">
              <input id="ldgSacId" type="hidden" name="saId">
              <input id="ldgSacAp" type="hidden" name="saNm">
              <button id="ldgAccSaPi" type="button" class="btn" onclick="bsPickSac('Acc','ldg','Sac','&mbl=${param.mbl}');">...</button>
              <button id="ldgAccSaCl" type="button" class="btn" onclick="bsClearSac('ldg','Sac');">X</button>
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
