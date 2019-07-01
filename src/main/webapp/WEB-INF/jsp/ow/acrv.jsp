<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="idPar" value="${hldUvd.idHtml(rvs,ent)}"/>
<button class="btn" onclick="bsGtAjx('GET', 'srv/?rnd=rvoj&act=entRv&ent=${cls.simpleName}&${idPar}&${cls.simpleName}.ownr=${rvs.uvs.ent.iid}&owVr=${rvs.uvs.ent.ver}&pg=${param.pg}${flyPar}');">${i18n.getMsg("Reverse", rvs.upf.lng.iid)}</button>
