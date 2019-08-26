<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="filterUrlFrm" class="java.util.HashMap" scope="request"/>

<jsp:include page="wsSta.jsp"/>

<c:if test="${not empty rvs.catl}">
  <c:set var="filterUrl" value="&catlId=${rvs.catl.iid}" scope="request"/>
  <c:set target="${filterUrlFrm}" property="catlId" value="${rvs.catl.iid}"/>
  <c:if test="${not empty param.page}">
    <c:set target="${filterUrlFrm}" property="page" value="${param.page}"/>
  </c:if>
  <c:if test="${not empty rvs.fltCatl && not empty rvs.fltCatl.opr}">
    <c:set var="filterUrl" value="${filterUrl}&fltCtOp=${rvs.fltCatl.opr}" scope="request"/>
    <c:set target="${filterUrlFrm}" property="fltCtOp" value="${rvs.fltCatl.opr.toString()}"/>
    <c:forEach var="flCtVl" items="${rvs.fltCatl.items}">
      <c:set var="filterUrl" value="${filterUrl}&fltCtVal=${flCtVl.iid}" scope="request"/>
      <c:if test="${not empty filterUrlFrm.get('fltCtVal')}">
        <c:set target="${filterUrlFrm}" property="fltCtVal" value="${filterUrlFrm.get('fltCtVal')};${flCtVl.iid}"/>
      </c:if>
      <c:if test="${empty filterUrlFrm.get('fltCtVal')}">
        <c:set target="${filterUrlFrm}" property="fltCtVal" value="${flCtVl.iid.toString()}"/>
      </c:if>
    </c:forEach>
  </c:if>
  <c:if test="${not empty rvs.fltSpf}">
    <c:forEach var="fltSpf" items="${rvs.fltSpf}">
      <c:if test="${not empty fltSpf.flt.opr}">
        <c:set var="parPref" value="fltSp${fltSpf.catSpf.specifics.iid}"/>
        <c:set var="filterUrl" value="${filterUrl}&${parPref}Op=${fltSpf.flt.opr}" scope="request"/>
        <c:set target="${filterUrlFrm}" property="${parPref}Op" value="${fltSpf.flt.opr.toString()}"/>
        <c:if test="${fltSpf.flt.getClass().simpleName eq 'FilterItems'}">
          <c:set var="prVl" value="${parPref}Val"/>
          <c:forEach var="flSpVl" items="${fltSpf.flt.items}">
            <c:set var="filterUrl" value="${filterUrl}&${parPref}Val=${flSpVl.iid}" scope="request"/>
            <c:if test="${not empty filterUrlFrm.get(prVl)}">
              <c:set target="${filterUrlFrm}" property="${prVl}" value="${filterUrlFrm.get(prVl)};${flSpVl.iid}"/>
            </c:if>
            <c:if test="${empty filterUrlFrm.get(prVl)}">
              <c:set target="${filterUrlFrm}" property="${prVl}" value="${flSpVl.iid.toString()}"/>
            </c:if>
          </c:forEach>
        </c:if>
        <c:if test="${fltSpf.flt.getClass().simpleName ne 'FilterItems'}">
          <c:set var="filterUrl" value="${filterUrl}&${parPref}Val1=${fltSpf.flt.value1}" scope="request"/>
          <c:set target="${filterUrlFrm}" property="${parPref}Val1" value="${fltSpf.flt.value1.toString()}"/>
          <c:if test="${fltSpf.flt.opr eq 'BETWEEN_INCLUDE'}">
            <c:set var="filterUrl" value="${filterUrl}&${parPref}Val2=${fltSpf.flt.value2}" scope="request"/>
            <c:set target="${filterUrlFrm}" property="${parPref}Val2" value="${fltSpf.flt.value2.toString()}"/>
          </c:if>
        </c:if>
      </c:if>
    </c:forEach>
  </c:if>
  <c:if test="${not empty rvs.fltPri && not empty rvs.fltPri.opr}">
    <c:set var="filterUrl" value="${filterUrl}&fltPriOp=${rvs.fltPri.opr}&fltPriVal1=${rvs.fltPri.value1}" scope="request"/>
    <c:set target="${filterUrlFrm}" property="fltPriOp" value="${rvs.fltPri.opr}"/>
    <c:set target="${filterUrlFrm}" property="fltPriVal1" value="${rvs.fltPri.value1}"/>
    <c:if test="${not empty rvs.fltPri.value2}">
      <c:set var="filterUrl" value="${filterUrl}&fltPriVal2=${rvs.fltPri.value2}" scope="request"/>
      <c:set target="${filterUrlFrm}" property="fltPriVal2" value="${rvs.fltPri.value2}"/>
    </c:if>
  </c:if>

  <c:set var="listFltAp" value=""/>
  <c:if test="${not empty rvs.catl}">
    <c:set var="listFltAp" value="${utlTrJsp.catlToStr(rvs.catl, rvs.i18nCatalogs, rvs.upf.lng.iid)}"/>
    <c:set var="delim" value="/"/>
    <c:if test="${not empty rvs.fltCatl && not empty rvs.fltCatl.opr}">
      <c:set var="listFltAp" value="${listFltAp} ${i18n.getMsg(rvs.fltCatl.opr, rvs.upf.lng.iid)} ("/>
      <c:set var="delim" value=""/>
      <c:forEach var="cat" items="${rvs.fltCatl.items}">
        <c:set var="listFltAp" value="${listFltAp}${delim}${utlTrJsp.catlToStr(cat, rvs.i18nCatalogs, rvs.upf.lng.iid)}"/>
        <c:set var="delim" value=", "/>
      </c:forEach>
      <c:set var="listFltAp" value="${listFltAp})"/>
      <c:set var="delim" value="/"/>
    </c:if>
    <c:set var="andI18n" value="${i18n.getMsg('and', rvs.upf.lng.iid)}"/>
    <c:if test="${not empty rvs.fltPri && not empty rvs.fltPri.opr}">
      <c:set var="prI18n" value="${i18n.getMsg('itsPrice', rvs.upf.lng.iid)}"/>
      <c:set var="listFltAp" value="${listFltAp} ${delim} ${prI18n} ${i18n.getMsg(rvs.fltPri.opr, rvs.upf.lng.iid)} ${rvs.fltPri.value1}"/>
      <c:if test="${not empty rvs.fltPri.value2}">
        <c:set var="listFltAp" value="${listFltAp} ${andI18n} ${rvs.fltPri.value2}"/>
      </c:if>
    </c:if>
    <c:if test="${not empty rvs.fltSpf}">
      <c:forEach var="fltSpf" items="${rvs.fltSpf}">
        <c:if test="${not empty fltSpf.flt.opr}">
          <c:set var="listFltAp" value="${listFltAp} ${delim} ${fltSpf.catSpf.specifics.nme} ${i18n.getMsg(fltSpf.flt.opr, rvs.upf.lng.iid)}"/>
          <c:set var="delim" value="/"/>
          <c:if test="${fltSpf.flt.getClass().simpleName eq 'FilterItems'}">
            <c:set var="listFltAp" value="${listFltAp} ("/>
            <c:forEach var="flSpVl" items="${fltSpf.flt.items}" varStatus="status">
              <c:if test="${status.index == 0}">
                <c:set var="listFltAp" value="${listFltAp}${flSpVl.nme}"/>
              </c:if>
              <c:if test="${status.index != 0}">
                <c:set var="listFltAp" value="${listFltAp}, ${flSpVl.nme}"/>
              </c:if>
            </c:forEach>
            <c:set var="listFltAp" value="${listFltAp})"/>
          </c:if>
          <c:if test="${fltSpf.flt.getClass().simpleName ne 'FilterItems'}">
            <c:set var="listFltAp" value="${listFltAp} ${fltSpf.flt.value1}"/>
            <c:if test="${fltSpf.flt.opr eq 'BETWEEN_INCLUDE'}">
              <c:set var="listFltAp" value="${listFltAp} ${andI18n} ${fltSpf.flt.value2}"/>
            </c:if>
          </c:if>
        </c:if>
      </c:forEach>
    </c:if>
    <c:if test="${not empty filterUrl}">
      <c:set var="filterUrl" value="${filterUrl}&ordb=${ordb}&ctNm=${utlTrJsp.catlToStr(rvs.catl, rvs.i18nCatalogs, rvs.upf.lng.iid)}" scope="request"/>
    </c:if>
    <c:if test="${empty filterUrl}">
      <c:set var="filterUrl" value="&ordb=${ordb}&ctNm=${utlTrJsp.catlToStr(rvs.catl, rvs.i18nCatalogs, rvs.upf.lng.iid)}" scope="request"/>
    </c:if>
    <c:if test="${not empty ordb}">
      <c:set target="${filterUrlFrm}" property="ordb" value="${ordb}"/>
    </c:if>
    <c:set target="${filterUrlFrm}" property="ctNm" value="${utlTrJsp.catlToStr(rvs.catl, rvs.i18nCatalogs, rvs.upf.lng.iid)}"/>
  </c:if>

  <div class="card cat-name">
    <div class="card-header">
      ${listFltAp}
      <c:if test="${ordb eq 'pa'}">
        / ${i18n.getMsg("OrderBy", rvs.upf.lng.iid)} ${i18n.getMsg("ord_pr_asc", rvs.upf.lng.iid)}
      </c:if>
      <c:if test="${ordb eq 'pd'}">
        / ${i18n.getMsg("OrderBy", rvs.upf.lng.iid)} ${i18n.getMsg("ord_pr_dsc", rvs.upf.lng.iid)}
      </c:if>
    </div>
  </div>

  <c:set var="divImg">
     <div class="col-12 col-md-4">  
  </c:set>
  <c:set var="divDscr">
    <div class="col-12 col-md-8">
  </c:set>
  <c:set var="divDscrOnly">
    <div class="col-12">
  </c:set>
  <c:if test="${rvs.tstg.colCnt != 1}">
    <c:set var="divImg">
       <div class="col-12 col-md-4 col-lg-2">  
    </c:set>
    <c:set var="divDscr">
      <div class="col-12 col-md-8 col-lg-4">
    </c:set>
    <c:set var="divDscrOnly">
      <div class="col-12 col-lg-6">
    </c:set>
  </c:if>
  <c:if test="${!rvs.wscurr.iid.equals(rvs.astg.curr.iid)}">
    <c:forEach var="cr" items="${rvs.currRates}">
      <c:if test="${rvs.wscurr.iid.equals(cr.curr.iid)}">
        <c:if test="${cr.rate.doubleValue() gt 0}">
          <c:set var="curRate" value="${cr.rate}"/>
        </c:if>
        <c:if test="${cr.rate.doubleValue() lt 0}">
          <c:set var="curRate" value="${java.math.BigDecimal.ONE.divide(cr.rate, 15, java.math.RoundingMode.HALF_UP)}"/>
        </c:if>
      </c:if>
    </c:forEach>
  </c:if>
  <c:forEach var="itm" items="${rvs.itList}" varStatus="status">
    <c:set var="uomId" value="1"/>
    <c:set var="uomNm" value="${i18n.getMsg('each')}"/>
    <c:if test="${rvs.wscurr.iid.equals(rvs.astg.curr.iid)}">
      <c:set var="itPrice" value="${itm.itsPrice}"/>
    </c:if>
    <c:if test="${!rvs.wscurr.iid.equals(rvs.astg.curr.iid)}">
      <c:set var="itPrice" value="${itm.itsPrice.multiply(curRate).setScale(rvs.astg.prDp,rvs.astg.rndm)}"/>
    </c:if>
    <c:if test="${not empty itm.uom}">
      <c:set var="uomId" value="${itm.uom.iid}"/>
      <c:set var="uomNm" value="${itm.uom.nme}"/>
    </c:if>
    <c:set var="quan" value="${itm.unStep}"/>
    <c:set var="lnId" value="null"/>
    <c:set var="orderedQuantity" value=""/>
    <c:if test="${not empty cartMap && not empty cartMap[itm.typ][itm.itId]}">
      <c:set var="quan" value="${cartMap[itm.typ][itm.itId].quan}"/>
      <c:set var="lnId" value="${cartMap[itm.typ][itm.itId].iid}"/>
      <c:set target="${cartMap[itm.typ][itm.itId]}" property="avQuan" value="${itm.availableQuantity}"/>
      <c:set var="orderedQuantity">
        <span class="badge badge-primary">${numStr.frmtNtz(cartMap[itm.typ][itm.itId].quan.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.upf.dgInGr)}</span>
      </c:set>
    </c:if>
    <c:if test="${rvs.tstg.colCnt == 1 || (status.index mod 2) == 0}">
      <div class="row">
    </c:if>
    <c:if test="${not empty itm.imageUrl}">
      ${divImg}
        <img class="card-img-top" src="${itm.imageUrl}">
      </div>
      ${divDscr}
    </c:if>
    <c:if test="${empty itm.imageUrl}">
      ${divDscrOnly}
    </c:if>
      <h5>
        <a href="#" onclick="setCartItem(${itm.typ.ordinal()},${itm.itId},'${itm.nme}',${itPrice},${quan},${itm.availableQuantity},${lnId},${uomId},'${uomNm}',${itm.unStep},${rvs.astg.prDp},${rvs.astg.rndm.ordinal()});"><span class="oi oi-cart" title="cart" aria-hidden="true"></span>${orderedQuantity}</a>
        <b><span>${numStr.frmt(itPrice.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}</span> ${rvs.wscurr.sgn}
          <c:if test="${not empty itm.uom}">
            ${itm.uom.nme}
          </c:if>
        </b>
        <c:if test="${not empty itm.detMt}">
          <a href="?rnd=${itm.typ}${itm.detMt}&prc=PrcItemPage&itId=${itm.itId}&itTy=${itm.typ}&avQu=${itm.availableQuantity}&uoId=${uomId}&uoNm=${uomNm}">${itm.nme}</a>
        </c:if>
        <c:if test="${empty itm.detMt}">
          ${itm.nme}
        </c:if>
      </h5>
      <p>${itm.specs}</p>
    </div>
    <c:if test="${rvs.tstg.colCnt == 1 || (status.index mod 2) != 0}">
      </div>
    </c:if>
  </c:forEach>
  <c:if test="${rvs.tstg.colCnt != 1 && rvs.itList.size() mod 2 != 0}">
    </div>
  </c:if>

  <c:if test="${not empty rvs.pages}">
    <nav aria-label="Page navigation">
      <ul class="pagination justify-content-center">
        <c:forEach var="pg" items="${rvs.pages}">
          <c:if test="${pg.cur}">
            <li class="page-itm active"><a class="page-link" href="?prc=WsPg&page=${pg.val}${filterUrl}">${pg.val}</a></li>
          </c:if>
          <c:if test="${!pg.cur}">
            <c:if test="${pg.val ne '...'}">
              <li class="page-itm"><a class="page-link" href="?prc=WsPg&page=${pg.val}${filterUrl}">${pg.val}</a></li>
            </c:if>
            <c:if test="${pg.val eq '...'}">
              <li class="page-itm"><a class="page-link" href="#">${pg.val}</a></li>
            </c:if>
          </c:if>
        </c:forEach>
      </ul>
    </nav>
  </c:if>

  <!-- Modal filter -->
  <div class="modal fade" id="filterMdl" tabindex="-1" role="dialog" aria-labelledby="filterMdlLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="filterMdlLabel"><span class="oi oi-sort-ascending" aria-hidden="true"></span> ${i18n.getMsg("filterOrder", rvs.upf.lng.iid)}</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="modal-body">
          <form action="" method="GET">
            <input type="hidden" name="rnd" value="webstore">
            <input type="hidden" name="prc" value="PrcWebstorePage">
            <input type="hidden" name="catlId" value="${rvs.catl.iid}">
            <div class="row">
              <div class="col-12 col-md-6 mb-3">
                <label>${i18n.getMsg("OrderBy", rvs.upf.lng.iid)}:</label>
              </div>
              <div class="col-12 col-md-6 mb-3">
                <select name="ordb"  class="form-control">
                  <c:set var="itmSel" value=""/>
                  <c:if test="${empty ordb}">
                    <c:set var="itmSel" value="selected"/>
                  </c:if>
                  <option value="-" ${itmSel}>-</option>
                  <c:set var="itmSel" value=""/>
                  <c:if test="${ordb eq 'pa'}">
                    <c:set var="itmSel" value="selected"/>
                  </c:if>
                  <option value="pa" ${itmSel}>${i18n.getMsg("ord_pr_asc", rvs.upf.lng.iid)}</option>
                  <c:set var="itmSel" value=""/>
                  <c:if test="${ordb eq 'pd'}">
                    <c:set var="itmSel" value="selected"/>
                  </c:if>
                  <option value="pd" ${itmSel}>${i18n.getMsg("ord_pr_dsc", rvs.upf.lng.iid)}</option>
                </select>
              </div>
            </div>
            <c:if test="${empty rvs.fltCatl || empty rvs.fltCatl.opr}">
              <c:set var="disFltCtVal" value="disabled"/>
            </c:if>
            <c:if test="${not empty rvs.fltCatl && not empty rvs.fltCatl.opr}">
              <c:set var="disFltCtVal" value=""/>
            </c:if>
            <div id="rowFltCat" class="row">
              <div class="col-12 col-md-4 mb-3">
                <label>${i18n.getMsg("itsCatalog", rvs.upf.lng.iid)}:</label>
              </div>
              <div class="col-12 col-md-8 mb-3">
                <input class="form-control" disabled value="${utlTrJsp.catlToStr(rvs.catl, rvs.i18nCatalogs, rvs.upf.lng.iid)}">
              </div>
            </div>
            <c:if test="${not empty rvs.fltCatl}">
              <div class="row">
                <div class="col-12 col-md-3 mb-3">
                  <label>${i18n.getMsg("rvs.fltCatl", rvs.upf.lng.iid)}:</label>
                </div>
                <div class="col-12 col-md-3 mb-3">
                  <select id="fltCtOp" name="fltCtOp" onchange="onCatalogOperChanged(this, 'fltCtVal', 'rowFltCat');" class="form-control">
                    <c:if test="${rvs.fltCatl.opr ne 'NOT_IN'}"> <c:set var="selNotIn" value=""/> </c:if>
                    <c:if test="${rvs.fltCatl.opr eq 'NOT_IN'}"> <c:set var="selNotIn" value="selected"/> </c:if>
                    <c:if test="${rvs.fltCatl.opr ne 'IN'}"> <c:set var="selIn" value=""/> </c:if>
                    <c:if test="${rvs.fltCatl.opr eq 'IN'}"> <c:set var="selIn" value="selected"/> </c:if>
                    <c:if test="${empty selIn && empty selNotIn}"> <c:set var="selNon" value=""/> </c:if>
                    <c:if test="${!(empty selIn && empty selNotIn)}"> <c:set var="selNon" value="selected"/> </c:if>
                    <option value="" ${selNon}>-</option>
                    <option value="IN" ${selIn}>${i18n.getMsg("IN", rvs.upf.lng.iid)}</option>
                    <option value="NOT_IN" ${selNotIn}>${i18n.getMsg("NOT_IN", rvs.upf.lng.iid)}</option>
                  </select>
                </div>
                <div class="col-12 col-md-6 mb-3">
                  <select multiple id="fltCtVal" ${disFltCtVal} name="fltCtVal" onchange="onCatalogValChanged(this, 'fltCtOp', 'rowFltCat');" class="form-control">
                    <c:forEach var="cata" items="${rvs.fltCatl.itemsAll}">
                      <c:set var="catSel" value=""/>
                      <c:forEach var="catc" items="${rvs.fltCatl.items}">
                        <c:if test="${catc.iid eq cata.iid}">
                          <c:set var="catSel" value="selected"/>
                        </c:if>
                      </c:forEach>
                      <option value="${cata.iid}" ${catSel}>${utlTrJsp.catlToStr(cata, rvs.i18nCatalogs, rvs.upf.lng.iid)}</option>
                    </c:forEach>
                  </select>
                </div>
              </div>
            </c:if>
            <c:if test="${not empty rvs.fltPri}">
              <jsp:include page="fl/pri${rvs.catl.flPrId}.jsp"/>
            </c:if>
            <c:forEach var="fltSpf" items="${rvs.fltSpfs}">
              <c:set var="fltSpf" value="${fltSpf}" scope="request"/>
              <jsp:include page="fl/sp${fltSpf.flt.getClass().simpleName}${fltSpf.catSpf.fltId}.jsp"/>
            </c:forEach>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">${i18n.getMsg("Close", rvs.upf.lng.iid)}</button>
              <button type="submit" class="btn btn-primary">${i18n.getMsg("Apply", rvs.upf.lng.iid)}</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal subcatalogs -->
  <c:forEach var="cat1l" items="${rvs.catls}">
    <c:forEach var="cat2l" items="${cat1l.subcatls}">
      <c:if test="${cat2l.subcatls.size() gt 0}">
        <div class="modal fade" id="subcatalogsMdl${cat2l.catl.iid}" tabindex="-1" role="dialog" aria-labelledby="subcatalogsMdl${cat2l.catl.iid}Label">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="subcatalogsMdl${cat2l.catl.iid}Label"><span class="oi oi-folder" aria-hidden="true"></span> ${utlTrJsp.catlToStr(cat2l.catl, rvs.i18nCatalogs, rvs.upf.lng.iid)}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
              </div>
              <div class="modal-body">
                <h5><a href="?prc=WsPg&catlId=${cat2l.catl.iid}">${utlTrJsp.catlToStr(cat2l.catl, rvs.i18nCatalogs, rvs.upf.lng.iid)}</a></h5>
                <ul><c:forEach var="cat3l" items="${cat2l.subcatls}">
                  <li><a href="?prc=WsPg&catlId=${cat3l.catl.iid}">${utlTrJsp.catlToStr(cat3l.catl, rvs.i18nCatalogs, rvs.upf.lng.iid)}</a>
                  <c:if test="${cat3l.subcatls.size() gt 0}">
                    <ul><c:forEach var="cat4l" items="${cat3l.subcatls}">
                      <li><a href="?prc=WsPg&catlId=${cat4l.catl.iid}">${utlTrJsp.catlToStr(cat4l.catl, rvs.i18nCatalogs, rvs.upf.lng.iid)}</a>
                        <c:if test="${cat4l.subcatls.size() gt 0}">
                          <ul><c:forEach var="cat5l" items="${cat4l.subcatls}">
                            <li><a href="?prc=WsPg&catlId=${cat5l.catl.iid}">${utlTrJsp.catlToStr(cat5l.catl, rvs.i18nCatalogs, rvs.upf.lng.iid)}</a>
                              <c:if test="${cat5l.subcatls.size() gt 0}">
                                <ul><c:forEach var="cat6l" items="${cat5l.subcatls}">
                                  <li><a href="?prc=WsPg&catlId=${cat6l.catl.iid}">${utlTrJsp.catlToStr(cat6l.catl, rvs.i18nCatalogs, rvs.upf.lng.iid)}</a></li>
                                </c:forEach></ul>
                              </c:if>
                            </li>
                          </c:forEach></ul>
                        </c:if>
                      </li>
                    </c:forEach></ul>
                  </c:if></li>
                </c:forEach></ul>
              </div>
            </div>
          </div>
        </div>
      </c:if>
    </c:forEach>
  </c:forEach>

  <jsp:include page="wsCart.jsp"/>

</c:if>


<jsp:include page="ws18n.jsp"/>

<jsp:include page="wsEnd.jsp"/>
