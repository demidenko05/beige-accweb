<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<button onclick="window.open('srv?rnd=prn&act=entPr&ent=${cls.simpleName}&${cls.simpleName}.iid=${ent.iid}','_blank');" class="btn" >${i18n.getMsg("Print", rvs.upf.lng.iid)}</button>
<c:if test="${ent.stas eq 'BOOKED'}">
  <button class="btn" onclick="bsGtAjx('GET','srv?rnd=edj&orAct=pyd&act=entEd&ent=${cls.simpleName}&${cls.simpleName}.iid=${ent.iid}&pg=${param.pg}${flyPar}');">${i18n.getMsg("PAYED", rvs.upf.lng.iid)}</button>
</c:if>
<c:if test="${ent.stas eq 'BOOKED' || ent.stas eq 'PAYED'}">
  <button class="btn" onclick="bsGtAjx('GET','srv?rnd=edj&orAct=cls&act=entEd&ent=${cls.simpleName}&${cls.simpleName}.iid=${ent.iid}&pg=${param.pg}${flyPar}');">${i18n.getMsg("Close", rvs.upf.lng.iid)}</button>
</c:if>
<c:if test="${ent.stas eq 'BOOKED' || ent.stas eq 'PAYED' || ent.stas eq 'CLOSED'}">
  <button class="btn" onclick="bsGtAjx('GET','srv?rnd=edj&orAct=cnc&act=entEd&ent=${cls.simpleName}&${cls.simpleName}.iid=${ent.iid}&pg=${param.pg}${flyPar}');">${i18n.getMsg("Cancel", rvs.upf.lng.iid)}</button>
</c:if>
