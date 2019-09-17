<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<dialog id="${frPlNm}EdDlg" class="dlg" oncancel="return false;">
  <div class="form-std">
    <div class="dialog-title">
      ${i18n.getMsg("AdjustBsl",rvs.upf.lng.iid)}
      <button onclick="bsClsDlgCf('${frPlNm}Ed')" class="btn-close">x</button>
    </div>
    <form id="${frPlNm}EdFrm" action="srv" method="POST" enctype="multipart/form-data">
      <input type="hidden" name="act" value="entSv,entEd,lst">
      <input type="hidden" name="ent" value="${cls.simpleName}">
      <input type="hidden" name="pg" value="${param.pg}">
      <c:if test="${not empty param.mbl}">
        <input type="hidden" name="mbl" value="${param.mbl}">
      </c:if>
      <c:forEach items="${param}" var="par">
        <c:if test="${par.key.startsWith('fom') || par.key.startsWith('fly')}">
          <input type="hidden" name="${par.key}" value="${par.value}">
        </c:if>
      </c:forEach>
      <table class="tbl-fieldset">
        <c:set var="fdNm" value="iid" scope="request"/>
        <jsp:include page="../in/ido.jsp"/>
        <c:set var="auFoc" value="autofocus" scope="request"/>
        <c:set var="fdNm" value="amnt" scope="request"/>
        <jsp:include page="../in/reo.jsp"/>
        <c:set var="fdNm" value="dsSt" scope="request"/>
        <jsp:include page="../in/txt.jsp"/>
      </table>
      <c:if test="${not empty rvs.preps}">
        <table class="tbl-fieldset" id="bslPrepMtc">
          <c:if test="${ent.amnt.unscaledValue() gt 0}">
            <c:set var="prepnm" value="${i18n.getMsg('PrepFr', rvs.upf.lng.iid)}"/>
          </c:if>
          <c:if test="${ent.amnt.unscaledValue() lt 0}">
            <c:set var="prepnm" value="${i18n.getMsg('PrepTo', rvs.upf.lng.iid)}"/>
          </c:if>
          <tr>
            <td>
              <label for="dscr">${i18n.getMsg('Preps', rvs.upf.lng.iid)}</label>
            </td>
            <c:if test="${not empty param.mbl}"></tr><tr></c:if>
            <td>
              <div class="input-line">
                <select name="prepId" onchange="bsInpChn(this);bsBslPrMtcChg(this);">
                  <option value="" selected>-</option>
                  <c:forEach items="${rvs.preps}" var="prep">
                    <option value="${prep.iid}">
                      <c:if test="${ent.stas == 'VOIDED' && prep.rvId == null}">
                        ${i18n.getMsg('AddReverse', rvs.upf.lng.iid)}
                      </c:if>
                      <c:if test="${!(ent.stas == 'VOIDED' && prep.rvId == null)}">
                        ${i18n.getMsg('AddMatching', rvs.upf.lng.iid)}
                      </c:if>
                      - ${prepnm}
                      <c:set var="mdl" value="${prep}" scope="request"/>
                      <jsp:include page="../st/doc.jsp"/>
                      ${prep.dscr}
                    </option>
                  </c:forEach>
                </select>
              </div>
            </td>
          </tr>
        </table>
      </c:if>
      <c:if test="${not empty rvs.payms}">
        <table class="tbl-fieldset" id="bslPayMtc">
          <c:if test="${ent.amnt.unscaledValue() gt 0}">
            <c:set var="paynm" value="${i18n.getMsg('PaymFr', rvs.upf.lng.iid)}"/>
          </c:if>
          <c:if test="${ent.amnt.unscaledValue() lt 0}">
            <c:set var="paynm" value="${i18n.getMsg('PaymTo', rvs.upf.lng.iid)}"/>
          </c:if>
          <tr>
            <td>
              <label for="dscr">${i18n.getMsg('Payms', rvs.upf.lng.iid)}</label>
            </td>
            <c:if test="${not empty param.mbl}"></tr><tr></c:if>
            <td>
              <div class="input-line">
                <select name="paymId" onchange="bsInpChn(this);bsBslPayMtchCng(this);">
                  <option value="" selected>-</option>
                  <c:forEach items="${rvs.payms}" var="pay">
                    <option value="${pay.iid}">
                      <c:if test="${ent.stas == 'VOIDED' && pay.rvId == null}">
                        ${i18n.getMsg('AddReverse', rvs.upf.lng.iid)}
                      </c:if>
                      <c:if test="${!(ent.stas == 'VOIDED' && pay.rvId == null)}">
                        ${i18n.getMsg('AddMatching', rvs.upf.lng.iid)}
                      </c:if>
                      - ${paynm}
                      <c:set var="mdl" value="${pay}" scope="request"/>
                      <jsp:include page="../st/doc.jsp"/>
                      ${pay.dscr}
                    </option>
                  </c:forEach>
                </select>
              </div>
            </td>
          </tr>
        </table>
      </c:if>
      <c:if test="${not empty rvs.entrs}">
        <table class="tbl-fieldset" id="bslEnrMtc">
          <tr>
            <td>
              <label for="dscr">${i18n.getMsg('Entrs', rvs.upf.lng.iid)}</label>
            </td>
            <c:if test="${not empty param.mbl}"></tr><tr></c:if>
            <td>
              <div class="input-line">
                <select name="entrId" onchange="bsInpChn(this);bsBslEnrMtcChg(this);">
                  <option value="" selected>-</option>
                  <c:forEach items="${rvs.entrs}" var="entr">
                    <option value="${entr.iid}">
                      <c:if test="${entr.srTy==2008}">
                        ${i18n.getMsg('AlreadyDone', rvs.upf.lng.iid)}
                      </c:if>
                      <c:if test="${entr.srTy!=2008 && ent.stas == 'VOIDED'}">
                        ${i18n.getMsg('AddReverse', rvs.upf.lng.iid)}
                      </c:if>
                      <c:if test="${entr.srTy!=2008 && ent.stas != 'VOIDED'}">
                        ${i18n.getMsg('AddMatching', rvs.upf.lng.iid)}
                      </c:if>
                      - ${i18n.getMsg('Entr', rvs.upf.lng.iid)} # ${entr.dbOr}-
                      <c:if test="${empty idOr}">
                        ${entr.iid}
                      </c:if>
                      <c:if test="${not empty idOr}">
                        ${entr.idOr} (${entr.iid})
                      </c:if>
                      , <fmt:formatDate value="${entr.dat}" type="both" timeStyle="short"/>, ${numStr.frmt(ent.amnt.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}
                      ${entr.dscr}
                    </option>
                  </c:forEach>
                </select>
              </div>
            </td>
          </tr>
        </table>
      </c:if>
      <c:if test="${ent.stas != 'VOIDED'}">
        <table class="tbl-fieldset" id="bslDocTy">
          <tr>
            <td>
              <label for="adjDocType">${i18n.getMsg("AddAdjusting", rvs.upf.lng.iid)}</label>
            </td>
            <c:if test="${not empty param.mbl}"></tr><tr></c:if>
            <td>
              <div class="input-line">
                <select name="adjDocType" onchange="bsInpChn(this);bsBslDcTyChg(this);">
                  <option value="" selected>-</option>
                  <option value="1">${i18n.getMsg("Prep", rvs.upf.lng.iid)}</option>
                  <option value="2">${i18n.getMsg("Paym", rvs.upf.lng.iid)}</option>
                  <option value="3">${i18n.getMsg("Entr", rvs.upf.lng.iid)}</option>
                </select>
              </div>
            </td>
          </tr>
        </table>
        <table class="tbl-fieldset" id="bslPrep" style="display: none;">
          <tr>
            <td>
              <label for="dbcr">${i18n.getMsg('dbcr', rvs.upf.lng.iid)}</label>
            </td>
            <c:if test="${not empty param.mbl}"></tr><tr></c:if>
            <td>
              <div class="input-line">
                <input class="picked-appearence" id="dbcrApVsb" disabled="disabled" type="text">
                <input id="dbcrId" type="hidden" name="dbcr">
                <button type="button" class="btn" onclick="bsPick('DbCr','','dbcr','&mbl=${param.mbl}');">...</button>
                <button type="button" class="btn" onclick="bsClrSelEnt('dbcr');">X</button>
              </div>
            </td>
          </tr>
        </table>
        <table class="tbl-fieldset" id="bslPay" style="display: none;">
          <tr>
            <td>
              <label for="invoice">${i18n.getMsg('Invoice', rvs.upf.lng.iid)}</label>
            </td>
            <c:if test="${not empty param.mbl}"></tr><tr></c:if>
            <td>
              <div class="input-line">
                <input class="picked-appearence" id="invoiceApVsb" disabled="disabled" type="text">
                <input id="invoiceId" type="hidden" name="invoice">
                <c:if test="${ent.amnt.unscaledValue() gt 0}">
                  <c:set var="invoiceType" value="SalInv"/>
                </c:if>
                <c:if test="${ent.amnt.unscaledValue() lt 0}">
                  <c:set var="invoiceType" value="PurInv"/>
                </c:if>
                <button type="button" class="btn" onclick="bsPick('${invoiceType}','','invoice','&fopmdEnrVl=true&foptoPaVl=TOPA lt TOT&foprvIdOpr1=isnull&fopfrcd=mdEnr,toPa,rvId&mbl=${param.mbl}');">...</button>
                <button type="button" class="btn" onclick="bsClrSelEnt('invoice');">X</button>
              </div>
            </td>
          </tr>
        </table>
        <table class="tbl-fieldset" id="bslEnr" style="display: none;">
          <tr>
            <td>
              <label for="corAcc">${i18n.getMsg('coracc', rvs.upf.lng.iid)}</label>
            </td>
            <c:if test="${not empty param.mbl}">
              </tr>
              <tr>
            </c:if>
            <td>
              <div class="input-line">
                <input class="picked-appearence" id="corAccApVsb" disabled="disabled" type="text">
                <input id="corAccId" type="hidden" name="corAcc">
                <button type="button" class="btn" onclick="bsPick('Acnt','','corAcc','&fopusedVl=true&fopfrcd=used&mbl=${param.mbl}');">...</button>
                <button type="button" class="btn" onclick="bsClrSelEnt('corAcc');">X</button>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <label for="subcorAccApVsb">${i18n.getMsg("subacc", rvs.upf.lng.iid)}</label>
            </td>
            <c:if test="${not empty param.mbl}"></tr><tr></c:if>
            <td>
              <div class="input-line">
                <input class="picked-appearence" id="subcorAccApVsb" disabled type="text">
                <input id="subcorAccId" type="hidden" name="subcorAccId">
                <input id="subcorAccAp" type="hidden" name="subcorAcc">
                <button id="corAccSaPi" type="button" class="btn" onclick="bsPickSac('corAcc','','subcorAcc','&mbl=${param.mbl}');">...</button>
                <button id="corAccSaCl" type="button" class="btn" onclick="bsClearSac('','subcorAcc');">X</button>
              </div>
            </td>
          </tr>
        </table>
        <table class="tbl-fieldset" id="bslPrPaEnr" style="display: none;">
          <tr>
            <td>
              <label for="accCash">${i18n.getMsg('accCash', rvs.upf.lng.iid)}</label>
            </td>
            <c:if test="${not empty param.mbl}"></tr><tr></c:if>
            <td>
              <div class="input-line">
                <input class="picked-appearence" id="accCashApVsb" disabled="disabled" type="text" onchange="bsInpChn(this);">
                <input id="accCashId" type="hidden" name="accCash">
                <button type="button" class="btn" onclick="bsPick('Acnt','','accCash','&fopusedVl=true&&fopsaTyVl1=1003&fopsaTyOpr1=eq&fopfrcd=used&mbl=${param.mbl}');">...</button>
                <button type="button" class="btn" onclick="bsClrSelEnt('accCash');">X</button>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <label for="dat">${i18n.getMsg("dat", rvs.upf.lng.iid)}</label>
            </td>
            <c:if test="${not empty param.mbl}"></tr><tr></c:if>
            <td>
              <div class="input-line">
                <input type="datetime-local" name="dat" value="${hldUvd.toStr(rvs,cls,'dat',ent.dat)}" onchange="bsInpChn(this);"/> 
              </div>
            </td>
          </tr>
        </table>
        <table class="tbl-fieldset" id="bslPrPa" style="display: none;">
          <tr>
            <td>
              <label for="toFc">${i18n.getMsg('toFc', rvs.upf.lng.iid)}</label>
            </td>
            <c:if test="${not empty param.mbl}"></tr><tr></c:if>
            <td>
              <div class="input-line">
                <input type="text" name="toFc" value="0.0" onchange="bsInpChn(this);" class="bsNum${rvs.astg.prDp}"/> 
              </div>
            </td>
          </tr>
        </table>
      </c:if>
      <div class="form-actions">
        <input style="display: none" id="${frPlNm}EdFrmFs" type="submit"/>
        <button type="button" onclick="bsSbFrmAjx('${frPlNm}EdFrm', true, 'rnd=esoj');">${i18n.getMsg("Save", rvs.upf.lng.iid)}</button>
        <button type="button" onclick="bsClsDlgCf('${frPlNm}Ed');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</a>
      </div>
    </form>
  </div>
</dialog>
