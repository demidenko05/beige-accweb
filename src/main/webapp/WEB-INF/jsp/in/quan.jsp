<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="inpTy" value="text" scope="request"/>
<c:set var="inpAdd" value="class='bsNum${rvs.cpf.quanDp}'" scope="request"/>
<c:set target="${usdDp}" property="${rvs.cpf.quanDp.toString()}" value="${rvs.cpf.quanDp.toString()}"/>
<jsp:include page="tmpl.jsp"/>
