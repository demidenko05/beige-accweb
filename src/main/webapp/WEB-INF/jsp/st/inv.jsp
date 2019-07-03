<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${not empty mdl}">
  # <c:if test="${empty mdl.idOr}">${mdl.dbOr}-${mdl.iid}</c:if>
  <c:if test="${not empty mdl.idOr}">${mdl.dbOr}-${mdl.idOr}</c:if>,
  <fmt:formatDate value="${mdl.dat}" type="both" timeStyle="short"/>,
<c:if test="${empty mdl.cuFr}">${numStr.frmt(mdl.tot.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}</c:if>
<c:if test="${not empty mdl.cuFr}">${numStr.frmt(mdl.toFc.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}</c:if>
/ ${numStr.frmt(mdl.toPa.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}
</c:if>
