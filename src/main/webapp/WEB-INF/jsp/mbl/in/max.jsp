<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="inpTy" value="text" scope="request"/>
<c:set var="inpAdd" value="class='bsNum${rvs.cpf.maxDp}m'" scope="request"/>
<c:set target="${usdDp}" property="${rvs.cpf.maxDp}m" value="${rvs.cpf.maxDp}m"/>
<jsp:include page="tmpl.jsp"/>
