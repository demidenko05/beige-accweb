<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<button class="btn" onClick="bsSelChoSpTy('${ent.typ.iid}',&quot;${ent.typ.nme}&quot;,'${lsPlNm}${param.ent}');bsSelEnt('${ent.iid}',&quot;${ent.nme}&quot;,'${lsPlNm}${param.ent}');">${i18n.getMsg("Pick", rvs.upf.lng.iid)}</button>
