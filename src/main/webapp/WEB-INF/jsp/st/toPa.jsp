<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty ent.cuFr}">
  ${hldUvd.toStr(rvs,cls,'toPa',ent.toPa)},
</c:if>
<c:if test="${not empty ent.cuFr}">
  ${hldUvd.toStr(rvs,cls,'paFc',ent.paFc)},
</c:if>
<c:if test="${ent.toPa.doubleValue() eq 0 && ent.toPa.doubleValue() eq 0}">
  ${i18n.getMsg("unpaid", rvs.upf.lng.iid)}
</c:if>
<c:if test="${empty ent.cuFr && (ent.toPa.doubleValue() eq ent.tot.doubleValue() && ent.tot.doubleValue() gt 0)
  || (ent.toPa.doubleValue() eq -ent.tot.doubleValue() && ent.tot.doubleValue() lt 0)}">
  ${i18n.getMsg("paid", rvs.upf.lng.iid)}
</c:if>
<c:if test="${empty ent.cuFr && (ent.toPa.doubleValue() gt ent.tot.doubleValue() && ent.tot.doubleValue() gt 0)
    || (ent.toPa.doubleValue() gt -ent.tot.doubleValue() && ent.tot.doubleValue() lt 0)}">
  ${i18n.getMsg("overpaid", rvs.upf.lng.iid)}
</c:if>
<c:if test="${empty ent.cuFr && (ent.toPa.doubleValue() gt 0 && ent.toPa.doubleValue() lt ent.tot.doubleValue() && ent.tot.doubleValue() gt 0)
    || (ent.toPa.doubleValue() gt 0 && ent.toPa.doubleValue() lt -ent.tot.doubleValue() && ent.tot.doubleValue() lt 0)}">
  ${i18n.getMsg("partially_paid", rvs.upf.lng.iid)}
</c:if>
<c:if test="${not empty ent.cuFr && (ent.paFc.doubleValue() eq ent.toFc.doubleValue() && ent.toFc.doubleValue() gt 0)
  || (ent.paFc.doubleValue() eq -ent.toFc.doubleValue() && ent.toFc.doubleValue() lt 0)}">
  ${i18n.getMsg("paid", rvs.upf.lng.iid)}
</c:if>
<c:if test="${not empty ent.cuFr && (ent.paFc.doubleValue() gt ent.toFc.doubleValue() && ent.toFc.doubleValue() gt 0)
    || (ent.paFc.doubleValue() gt -ent.toFc.doubleValue() && ent.toFc.doubleValue() lt 0)}">
  ${i18n.getMsg("overpaid", rvs.upf.lng.iid)}
</c:if>
<c:if test="${not empty ent.cuFr && (ent.paFc.doubleValue() gt 0 && ent.paFc.doubleValue() lt ent.toFc.doubleValue() && ent.toFc.doubleValue() gt 0)
    || (ent.paFc.doubleValue() gt 0 && ent.paFc.doubleValue() lt -ent.toFc.doubleValue() && ent.toFc.doubleValue() lt 0)}">
  ${i18n.getMsg("partially_paid", rvs.upf.lng.iid)}
</c:if>
