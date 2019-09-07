<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="catlId" value="${param.catlId}" scope="request"/>
<jsp:include page="wsSta.jsp"/>

<div class="card cat-name">
  <div class="card-header">
    <h3>${i18n.getMsg("ACCEPTED", rvs.upf.lng.iid)}</h3>
  </div>
  <div class="card-body">
    <c:forEach var="ord" items="${rvs.pur.ords}">
      <h5>${i18n.getMsg("CuOr", rvs.upf.lng.iid)}#${ord.iid}, <fmt:formatDate value="${ord.dat}" type="both" timeStyle="short"/>,
      ${i18n.getMsg("tot", rvs.upf.lng.iid)} ${ord.tot}${ord.curr.nme}
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
                <td>${il.nme}</td>
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
                <td>${il.nme}</td>
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
    </c:forEach>
    <c:forEach var="ord" items="${rvs.pur.sords}">
      <h5>${i18n.getMsg("CuOr", rvs.upf.lng.iid)}#${ord.iid}, <fmt:formatDate value="${ord.dat}" type="both" timeStyle="short"/>,
      ${i18n.getMsg("dbcr", rvs.upf.lng.iid)}: ${ord.selr.dbcr.nme}, ${i18n.getMsg("tot", rvs.upf.lng.iid)} ${ord.tot}${ord.curr.nme}
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
                <td>${il.nme}</td>
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
                <td>${il.nme}</td>
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
    </c:forEach>
  </div>
</div>

<jsp:include page="ws18n.jsp"/>
<jsp:include page="wsEnd.jsp"/>
