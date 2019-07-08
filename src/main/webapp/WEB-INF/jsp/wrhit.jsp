<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${rvs.cpf.usLoc}" scope="request"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="../css/bsPrn.css" />
  <link rel="icon" type="image/png" href="../static/img/favicon.png">
  <title>${i18n.getMsg("items_warehouse", rvs.upf.lng.iid)}</title>
</head>
<body>
  <div style="text-align: center;">
    <h4>
      ${i18n.getMsg("items_warehouse", rvs.upf.lng.iid)} <br></br>
      ${rvs.astg.org}
    </h4>
  </div>
  <table>
    <tr>
      <th>${i18n.getMsg("Wrh", rvs.upf.lng.iid)}</th>
      <th>${i18n.getMsg("wrhp", rvs.upf.lng.iid)}</th>
      <th>${i18n.getMsg("itm", rvs.upf.lng.iid)}</th>
      <th>${i18n.getMsg("uom", rvs.upf.lng.iid)}</th>
      <th>${i18n.getMsg("itLf", rvs.upf.lng.iid)}</th>
    </tr>
    <c:forEach var="wrIt" items="${rvs.wrhItms}">
      <tr>
        <td>
          ${wrIt.wrhp.wrh.nme}
        </td>
        <td>
          ${wrIt.wrhp.nme}
        </td>
        <td>
          ${wrIt.itm.nme}
        </td>
        <td>
          ${wrIt.uom.nme}
        </td>
        <td>
          ${numStr.frmt(wrIt.itLf.toString(),rvs.cpf.dcSpv,rvs.cpf.dcGrSpv,rvs.astg.quDp,rvs.upf.dgInGr)}
        </td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>
