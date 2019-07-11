<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty mdl}">
#<c:if test="${empty mdl.idOr}">${mdl.dbOr}-${mdl.iid},</c:if>
<c:if test="${not empty mdl.idOr}">${mdl.dbOr}-${mdl.idOr},</c:if>
${mdl.itm.nme},
${i18n.getMsg("pri", rvs.upf.lng.iid)}=${numStr.frmt(mdl.pri.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.prDp,rvs.upf.dgInGr)}
</c:if>
