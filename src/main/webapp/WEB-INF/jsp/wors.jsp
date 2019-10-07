<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="catlId" value="${param.catlId}" scope="request"/>
<jsp:include page="wsSta.jsp"/>

<c:if test="${rvs.ords != null}">
  <div class="card cat-name">
    <div class="card-header">
      <h5>${i18n.getMsg("CuOrs", rvs.upf.lng.iid)}</h5>
    </div>
    <div class="card-body">

  <c:set var="divCnt">
    <div class="col-12">
  </c:set>
  <c:if test="${rvs.tstg.colCnt != 1}">
    <c:set var="divCnt">
      <div class="col-12 col-lg-6">
    </c:set>
  </c:if>

  <c:forEach var="ord" items="${rvs.ords}" varStatus="status">

    <c:if test="${rvs.tstg.colCnt == 1 || (status.index mod 2) == 0}">
      <div class="row">
    </c:if>
    ${divCnt}
      <h6>${i18n.getMsg("CuOr", rvs.upf.lng.iid)}#${ord.iid}, <fmt:formatDate value="${ord.dat}" type="both" timeStyle="short"/>,
      ${i18n.getMsg(ord.stas, rvs.upf.lng.iid)}, ${i18n.getMsg("tot", rvs.upf.lng.iid)} ${ord.tot}${ord.curr.stCo}
      <c:if test="${ord.toTx.unscaledValue() gt 0 && rvs.tstg.txExcl}">(${i18n.getMsg("txExcl", rvs.upf.lng.iid)}),</c:if>
      <c:if test="${ord.toTx.unscaledValue() gt 0 && !rvs.tstg.txExcl}">(${i18n.getMsg("txIncl", rvs.upf.lng.iid)}),</c:if>
      ${i18n.getMsg("toTx", rvs.upf.lng.iid)} ${ord.toTx}${ord.curr.nme},
      ${i18n.getMsg("paym", rvs.upf.lng.iid)}: ${i18n.getMsg(ord.paym, rvs.upf.lng.iid)},
      ${i18n.getMsg("delv", rvs.upf.lng.iid)}: ${i18n.getMsg(ord.delv, rvs.upf.lng.iid)}
      <c:if test="${not empty ord.pipl}">
        , ${i18n.getMsg("pipl", rvs.upf.lng.iid)}: ${ord.pipl.nme}
      </c:if></h6>
      <a href="#" onclick="window.open('?prc=PrBuOr&orId=${ord.iid}');" type="button" class="btn btn-outline-primary">${i18n.getMsg("print", rvs.upf.lng.iid)}</a>
    </div>
    <c:if test="${rvs.tstg.colCnt == 1 || (status.index mod 2) != 0}">
      </div>
    </c:if>
  </c:forEach>
  <c:if test="${rvs.tstg.colCnt != 1 && rvs.ords.size() mod 2 != 0}">
    </div>
  </c:if>

  <c:if test="${not empty rvs.pgs}">
    <nav aria-label="Page navigation">
      <ul class="pagination justify-content-center">
        <c:forEach var="pg" items="${rvs.pgs}">
          <c:if test="${pg.cur}">
            <li class="page-item active"><a class="page-link" href="?prc=PrBuOr&pg=${pg.val}&prcRed=${prcRed}">${pg.val}</a></li>
          </c:if>
          <c:if test="${!pg.cur}">
            <li class="page-item"><a class="page-link" href="?prc=PrBuOr&pg=${pg.val}&prcRed=${prcRed}">${pg.val}</a></li>
          </c:if>
        </c:forEach>
      </ul>
    </nav>
  </c:if>

    </div>
  </div>
</c:if>

<c:if test="${rvs.sords != null}">
  <div class="card cat-name">
    <div class="card-header">
      <h5>${i18n.getMsg("CuOrSes", rvs.upf.lng.iid)}</h5>
    </div>
    <div class="card-body">

  <c:set var="divCnt">
    <div class="col-12">
  </c:set>
  <c:if test="${rvs.tstg.colCnt != 1}">
    <c:set var="divCnt">
      <div class="col-12 col-lg-6">
    </c:set>
  </c:if>

  <c:forEach var="ord" items="${rvs.sords}" varStatus="status">

    <c:if test="${rvs.tstg.colCnt == 1 || (status.index mod 2) == 0}">
      <div class="row">
    </c:if>
    ${divCnt}
      <h6>${i18n.getMsg("CuOrSe", rvs.upf.lng.iid)}#${ord.iid}, <fmt:formatDate value="${ord.dat}" type="both" timeStyle="short"/>,
      ${i18n.getMsg("selr", rvs.upf.lng.iid)}: ${ord.selr.dbcr.nme}, ${i18n.getMsg(ord.stas, rvs.upf.lng.iid)}, ${i18n.getMsg("tot", rvs.upf.lng.iid)} ${ord.tot}${ord.curr.stCo}
      <c:if test="${ord.toTx.unscaledValue() gt 0 && rvs.tstg.txExcl}">(${i18n.getMsg("txExcl", rvs.upf.lng.iid)}),</c:if>
      <c:if test="${ord.toTx.unscaledValue() gt 0 && !rvs.tstg.txExcl}">(${i18n.getMsg("txIncl", rvs.upf.lng.iid)}),</c:if>
      ${i18n.getMsg("toTx", rvs.upf.lng.iid)} ${ord.toTx}${ord.curr.nme},
      ${i18n.getMsg("paym", rvs.upf.lng.iid)}: ${i18n.getMsg(ord.paym, rvs.upf.lng.iid)},
      ${i18n.getMsg("delv", rvs.upf.lng.iid)}: ${i18n.getMsg(ord.delv, rvs.upf.lng.iid)}
      <c:if test="${not empty ord.pipl}">
        , ${i18n.getMsg("pipl", rvs.upf.lng.iid)}: ${ord.pipl.nme}
      </c:if></h6>
      <a href="#" onclick="window.open('?prc=PrBuOr&sorId=${ord.iid}');" type="button" class="btn btn-outline-primary">${i18n.getMsg("print", rvs.upf.lng.iid)}</a>
    </div>
    <c:if test="${rvs.tstg.colCnt == 1 || (status.index mod 2) != 0}">
      </div>
    </c:if>
  </c:forEach>
  <c:if test="${rvs.tstg.colCnt != 1 && rvs.ords.size() mod 2 != 0}">
    </div>
  </c:if>

  <c:if test="${not empty rvs.spgs}">
    <nav aria-label="Page navigation">
      <ul class="pagination justify-content-center">
        <c:forEach var="pg" items="${rvs.spgs}">
          <c:if test="${pg.cur}">
            <li class="page-item active"><a class="page-link" href="?prc=PrBuOr&spg=${pg.val}&prcRed=${prcRed}">${pg.val}</a></li>
          </c:if>
          <c:if test="${!pg.cur}">
            <c:if test="${pg.val ne '...'}">
              <li class="page-item"><a class="page-link" href="?prc=PrBuOr&spg=${pg.val}&prcRed=${prcRed}">${pg.val}</a></li>
            </c:if>
            <c:if test="${pg.val eq '...'}">
              <li class="page-item"><a class="page-link" href="#">${pg.val}</a></li>
            </c:if>
          </c:if>
        </c:forEach>
      </ul>
    </nav>
  </c:if>

    </div>
  </div>
</c:if>

<jsp:include page="ws18n.jsp"/>

<jsp:include page="wsEnd.jsp"/>
