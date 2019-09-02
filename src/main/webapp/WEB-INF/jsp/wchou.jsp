<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${rvs.orders == null && rvs.srvs.orders == null}">
  <jsp:include page="${param.rndRed}.jsp"/>
</c:if>
<c:if test="${rvs.orders != null || rvs.srvs.orders != null}">
  <jsp:include page="wsSta.jsp"/>

  <c:set var="ifPayPal" value="${false}"/>
  <c:set var="ifDeliv" value="${false}"/>
  <div class="card cat-name">
    <div class="card-header">
      <h3>${i18n.getMsg("check_out", rvs.upf.lng.iid)}</h3>
    </div>
    <div class="card-body">
      <c:forEach var="ord" items="${rvs.orders}">
        <h5>${i18n.getMsg("CuOr", rvs.upf.lng.iid)}#${ord.iid}, <fmt:formatDate value="${ord.dat}" type="both" timeStyle="short"/>,
        ${i18n.getMsg("tot", rvs.upf.lng.iid)} ${ord.tot}${ord.curr.stCo}
        <c:if test="${ord.toTx.doubleValue() gt 0 && rvs.tsrg.txExcl}">(${i18n.getMsg("txExcl", rvs.upf.lng.iid)}),</c:if>
        <c:if test="${ord.toTx.doubleValue() gt 0 && !rvs.tsrg.txExcl}">(${i18n.getMsg("txIncl", rvs.upf.lng.iid)}),</c:if>
        ${i18n.getMsg("toTx", rvs.upf.lng.iid)} ${ord.toTx}${ord.curr.nme}:</h5>
        <div class="table-responsive">
          <table class="table table-sm">
            <thead>
              <tr>
                <th>${i18n.getMsg("itm", rvs.upf.lng.iid)}</th>
                <th>${i18n.getMsg("uom", rvs.upf.lng.iid)}</th>
                <th>${i18n.getMsg("pri", rvs.upf.lng.iid)}</th>
                <th>${i18n.getMsg("quan", rvs.upf.lng.iid)}</th>
                <th>${i18n.getMsg("tot", rvs.upf.lng.iid)}</th>
                <c:if test="${ord.toTx.doubleValue() gt 0 && rvs.tsrg.txExcl && !rvs.txRules.stIb}">
                  <th>${i18n.getMsg("toTx", rvs.upf.lng.iid)}</th>
                </c:if>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="il" items="${ord.goods}">
                <tr>
                  <td>${il.dscr}</td>
                  <td>${il.uom.nme}</td>
                  <td>${numStr.frmt(il.pri.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}</td>
                  <td>${numStr.frmt(il.quan.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.quDp,rvs.upf.dgInGr)}</td>
                  <td>${numStr.frmt(il.tot.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}${ord.curr.nme}</td>
                  <c:if test="${ord.toTx.doubleValue() gt 0 && rvs.tsrg.txExcl && !rvs.txRules.stIb}">
                    <td>${numStr.frmt(il.toTx.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}${ord.curr.nme}</td>
                  </c:if>
                </tr>
              </c:forEach>
              <c:forEach var="il" items="${ord.servs}">
                <tr>
                  <td>${il.dscr}</td>
                  <td>${il.uom.nme}</td>
                  <td>${numStr.frmt(il.pri.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}</td>
                  <td>${numStr.frmt(il.quan.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.quDp,rvs.upf.dgInGr)}</td>
                  <td>${numStr.frmt(il.tot.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}${ord.curr.nme}</td>
                  <c:if test="${ord.toTx.doubleValue() gt 0 && rvs.tsrg.txExcl && !rvs.txRules.stIb}">
                    <td>${numStr.frmt(il.toTx.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}${ord.curr.nme}</td>
                  </c:if>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <c:if test="${ord.toTx.doubleValue() gt 0}">
          <h5>${i18n.getMsg("Taxs", rvs.upf.lng.iid)}
          <c:if test="${not empty txRules}">
            <c:if test="${rvs.txRules.stIb}">
              (${i18n.getMsg("stIb", rvs.upf.lng.iid)},
            </c:if>
            <c:if test="${!rvs.txRules.stIb}">
              (${i18n.getMsg("it_basis", rvs.upf.lng.iid)},
            </c:if>
            <c:if test="${rvs.txRules.stAg}">
              ${i18n.getMsg("aggrOnly", rvs.upf.lng.iid)},
            </c:if>
            ${i18n.getMsg(rvs.txRules.stRm, rvs.upf.lng.iid)}):
          </c:if></h5>
          <div class="table-responsive">
            <table class="table table-sm">
              <thead>
                <tr>
                  <th>${i18n.getMsg("tax", rvs.upf.lng.iid)}</th>
                  <th>${i18n.getMsg("tot", rvs.upf.lng.iid)}</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="txLn" items="${ord.taxes}">
                  <tr>
                    <td>${txLn.tax.nme}</td>
                    <td>${txLn.tot}${ord.curr.nme}</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </c:if>
        <h6>${i18n.getMsg("paym", rvs.upf.lng.iid)}: ${i18n.getMsg(ord.paym, rvs.upf.lng.iid)}</h6>
        <h6>${i18n.getMsg("delv", rvs.upf.lng.iid)}: ${i18n.getMsg(ord.delv, rvs.upf.lng.iid)}</h6>
        <c:if test="${not empty ord.pipl}">
          <h6>${i18n.getMsg("pipl", rvs.upf.lng.iid)}: ${ord.pipl.nme}</h6>
        </c:if>
        <c:if test="${ord.delv ne 'PICKUP'}">
          <c:set var="ifDeliv" value="${true}"/>
        </c:if>
        <c:if test="${ord.paym eq 'PAYPAL' || ord.paym eq 'PAYPAL_ANY'}">
          <c:set var="ifPayPal" value="${true}"/>
        </c:if>
      </c:forEach>
      <c:forEach var="ord" items="${rvs.srvs.orders}">
        <h5>${i18n.getMsg("CuOr", rvs.upf.lng.iid)}#${ord.iid}, <fmt:formatDate value="${ord.dat}" type="both" timeStyle="short"/>,
        ${i18n.getMsg("seller", rvs.upf.lng.iid)}: ${ord.sel.seller.nme}, ${i18n.getMsg("tot", rvs.upf.lng.iid)} ${ord.tot}${ord.curr.stCo}
        <c:if test="${ord.toTx.doubleValue() gt 0 && rvs.tsrg.txExcl}">(${i18n.getMsg("txExcl", rvs.upf.lng.iid)}),</c:if>
        <c:if test="${ord.toTx.doubleValue() gt 0 && !rvs.tsrg.txExcl}">(${i18n.getMsg("txIncl", rvs.upf.lng.iid)}),</c:if>
        ${i18n.getMsg("toTx", rvs.upf.lng.iid)} ${ord.toTx}${ord.curr.nme}:</h5>
        <div class="table-responsive">
          <table class="table table-sm">
            <thead>
              <tr>
                <th>${i18n.getMsg("itm", rvs.upf.lng.iid)}</th>
                <th>${i18n.getMsg("uom", rvs.upf.lng.iid)}</th>
                <th>${i18n.getMsg("pri", rvs.upf.lng.iid)}</th>
                <th>${i18n.getMsg("quan", rvs.upf.lng.iid)}</th>
                <th>${i18n.getMsg("tot", rvs.upf.lng.iid)}</th>
                <c:if test="${ord.toTx.doubleValue() gt 0 && rvs.tsrg.txExcl && !rvs.txRules.stIb}">
                  <th>${i18n.getMsg("toTx", rvs.upf.lng.iid)}</th>
                </c:if>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="il" items="${ord.goods}">
                <tr>
                  <td>${il.dscr}</td>
                  <td>${il.uom.nme}</td>
                  <td>${numStr.frmt(il.pri.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}</td>
                  <td>${numStr.frmt(il.quan.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.quDp,rvs.upf.dgInGr)}</td>
                  <td>${numStr.frmt(il.tot.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}${ord.curr.nme}</td>
                  <c:if test="${ord.toTx.doubleValue() gt 0 && rvs.tsrg.txExcl && !rvs.txRules.stIb}">
                    <td>${numStr.frmt(il.toTx.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}${ord.curr.nme}</td>
                  </c:if>
                </tr>
              </c:forEach>
              <c:forEach var="il" items="${ord.servs}">
                <tr>
                  <td>${il.dscr}</td>
                  <td>${il.uom.nme}</td>
                  <td>${numStr.frmt(il.pri.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}</td>
                  <td>${numStr.frmt(il.quan.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.quDp,rvs.upf.dgInGr)}</td>
                  <td>${numStr.frmt(il.tot.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}${ord.curr.nme}</td>
                  <c:if test="${ord.toTx.doubleValue() gt 0 && rvs.tsrg.txExcl && !rvs.txRules.stIb}">
                    <td>${numStr.frmt(il.toTx.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}${ord.curr.nme}</td>
                  </c:if>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <c:if test="${ord.toTx.doubleValue() gt 0}">
          <h5>${i18n.getMsg("Taxs", rvs.upf.lng.iid)}
          <c:if test="${not empty txRules}">
            <c:if test="${rvs.txRules.stIb}">
              (${i18n.getMsg("stIb", rvs.upf.lng.iid)},
            </c:if>
            <c:if test="${!rvs.txRules.stIb}">
              (${i18n.getMsg("it_basis", rvs.upf.lng.iid)},
            </c:if>
            <c:if test="${rvs.txRules.stAg}">
              ${i18n.getMsg("aggrOnly", rvs.upf.lng.iid)},
            </c:if>
            ${i18n.getMsg(rvs.txRules.stRm, rvs.upf.lng.iid)}):
          </c:if></h5>
          <div class="table-responsive">
            <table class="table table-sm">
              <thead>
                <tr>
                  <th>${i18n.getMsg("tax", rvs.upf.lng.iid)}</th>
                  <th>${i18n.getMsg("tot", rvs.upf.lng.iid)}</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="txLn" items="${ord.taxes}">
                  <tr>
                    <td>${txLn.tax.nme}</td>
                    <td>${txLn.tot}${ord.curr.nme}</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </c:if>
        <h6>${i18n.getMsg("paym", rvs.upf.lng.iid)}: ${i18n.getMsg(ord.paym, rvs.upf.lng.iid)}</h6>
        <h6>${i18n.getMsg("delv", rvs.upf.lng.iid)}: ${i18n.getMsg(ord.delv, rvs.upf.lng.iid)}</h6>
        <c:if test="${not empty ord.pipl}">
          <h6>${i18n.getMsg("pipl", rvs.upf.lng.iid)}: ${ord.pipl.nme}</h6>
        </c:if>
        <c:if test="${ord.delv ne 'PICKUP'}">
          <c:set var="ifDeliv" value="${true}"/>
        </c:if>
        <c:if test="${ord.paym eq 'PAYPAL' || ord.paym eq 'PAYPAL_ANY'}">
          <c:set var="ifPayPal" value="${true}"/>
        </c:if>
      </c:forEach>
      <c:if test="${ifDeliv}">
        <h5>${i18n.getMsg("shipping_address", rvs.upf.lng.iid)}:</h5>
        <div class="table-responsive">
          <table class="table table-sm">
            <tbody>
              <tr>
                <td>${i18n.getMsg("Emrcp", rvs.upf.lng.iid)}</td>
                <td>${rvs.buyr.nme}</td>
              </tr>
              <c:if test="${not empty rvs.buyr.cntr}">
                <tr>
                  <td>${i18n.getMsg("cntr", rvs.upf.lng.iid)}</td>
                  <td>${rvs.buyr.cntr}</td>
                </tr>
              </c:if>
              <c:if test="${not empty rvs.buyr.stat}">
                <tr>
                  <td>${i18n.getMsg("stat", rvs.upf.lng.iid)}</td>
                  <td>${rvs.buyr.stat}</td>
                </tr>
              </c:if>
              <c:if test="${not empty rvs.buyr.city}">
                <tr>
                  <td>${i18n.getMsg("city", rvs.upf.lng.iid)}</td>
                  <td>${rvs.buyr.city}</td>
                </tr>
              </c:if>
              <tr>
                <td>${i18n.getMsg("zip", rvs.upf.lng.iid)}</td>
                <td>${rvs.buyr.zip}</td>
              </tr>
              <tr>
                <td>${i18n.getMsg("addr1", rvs.upf.lng.iid)}</td>
                <td>${rvs.buyr.addr1}</td>
              </tr>
              <c:if test="${not empty rvs.buyr.addr2}">
                <tr>
                  <td>${i18n.getMsg("addr2", rvs.upf.lng.iid)}</td>
                  <td>${rvs.buyr.addr2}</td>
                </tr>
              </c:if>
              <c:if test="${not empty rvs.buyr.phon}">
                <tr>
                  <td>${i18n.getMsg("phon", rvs.upf.lng.iid)}</td>
                  <td>${rvs.buyr.phon}</td>
                </tr>
              </c:if>
              <tr>
                <td>${i18n.getMsg("eml", rvs.upf.lng.iid)}</td>
                <td>${rvs.buyr.eml}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </c:if>
      <c:if test="${ifPayPal}">
        <div id="paypal-button"></div>
      </c:if>
      <c:if test="${!ifPayPal}">
        <a href="?prc=PrPur&prcRed=WsPg" type="button" class="btn btn-lg btn-block btn-primary">${i18n.getMsg("accept", rvs.upf.lng.iid)}</a>
      </c:if>
    </div>
  </div>


  <jsp:include page="ws18n.jsp"/>

  <jsp:include page="wsCart.jsp"/>
  
  <c:if test="${ifPayPal}">
    <script src="https://www.paypalobjects.com/api/checkout.js"></script>
    <script>
      paypal.Button.render({
        env: '${pmde}', // 'sandbox' or 'production'
        // Set up the payment:
        // 1. Add a payment callback
        payment: function(data, actions) {
          // 2. Make a request to your server
          return actions.request.post('?prc=PrPpl&rnd=ppl&prcRed=${prcRed}&catlId=${catlId}')
            .then(function(res) {
              // 3. Return res.id from the response
              return res.id;
            });
        },
        // Execute the payment:
        // 1. Add an onAuthorize callback
        onAuthorize: function(data, actions) {
          // 2. Make a request to your server
          return actions.request.post('?prc=PrPpl&rnd=ppl&prcRed=${prcRed}&catlId=${catlId}', {
            paymentID: data.paymentID,
            payerID:   data.payerID
          })
            .then(function(res) {
              // 3. Show the buyer a confirmation message:
              window.location.assign('?prc=PrBur&pur=${rvs.orders[0].pur}&prcRed=${prcRed}&catlId=${catlId}');
            });
        }
      }, '#paypal-button');
    </script>
  </c:if>

  <jsp:include page="wsEnd.jsp"/>
</c:if>
