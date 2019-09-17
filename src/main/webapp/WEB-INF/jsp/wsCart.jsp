<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${isUnSign}">
<!-- Buyer sign-in/up -->
  <div class="modal fade" id="signMdl" tabindex="-1" role="dialog" aria-labelledby="signMdlLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="signMdlLabel"><span class="oi oi-account-login" aria-hidden="true"></span>
            <c:if test="${empty rvs.buyr.pwd}">
              ${i18n.getMsg("signUp", rvs.upf.lng.iid)}/${i18n.getMsg("signIn", rvs.upf.lng.iid)}
            </c:if>
            <c:if test="${not empty rvs.buyr.pwd}">
              ${i18n.getMsg("signIn", rvs.upf.lng.iid)}
            </c:if>
          </h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="modal-body">
          <form action="${urlPrf}?" method="POST">
            <input type="hidden" name="prcRed" value="${prcRed}">
            <input type="hidden" name="prc" value="PrLog">
            <c:forEach var="enr" items="${fltUrlFrm.entrySet()}">
              <c:if test="${enr.key ne 'fltCtVal'}">
                <c:if test="${!(enr.key.startsWith('fltSp') && enr.value.indexOf(';') != -1)}">
                  <input type="hidden" name="${enr.key}" value="${enr.value}">
                </c:if>
                <c:if test="${enr.key.startsWith('fltSp') && enr.value.indexOf(';') != -1}">
                  <c:forEach var="cv" items="${enr.value.split(';')}">
                    <input type="hidden" name="${enr.key}" value="${cv}">
                  </c:forEach>
                </c:if>
              </c:if>
              <c:if test="${enr.key eq 'fltCtVal'}">
                <c:forEach var="cv" items="${enr.value.split(';')}">
                  <input type="hidden" name="fltCtVal" value="${cv}">
                </c:forEach>
              </c:if>
            </c:forEach>
            <c:if test="${not empty rvs.buyr.pwd}">
              <div class="row">
                <div class="col-12 col-md-4 mb-3">
                  ${i18n.getMsg("nme", rvs.upf.lng.iid)}
                </div>
                <div class="col-12 col-md-8 mb-3">
                  ${rvs.buyr.nme}
                </div>
              </div>
            </c:if>
            <c:if test="${empty rvs.buyr.pwd}">
              <div class="row">
                <div class="col-12 col-md-4 mb-3">
                  <label>${i18n.getMsg("nme", rvs.upf.lng.iid)}</label>
                </div>
                <div class="col-12 col-md-8 mb-3">
                  <input required name="nme" class="form-control" value="${rvs.buyr.nme}">
                </div>
              </div>
              <div class="row">
                <div class="col-12 col-md-4 mb-3">
                  <label>${i18n.getMsg("eml", rvs.upf.lng.iid)}</label>
                </div>
                <div class="col-12 col-md-8 mb-3">
                  <input required type="email" name="eml" class="form-control" value="${rvs.buyr.eml}">
                </div>
              </div>
            </c:if>
            <div class="row">
              <div class="col-12 col-md-4 mb-3">
                <label>${i18n.getMsg("pwd", rvs.upf.lng.iid)}</label>
              </div>
              <div class="col-12 col-md-8 mb-3">
                <input type="password" required name="pwd" class="form-control">
              </div>
            </div>
            <c:if test="${empty rvs.buyr.pwd}">
              <div class="row">
                <div class="col-12 col-md-4 mb-3">
                  <label>${i18n.getMsg("pwdc", rvs.upf.lng.iid)}</label>
                </div>
                <div class="col-12 col-md-8 mb-3">
                  <input type="password" required name="pwdc" class="form-control">
                </div>
              </div>
            </c:if>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary">
                <c:if test="${empty rvs.buyr.pwd}">
                  ${i18n.getMsg("signUp", rvs.upf.lng.iid)}
                </c:if>
                <c:if test="${not empty rvs.buyr.pwd}">
                  ${i18n.getMsg("signIn", rvs.upf.lng.iid)}
                </c:if>
              </button>
              <button type="button" class="btn btn-default" data-dismiss="modal">${i18n.getMsg("Close", rvs.upf.lng.iid)}</button>
            </div>
          </form>
        </div>
        <c:if test="${empty rvs.buyr.pwd}">
          <div class="modal-body">
            <form action="${urlPrf}?" method="POST">
              <input type="hidden" name="prcRed" value="${prcRed}">
              <input type="hidden" name="prc" value="PrLog">
              <c:forEach var="enr" items="${fltUrlFrm.entrySet()}">
                <c:if test="${enr.key ne 'fltCtVal'}">
                  <c:if test="${!(enr.key.startsWith('fltSp') && enr.value.indexOf(';') != -1)}">
                    <input type="hidden" name="${enr.key}" value="${enr.value}">
                  </c:if>
                  <c:if test="${enr.key.startsWith('fltSp') && enr.value.indexOf(';') != -1}">
                    <c:forEach var="cv" items="${enr.value.split(';')}">
                      <input type="hidden" name="${enr.key}" value="${cv}">
                    </c:forEach>
                  </c:if>
                </c:if>
                <c:if test="${enr.key eq 'fltCtVal'}">
                  <c:forEach var="cv" items="${enr.value.split(';')}">
                    <input type="hidden" name="fltCtVal" value="${cv}">
                  </c:forEach>
                </c:if>
              </c:forEach>
              <div class="row">
                <div class="col-12 col-md-4 mb-3">
                  <label>${i18n.getMsg("eml", rvs.upf.lng.iid)}</label>
                </div>
                <div class="col-12 col-md-8 mb-3">
                  <input required type="email" name="eml" class="form-control" value="${rvs.buyr.eml}">
                </div>
              </div>
              <div class="row">
                <div class="col-12 col-md-4 mb-3">
                  <label>${i18n.getMsg("pwd", rvs.upf.lng.iid)}</label>
                </div>
                <div class="col-12 col-md-8 mb-3">
                  <input type="password" required name="pwd" class="form-control">
                </div>
              </div>
              <div class="modal-footer">
                <button type="submit" class="btn btn-primary">${i18n.getMsg("signIn", rvs.upf.lng.iid)}</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">${i18n.getMsg("Close", rvs.upf.lng.iid)}</button>
              </div>
            </form>
          </div>
        </c:if>
      </div>
    </div>
  </div>
</c:if>

<!-- Modal cart item adder -->
<div class="modal fade" id="cartAddMdl" tabindex="-1" role="dialog" aria-labelledby="cartAddMdlLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="cartAddMdlLabel"><span class="oi oi-cart" aria-hidden="true"></span> ${i18n.getMsg("add_item_to_cart", rvs.upf.lng.iid)}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <form action="${urlPrf}?" method="POST">
          <input type="hidden" name="prcRed" value="${prcRed}">
          <input type="hidden" name="prc" value="ItmCart">
          <c:forEach var="enr" items="${fltUrlFrm.entrySet()}">
            <c:if test="${enr.key ne 'fltCtVal'}">
              <c:if test="${!(enr.key.startsWith('fltSp') && enr.value.indexOf(';') != -1)}">
                <input type="hidden" name="${enr.key}" value="${enr.value}">
              </c:if>
              <c:if test="${enr.key.startsWith('fltSp') && enr.value.indexOf(';') != -1}">
                <c:forEach var="cv" items="${enr.value.split(';')}">
                  <input type="hidden" name="${enr.key}" value="${cv}">
                </c:forEach>
              </c:if>
            </c:if>
            <c:if test="${enr.key eq 'fltCtVal'}">
              <c:forEach var="cv" items="${enr.value.split(';')}">
                <input type="hidden" name="fltCtVal" value="${cv}">
              </c:forEach>
            </c:if>
          </c:forEach>
          <div class="row">
            <div class="col-12 col-md-4 mb-3">
              <label>${i18n.getMsg("itm", rvs.upf.lng.iid)}</label>
            </div>
            <div class="col-12 col-md-8 mb-3">
              <textarea id="itNm" readonly class="form-control">
              </textarea>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-md-4 mb-3">
              <label>${i18n.getMsg("pri", rvs.upf.lng.iid)}</label>
            </div>
            <div class="col-12 col-md-8 mb-3">
              <input id="pri" readonly class="form-control">
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-md-4 mb-3">
              <label>${i18n.getMsg("uom", rvs.upf.lng.iid)}</label>
            </div>
            <div class="col-12 col-md-8 mb-3">
              <input id="uomNm" readonly class="form-control">
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-md-3 mb-3">
              <label>${i18n.getMsg("quan", rvs.upf.lng.iid)}</label>
            </div>
            <div class="col-3 col-md-1 mb-3">
              <a href="#" onclick="$('#quan').trigger('decrease').trigger('change');"><span class="oi oi-minus oi-horh" aria-hidden="true"></span></a>
            </div>
            <div class="col-6 col-md-4 mb-3">
              <input id="quan" name="quan" class="form-control">
            </div>
            <div class="col-3 col-md-1 mb-3">
              <a href="#" onclick="$('#quan').trigger('increase').trigger('change');"><span class="oi oi-plus oi-horh" aria-hidden="true"></span></a>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-md-4 mb-3">
              <label>${i18n.getMsg("tot", rvs.upf.lng.iid)} (${rvs.wscurr.sgn})</label>
            </div>
            <div class="col-12 col-md-8 mb-3">
              <input id="tot" readonly class="form-control">
            </div>
          </div>
          <input type="hidden" id="unSt" name="unSt">
          <input type="hidden" id="avQuan" name="avQuan">
          <input type="hidden" id="itTyp" name="itTyp">
          <input type="hidden" id="itId" name="itId">
          <input type="hidden" id="uomId" name="uomId">
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">${i18n.getMsg("Save", rvs.upf.lng.iid)}</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">${i18n.getMsg("Close", rvs.upf.lng.iid)}</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal cart item edit -->
<div class="modal fade" id="cartEditMdl" tabindex="-1" role="dialog" aria-labelledby="cartEditMdlLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="cartEditMdlLabel"><span class="oi oi-cart" aria-hidden="true"></span> ${i18n.getMsg("item_change_quantity", rvs.upf.lng.iid)}</h5>
        <button type="button" class="close" data-dismiss="modal" onclick="$('#cartMdl').modal('show');" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <form action="${urlPrf}?" method="POST">
          <input type="hidden" name="prcRed" value="${prcRed}">
          <input type="hidden" name="prc" value="ItmCart">
          <c:forEach var="enr" items="${fltUrlFrm.entrySet()}">
            <c:if test="${enr.key ne 'fltCtVal'}">
              <c:if test="${!(enr.key.startsWith('fltSp') && enr.value.indexOf(';') != -1)}">
                <input type="hidden" name="${enr.key}" value="${enr.value}">
              </c:if>
              <c:if test="${enr.key.startsWith('fltSp') && enr.value.indexOf(';') != -1}">
                <c:forEach var="cv" items="${enr.value.split(';')}">
                  <input type="hidden" name="${enr.key}" value="${cv}">
                </c:forEach>
              </c:if>
            </c:if>
            <c:if test="${enr.key eq 'fltCtVal'}">
              <c:forEach var="cv" items="${enr.value.split(';')}">
                <input type="hidden" name="fltCtVal" value="${cv}">
              </c:forEach>
            </c:if>
          </c:forEach>
          <div class="row">
            <div class="col-12 col-md-4 mb-3">
              <label>${i18n.getMsg("itm", rvs.upf.lng.iid)}</label>
            </div>
            <div class="col-12 col-md-8 mb-3">
              <textarea id="itNmEdit" readonly class="form-control">
              </textarea>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-md-4 mb-3">
              <label>${i18n.getMsg("pri", rvs.upf.lng.iid)}</label>
            </div>
            <div class="col-12 col-md-8 mb-3">
              <input id="priEdit" readonly class="form-control">
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-md-4 mb-3">
              <label>${i18n.getMsg("uom", rvs.upf.lng.iid)}</label>
            </div>
            <div class="col-12 col-md-8 mb-3">
              <input id="uomNmEdit" readonly class="form-control">
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-md-3 mb-3">
              <label>${i18n.getMsg("quan", rvs.upf.lng.iid)}</label>
            </div>
            <div class="col-3 col-md-1 mb-3">
              <a href="#" onclick="$('#quanEdit').trigger('decrease').trigger('change');"><span class="oi oi-minus oi-horh" aria-hidden="true"></span></a>
            </div>
            <div class="col-6 col-md-4 mb-3">
              <input id="quanEdit" name="quan" class="form-control">
            </div>
            <div class="col-3 col-md-1 mb-3">
              <a href="#" onclick="$('#quanEdit').trigger('increase').trigger('change');"><span class="oi oi-plus oi-horh" aria-hidden="true"></span></a>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-md-4 mb-3">
              <label>${i18n.getMsg("tot", rvs.upf.lng.iid)} (${rvs.wscurr.sgn})</label>
            </div>
            <div class="col-12 col-md-8 mb-3">
              <input id="totEdit" readonly class="form-control">
            </div>
          </div>
          <input type="hidden" id="unStEdit" name="unSt">
          <input type="hidden" id="avQuanEdit" name="avQuan">
          <input type="hidden" id="itTypEdit" name="itTyp">
          <input type="hidden" id="itIdEdit" name="itId">
          <input type="hidden" id="lnIdEdit" name="lnId">
          <input type="hidden" id="uomIdEdit" name="uomId">
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">${i18n.getMsg("Save", rvs.upf.lng.iid)}</button>
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="$('#cartMdl').modal('show');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal cart item remove -->
<div class="modal fade" id="cartDelMdl" tabindex="-1" role="dialog" aria-labelledby="cartDelMdlLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="cartDelMdlLabel"><span class="oi oi-cart" aria-hidden="true"></span> ${i18n.getMsg("item_remove", rvs.upf.lng.iid)}</h5>
        <button type="button" class="close" data-dismiss="modal" onclick="$('#cartMdl').modal('show');" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <form action="${urlPrf}?" method="POST">
          <input type="hidden" name="prcRed" value="${prcRed}">
          <input type="hidden" name="act" value="del">
          <input type="hidden" name="prc" value="ItmCart">
          <c:forEach var="enr" items="${fltUrlFrm.entrySet()}">
            <c:if test="${enr.key ne 'fltCtVal'}">
              <c:if test="${!(enr.key.startsWith('fltSp') && enr.value.indexOf(';') != -1)}">
                <input type="hidden" name="${enr.key}" value="${enr.value}">
              </c:if>
              <c:if test="${enr.key.startsWith('fltSp') && enr.value.indexOf(';') != -1}">
                <c:forEach var="cv" items="${enr.value.split(';')}">
                  <input type="hidden" name="${enr.key}" value="${cv}">
                </c:forEach>
              </c:if>
            </c:if>
            <c:if test="${enr.key eq 'fltCtVal'}">
              <c:forEach var="cv" items="${enr.value.split(';')}">
                <input type="hidden" name="fltCtVal" value="${cv}">
              </c:forEach>
            </c:if>
          </c:forEach>
          <div class="form-group">
            <label>${i18n.getMsg("itm", rvs.upf.lng.iid)}:</label>
            <textarea id="itNmDel" readonly class="form-control">
            </textarea>
            <label>Price:</label>
            <input id="priDel" readonly class="form-control">
            <label>${i18n.getMsg("quan", rvs.upf.lng.iid)}:</label>
            <input readonly id="quanDel" class="form-control">
            <label>${i18n.getMsg("tot", rvs.upf.lng.iid)}:</label>
            <input id="totDel" readonly class="form-control">
            <input type="hidden" id="lnIdDel" name="lnId">
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">${i18n.getMsg("Delete", rvs.upf.lng.iid)}</button>
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="$('#cartMdl').modal('show');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- Modal cart -->
<div class="modal fade" id="cartMdl" tabindex="-1" role="dialog" aria-labelledby="cartMdlLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="cartMdlLabel"><span class="oi oi-cart" aria-hidden="true"></span> ${i18n.getMsg("Cart", rvs.upf.lng.iid)}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <c:forEach var="cartLn" items="${rvs.cart.items}">
          <c:if test="${!cartLn.disab}">
            <div class="row">
              <div class="col-4">
                <b>${i18n.getMsg("itm", rvs.upf.lng.iid)}:</b>
              </div>
              <div class="col-8">
                <b>${cartLn.nme}</b>
              </div>
            </div>
            <div class="row">
              <div class="col-4">
                ${i18n.getMsg("pri", rvs.upf.lng.iid)}:
              </div>
              <div class="col-8">
                ${numStr.frmt(cartLn.pri.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}
              </div>
            </div>
            <div class="row">
              <c:if test="${cartLn.forc}">
                <div class="col-6">
                  ${i18n.getMsg("quan", rvs.upf.lng.iid)}:
                </div>
                <div class="col-6">
                  ${numStr.frmtNtz(cartLn.quan.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.upf.dgInGr)}
                </div>
              </c:if>
              <c:if test="${!cartLn.forc}">
                <div class="col-4">
                  ${i18n.getMsg("quan", rvs.upf.lng.iid)}:
                </div>
                <div class="col-4">
                  ${numStr.frmtNtz(cartLn.quan.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.upf.dgInGr)}
                </div>
                <div class="col-2">
                  <a href="#" data-dismiss="modal" onclick="bsSetCartItm(${cartLn.itTyp.ordinal()},${cartLn.itId},'${cartLn.nme}',${cartLn.pri},${cartLn.quan},${cartLn.avQuan},${cartLn.iid},${cartLn.uom.iid},'${cartLn.uom.nme}',${cartLn.unSt},${rvs.astg.prDp},${rvs.astg.rndm.ordinal()});"><span class="oi oi-pencil" title="${i18n.getMsg('edit', rvs.upf.lng.iid)}" aria-hidden="true"></span></a>
                </div>
                <div class="col-2">
                  <a href="#" data-dismiss="modal" onclick="$('#cartDelMdl').modal({keyboard: false, backdrop: false}); bsDelCartItm(${cartLn.itTyp.ordinal()},${cartLn.itId},'${cartLn.nme}',${cartLn.pri},${cartLn.quan},${cartLn.iid},${rvs.astg.prDp});"><span class="oi oi-x" title="${i18n.getMsg('delete', rvs.upf.lng.iid)}" aria-hidden="true"></span></a>
                </div>
              </c:if>
            </div>
            <div class="row">
              <div class="col-4">
                ${i18n.getMsg("tot", rvs.upf.lng.iid)}:
              </div>
              <div class="col-8">
                ${numStr.frmt(cartLn.tot.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}
              </div>
            </div>
          </c:if>
        </c:forEach>
        <c:if test="${rvs.cart.toTx.unscaledValue() gt 0}">
          <div class="row">
            <div class="col-6">
              ${i18n.getMsg("toTx", rvs.upf.lng.iid)}:
            </div>
            <div class="col-6">
              <b>${numStr.frmt(rvs.cart.toTx.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)} ${rvs.wscurr.sgn}</b>
            </div>
          </div>
        </c:if>
        <div class="row">
          <div class="col-6">
            ${i18n.getMsg("tot", rvs.upf.lng.iid)}
            <c:if test="${rvs.cart.toTx.unscaledValue() gt 0 && rvs.tstg.txExcl}">(${i18n.getMsg("txExcl", rvs.upf.lng.iid)})</c:if>
            <c:if test="${rvs.cart.toTx.unscaledValue() gt 0 && !rvs.tstg.txExcl}">(${i18n.getMsg("txIncl", rvs.upf.lng.iid)})</c:if>:
          </div>
          <div class="col-6">
            <b>${numStr.frmt(rvs.cart.tot.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)} ${rvs.wscurr.sgn}</b>
          </div>
        </div>
        <c:if test="${rvs.cart.toTx.unscaledValue() gt 0 && rvs.shTxDet}">
          <c:forEach var="cartTxLn" items="${rvs.cart.taxes}">
            <c:if test="${!cartTxLn.disab}">
              <c:if test="${not empty txs}">
                <c:set var="txs" value="${txs} ${cartTxLn.tax.nme}=${cartTxLn.tot}"/>
              </c:if>
              <c:if test="${empty txs}">
                <c:set var="txs" value="${cartTxLn.tax.nme}=${cartTxLn.tot}"/>
              </c:if>
            </c:if>
          </c:forEach>
          <div class="row">
            <div class="col-6">
              ${i18n.getMsg("Taxs", rvs.upf.lng.iid)}
              <c:if test="${not empty rvs.txRules}">
                <c:if test="${rvs.txRules.stIb}">
                  (${i18n.getMsg("stIb", rvs.upf.lng.iid)},
                </c:if>
                <c:if test="${!rvs.txRules.stIb}">
                  (${i18n.getMsg("it_basis", rvs.upf.lng.iid)},
                </c:if>
                <c:if test="${rvs.txRules.stAg}">
                  ${i18n.getMsg("aggrOnly", rvs.upf.lng.iid)},
                </c:if>
                ${i18n.getMsg(rvs.txRules.stRm, rvs.upf.lng.iid)})</c:if>:
            </div>
            <div class="col-6">
              ${txs}
            </div>
          </div>
        </c:if>
      </div>
      <c:if test="${rvs.payMts.size() eq 1}">
        <div class="row">
          <div class="col-6">
            ${i18n.getMsg("paym", rvs.upf.lng.iid)}:
          </div>
          <div class="col-6">
            ${rvs.cart.paym}
          </div>
        </div>
      </c:if>
      <c:if test="${rvs.dlvMts.size() eq 1}">
        <div class="row">
          <div class="col-6">
            ${i18n.getMsg("delv", rvs.upf.lng.iid)}:
          </div>
          <div class="col-6">
            ${rvs.cart.delv}
          </div>
        </div>
      </c:if>
      <c:if test="${rvs.payMts.size() gt 1 || rvs.dlvMts.size() gt 1}">
        <div class="modal-body">
          <form action="${urlPrf}?" method="POST">
            <input type="hidden" name="prcRed" value="${prcRed}">
            <input type="hidden" name="prc" value="PrCart">
            <c:forEach var="enr" items="${fltUrlFrm.entrySet()}">
              <c:if test="${enr.key ne 'fltCtVal'}">
                <c:if test="${!(enr.key.startsWith('fltSp') && enr.value.indexOf(';') != -1)}">
                  <input type="hidden" name="${enr.key}" value="${enr.value}">
                </c:if>
                <c:if test="${enr.key.startsWith('fltSp') && enr.value.indexOf(';') != -1}">
                  <c:forEach var="cv" items="${enr.value.split(';')}">
                    <input type="hidden" name="${enr.key}" value="${cv}">
                  </c:forEach>
                </c:if>
              </c:if>
              <c:if test="${enr.key eq 'fltCtVal'}">
                <c:forEach var="cv" items="${enr.value.split(';')}">
                  <input type="hidden" name="fltCtVal" value="${cv}">
                </c:forEach>
              </c:if>
            </c:forEach>
            <c:if test="${rvs.payMts.size() gt 1}">
              <div class="row">
                <div class="col-12 col-md-6 mb-3">
                  <label>${i18n.getMsg("paym", rvs.upf.lng.iid)}</label>
                </div>
                <div class="col-12 col-md-6 mb-3">
                  <select name="paym"  class="form-control">
                    <c:forEach var="it" items="${rvs.payMts}">
                      <c:set var="itmSel" value=""/>
                      <c:if test="${rvs.cart.paym eq it}">
                        <c:set var="itmSel" value="selected"/>
                      </c:if>
                      <option value="${it.ordinal()}" ${itmSel}>${i18n.getMsg(it, rvs.upf.lng.iid)}</option>
                    </c:forEach>
                  </select>
                </div>
              </div>
            </c:if>
            <c:if test="${rvs.dlvMts.size() gt 1}">
              <div class="row">
                <div class="col-12 col-md-6 mb-3">
                  <label>${i18n.getMsg("Deliv", rvs.upf.lng.iid)}</label>
                </div>
                <div class="col-12 col-md-6 mb-3">
                  <select name="delv"  class="form-control">
                    <c:forEach var="it" items="${rvs.dlvMts}">
                      <c:set var="itmSel" value=""/>
                      <c:if test="${rvs.cart.delv eq it.iid}">
                        <c:set var="itmSel" value="selected"/>
                      </c:if>
                      <option value="${it.iid.ordinal()}" ${itmSel}>
                        <c:if test="${empty it.frcSr}">
                          ${i18n.getMsg(it.iid, rvs.upf.lng.iid)}
                        </c:if>
                        <c:if test="${not empty it.frcSr}">
                          ${it.frcSr.nme}
                        </c:if>
                      </option>
                    </c:forEach>
                  </select>
                </div>
              </div>
            </c:if>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary">${i18n.getMsg("Apply", rvs.upf.lng.iid)}</button>
            </div>
          </form>
        </div>
      </c:if>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">${i18n.getMsg("Close", rvs.upf.lng.iid)}</button>
        <c:if test="${!isUnSign && param.prc ne 'ChkOut'}">
          <a href="${urlPrf}?prc=ChkOut&prcRed=${prcRed}" type="button" class="btn btn-primary">${i18n.getMsg("check_out", rvs.upf.lng.iid)}</a>
        </c:if>
      </div>
    </div>
  </div>
</div>
