<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="idPar" value="${hldUvd.idHtml(ent)}"/>
<button onclick="window.open('srv/?rnd=pre&act=entPr&ent=${cls.simpleName}&${idPar}', '_blank');" class="btn" >${i18n.getMsg("Print", rvs.upf.lng.iid)}</button>
<button class="btn" onclick="bsGtAjx('GET', 'srv/?rnd=eoj&act=entCp&ent=${cls.simpleName}&${idPar}&${cls.simpleName}.ownr=${hldUvd.ent.iid}&owVr=${hldUvd.ent.ver}&pg=${param.pg}${flyPar}');">${i18n.getMsg("Copy", rvs.upf.lng.iid)}</button>
<button class="btn" onclick="bsGtAjx('GET', 'srv/?rnd=eoj&act=entEd&ent=${cls.simpleName}&${idPar}&${cls.simpleName}.ownr=${hldUvd.ent.iid}&owVr=${hldUvd.ent.ver}&pg=${param.pg}${flyPar}');">${i18n.getMsg("Edit", rvs.upf.lng.iid)}</button>
<button class="btn" onclick="bsGtAjx('GET', 'srv/?rnd=doj&act=entCd&ent=${cls.simpleName}&${idPar}&${cls.simpleName}.ownr=${hldUvd.ent.iid}&owVr=${hldUvd.ent.ver}&pg=${param.pg}${flyPar}');">${i18n.getMsg("Delete", rvs.upf.lng.iid)}</button>
