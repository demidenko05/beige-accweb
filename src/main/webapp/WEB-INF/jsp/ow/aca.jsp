<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="idPar" value="${hldUvd.idHtml(rvs,ent)}"/>
<button class="btn" onclick="bsGtAjx('GET', 'srv/?rnd=eoj&act=entCp&ent=${cls.simpleName}&${idPar}&${cls.simpleName}.ownr=${rvs.uvs.ent.iid}&owVr=${rvs.uvs.ent.ver}&pg=${param.pg}${flyPar}');">${i18n.getMsg("Copy", rvs.upf.lng.iid)}</button>
<button class="btn" onclick="bsGtAjx('GET', 'srv/?rnd=eoj&act=entEd&ent=${cls.simpleName}&${idPar}&${cls.simpleName}.ownr=${rvs.uvs.ent.iid}&owVr=${rvs.uvs.ent.ver}&pg=${param.pg}${flyPar}');">${i18n.getMsg("Edit", rvs.upf.lng.iid)}</button>
<button class="btn" onclick="bsGtAjx('GET', 'srv/?rnd=doj&act=entCd&ent=${cls.simpleName}&${idPar}&${cls.simpleName}.ownr=${rvs.uvs.ent.iid}&owVr=${rvs.uvs.ent.ver}&pg=${param.pg}${flyPar}');">${i18n.getMsg("Delete", rvs.upf.lng.iid)}</button>
