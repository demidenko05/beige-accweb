<%@ page language="java" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="fltUrlFrm" class="java.util.HashMap" scope="request"/>
<jsp:include page="wsSta.jsp"/>

<c:set target="${fltUrlFrm}" property="itId" value="${param.itId}"/>
<c:set target="${fltUrlFrm}" property="itTy" value="${param.itTy}"/>
<c:set target="${fltUrlFrm}" property="avQu" value="${param.avQu}"/>
<c:set target="${fltUrlFrm}" property="uoId" value="${param.uoId}"/>
<c:set target="${fltUrlFrm}" property="uoNm" value="${param.uoNm}"/>

<c:if test="${rvs.wscurr.iid.equals(rvs.astg.curr.iid)}">
  <c:set var="pri" value="${rvs.itmPri.pri}"/>
</c:if>
<c:if test="${!rvs.wscurr.iid.equals(rvs.astg.curr.iid)}">
  <c:forEach var="cr" items="${rvs.currRts}">
    <c:if test="${rvs.wscurr.iid.equals(cr.curr.iid)}">
      <c:if test="${cr.rate.doubleValue() gt 0}">
        <c:set var="curRate" value="${cr.rate}"/>
      </c:if>
      <c:if test="${cr.rate.doubleValue() lt 0}">
        <c:set var="curRate" value="${java.math.BigDecimal.ONE.divide(cr.rate, 15, java.math.RoundingMode.HALF_UP)}"/>
      </c:if>
    </c:if>
  </c:forEach>
  <c:set var="pri" value="${rvs.itmPri.pri.multiply(curRate).setScale(rvs.astg.prDp,rvs.astg.rndm)}"/>
</c:if>

<div class="py-3 bg-light">
  <div class="row">
    <c:if test="${not empty rvs.itmImg}">
      <div class="col-12 col-md-6 col-lg-4">
        <img class="img-fluid" src="${rvs.itmImg.str1}">
      </div>
    </c:if>
    <c:if test="${not empty rvs.itmImg}">
      <div class="col-12 col-md-6 col-lg-8">
    </c:if>
    <c:if test="${empty rvs.itmImg}">
      <div class="col-12">
    </c:if>
      <h5>
        <c:if test="${not empty rvs.itmPri}">
          <b>${numStr.frmt(pri.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)} ${rvs.wscurr.nme}</b>
        </c:if>
        ${rvs.itmSpecLs.get(0).itm.nme}
      </h5>
      <p>
        ${utlTrJsp.itmSpfStr(rvs, rvs.itmSpecLs)}
      </p>
    </div>
  </div>
</div>

<div class="py-1 text-center bg-light">
  <c:if test="${empty rvs.cartItm && not empty rvs.itmPri}">
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#cartAddMdl" onclick="bsSetCartItm(${itType}, ${rvs.itmPri.itm.iid}, '${rvs.itmPri.itm.nme}', ${pri}, 1, ${param.avQu}, null,${param.uoId},'${param.uoNm}',${rvs.itmPri.unSt},${rvs.astg.prDp},${rvs.astg.rndm.ordinal()})">${i18n.getMsg("buy_it", rvs.upf.lng.iid)}</button>
  </c:if>
  <c:if test="${not empty rvs.cartItm}">
    <button type="button" class="btn btn-primary" onclick="$('#cartMdl').modal('toggle');">${i18n.getMsg("open_cart", rvs.upf.lng.iid)} <span class="badge badge-secondary">${shoppingCart.totalItems}</span></button>
  </c:if>
</div>

<div class="py-3 bg-light">
  <div class="text-center text-muted">
    <h4>${i18n.getMsg("ItmSpf", rvs.upf.lng.iid)}:</h4>
  </div>
  <div class="specifics">
    <div class="row">
      <c:forEach var="itSp" items="${rvs.itmSpecLs}">
        <c:if test="${itSp.spec.typ eq 'TEXT'}">
          <div class="col-12 col-md-5">
            <b>${itSp.spec.nme}: </b>
          </div>
          <div class="col-12 col-md-7">
            ${itSp.str1}
          </div>
        </c:if>
        <c:if test="${itSp.spec.typ eq 'BIGDECIMAL'}">
          <div class="col-12 col-md-5">
            <b>${itSp.spec.nme}: </b>
          </div>
          <div class="col-12 col-md-7">
            ${itSp.num1}
            <c:if test="${not empty itSp.str1}">
              ${itSp.str1}
            </c:if>
          </div>
        </c:if>
        <c:if test="${itSp.spec.typ eq 'INTEGER'}">
          <div class="col-12 col-md-5">
            <b>${itSp.spec.nme}: </b>
          </div>
          <div class="col-12 col-md-7">
            ${itSp.lng1}
            <c:if test="${not empty itSp.str1}">
              ${itSp.str1}
            </c:if>
          </div>
        </c:if>
        <c:if test="${itSp.spec.typ eq 'CHOOSEABLE_SPECIFICS'}">
          <div class="col-12 col-md-5">
            <b>${itSp.spec.nme}: </b>
          </div>
          <div class="col-12 col-md-7">
            ${itSp.str1}
          </div>
        </c:if>
      </c:forEach>
    </div>
  </div>
</div>

<c:forEach var="itSp" items="${rvs.itmSpecLs}">
  <c:if test="${itSp.spec.typ eq 'FILE_EMBEDDED' && itSp.str1.endsWith('html')}">
    <c:set var="embhtmlnm" value="${utJsp.evFileNmNoExt(itSp.str1)}"/>
    <c:set var="flUrl" value="${itSp.str1}"/>
    <c:set var="flNsf" value="_${rvs.upf.lng.iid}.html"/>
    <c:if test="${not empty itSp.str3 && itSp.str3.contains(rvs.upf.lng.iid)}">
      <c:set var="flUrl" value="${itSp.str1.replace('.html',flNsf)}"/>
    </c:if>
    <div id="${embhtmlnm}" class="py-3 bg-light embed-html">
    </div>
    <script> $( "#${embhtmlnm}" ).load( "${flUrl} #container" ); </script>
  </c:if>
</c:forEach>

<c:set var="currGroup" value=""/>
<c:forEach var="itSp" items="${rvs.itmSpecLs}">
  <c:if test="${itSp.spec.typ eq 'IMAGE_IN_SET' && not empty itSp.spec.grp}">
    <c:if test="${empty currGroup || itSp.spec.grp.iid ne currGroup.iid}">
      <c:if test="${not empty currGroup}">
          </div>
        </div>
      </c:if>
      <c:set var="currGroup" value="${itSp.spec.grp}"/>
      <div class="album py-3 bg-light">
      <c:if test="${not empty itSp.str4}">
        <div class="text-center text-muted">
          <h4>${itSp.str4}</h4>
        </div>
      </c:if>
      <div class="row">
    </c:if>
    <div class="col-12 col-md-6 col-lg-4">
      <div class="card mb-4 box-shadow">
        <img class="card-img-top" src="${itSp.str1}" alt="Card image cap">
        <c:if test="${not empty itSp.str3}">
          <div class="card-body">
            <p class="card-text">${itSp.str3}</p>
          </div>
        </c:if>
      </div>
    </div>
  </c:if>
  <c:if test="${itSp.spec.typ ne 'IMAGE_IN_SET' || empty itSp.spec.grp}">
    <c:if test="${not empty currGroup}">
        </div>
      </div>
    </c:if>
    <c:set var="currGroup" value=""/>
  </c:if>
</c:forEach>
<c:if test="${not empty currGroup}">
    </div>
  </div>
  <c:set var="currGroup" value=""/>
</c:if>

<c:forEach var="itSp" items="${rvs.itmSpecLs}">
  <c:if test="${itSp.spec.typ eq 'FILE' && not empty itSp.spec.grp}">
    <c:if test="${empty currGroup || itSp.spec.grp.iid ne currGroup.iid}">
      <c:if test="${not empty currGroup}">
        </div>
      </c:if>
      <c:set var="currGroup" value="${itSp.spec.grp}"/>
      <div class="py-3 bg-light text-center text-muted">
      <c:if test="${not empty itSp.str4}">
        <h4>${itSp.str4}</h4>
      </c:if>
    </c:if>
    <h6><a href="${itSp.str1}">${itSp.str3}</a></h6>
  </c:if>
  <c:if test="${itSp.spec.typ ne 'FILE' || empty itSp.spec.grp}">
    <c:if test="${not empty currGroup}">
      </div>
    </c:if>
    <c:set var="currGroup" value=""/>
  </c:if>
</c:forEach>
<c:if test="${not empty currGroup}">
  </div>
  <c:set var="currGroup" value=""/>
</c:if>

<jsp:include page="ws18n.jsp"/>

<jsp:include page="wsCart.jsp"/>

<jsp:include page="wsEnd.jsp"/>
