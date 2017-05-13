<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="tools.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��������</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<link rel="icon" href="Admin/images/icon.png">
    <link rel="stylesheet" type="text/css" href="Admin/css/basic.css">
    <link rel="stylesheet" type="text/css" href="Admin/css/table.css">
    <link rel="stylesheet" type="text/css" href="Admin/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="Admin/easyui/themes/icon.css">

    <link rel="stylesheet" type="text/css" href="Admin/css/admin-index.css">
    <script type="text/javascript" src="Admin/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="Admin/easyui/jquery.easyui.min.js"></script>
  </head>
  
  <body> 
  <div class="tablewrapper">
    <div class="tablecontent">
    	<div class="title">δ��������</div>
        <table cellspacing="0">
            <thead>
                <tr>
                    <td>����ID</td>
                    <td>�û���</td>
                    <td>����</td>
                    <td>��ַ</td>
                    <td>�ʱ�</td>
                    <td>Email</td>
                    <td width='180px'>ʱ��</td>
                    <td>״̬</td>
                    <td>����<font size=6 color='#F16522'>${sendMessage}</font></td>
                    <td>
                        <input type="checkbox" id="selectAll" onclick="selectAll()">ȫѡ
                    </td>
                    
                </tr>
            </thead>
            <tbody>
                <form method="post" name="sendForm">
				    <c:forEach var="order" items="${ orderList}">
				        <tr>
				            <td>${order.orderId }</td>
				            <td>${order.user.name }</td>
				            <td>${order.recvName }</td>
				            <td>${order.user.address }</td>
				            <td>${order.user.postcode}</td>
				            <td>${order.user.email}</td>
				            <td width="100px">${order.orderDate }</td>
				            <td>${order.flag }</td>
				            <td><a href="getOneOrderServlet?orderId=${order.orderId}">����</a></td>
				            <td><a href="adminSendOrderServlet?orderId=${order.orderId}&pageOffset=${orderPager.pageOffset}&pageSize=${orderPager.pageSize}">����</a></td>
				    </c:forEach>
				    	</tr>
				</form>
            </tbody>
            <tfoot></tfoot>
        </table>
        <div class="page">
            <ul>
                <pg:pager items="${orderPager.totalNum }" maxPageItems="${orderPager.pageSize}" export="currentPageNo = pageNumber" url="getOrderNotSendPagerServlet">
				    <pg:param name="pageSize" value="${orderPager.pageSize }" />
				    <pg:param name="pageNo" value="${currentPageNo}" />
				    <pg:first>
				        <li>
				            <a href="${pageUrl}">��ҳ</a>
				        </li>
				    </pg:first>
				    <pg:prev>
				        <li>
				            <a href="${pageUrl}">��һҳ</a>
				        </li>
				    </pg:prev>
				    <pg:pages>
				        <c:choose>
				            <c:when test="${orderPager.pagecurrentPageNo eq pageNumber}">
				                <li>
				                    <font color="#F16522">${pageNumber}</font>
				                </li>
				            </c:when>
				            <c:otherwise>
				                <li><a href="${pageUrl}">${pageNumber}</a></li>
				            </c:otherwise>
				        </c:choose>
				    </pg:pages>
				    <pg:next>
				        <li>
				            <a href="${pageUrl}">��һҳ</a>
				        </li>
				    </pg:next>
				    <pg:last>
				        <li>
				            <a href="${pageUrl}">βҳ</a>
				        </li>
				    </pg:last>
				</pg:pager>
            </ul>
            
            <div>
                <input type="button" value="ɾ��" onclick="removeOrder(${orderPager.pageOffset},${orderPager.pageSize})">
            </div>
        </div>
    </div>
  </div>
  
  </body>
</html>