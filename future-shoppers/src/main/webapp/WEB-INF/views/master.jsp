<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>

<s:url value="/resources/css" var="css" />
<s:url value="/resources/js" var="js" />
<s:url value="/resources/images" scope="application" var="images" />
<c:set var="contextRoot" value="${pageContext.request.contextPath}"
	scope="application" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=yes">
<meta name="description" content="">
<meta name="author" content="">
<script type="text/javascript">
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}';
</script>
<title>Future Shopping - ${title}</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${css}/bootstrap.min.css" />

<!-- Bootstrap Bootswatch skeatch theame -->
<link href="${css}/bootstrap.minty.css" rel="stylesheet">

<!-- Font Awesome Icons css -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<!-- DataTable css file CDN -->
<link rel="stylesheet" type="text/css"
	href="${css}/jquery.dataTable.css" />

<!-- Navbar Custom css -->
<link href="${css}/navbar.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/breadcrum.css" rel="stylesheet">

<link href="${css}/shop-homepage.css" rel="stylesheet">

<style type="text/css">
body {
	font-family: "Montserrat", -apple-system, system-ui, BlinkMacSystemFont,
		"Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
}
</style>
</head>

<body>

	<!-- Navigation -->

	<c:import url="shared/navbar.jsp" />
	<!-- Page Content -->
	<div class="contentBody">
		<c:choose>
			<c:when test="${userClicksHome eq true}">
				<c:import url="home.jsp"></c:import>
			</c:when>

			<c:when
				test="${userClicksAllProducts eq true or userClicksProductsByCategory eq true}">
				<c:import url="products.jsp"></c:import>
			</c:when>

			<c:when test="${userClicksManageProducts eq true}">
				<c:import url="manageProducts.jsp"></c:import>
			</c:when>
			
			
			<c:when test="${userClicksAddProduct eq true}">
				<c:import url="addProduct.jsp"></c:import>
			</c:when>
			
			<c:when test="${userClicksViewProduct eq true}">
				<c:import url="viewProduct.jsp"></c:import>
			</c:when>
		</c:choose>
	</div>

	<!-- Footer -->

	<c:import url="shared/footer.jsp" />

	<!-- Jquery JS file -->
	<script type="text/javascript" src="${js}/jquery.min.js"></script>

	<!--Popper JS file -->
	<script type="text/javascript" src="${js}/popper.js"></script>

	<!-- 	<!-- Bootstrap Javascript file -->
	<script type="text/javascript" src="${js}/bootstrap.min.js"></script>


	<!-- Bootbox.js file -->
	<script type="text/javascript" src="${js}/bootbox.min.js"></script>

	<!-- Jquery datatable js file -->
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
	<script type="text/javascript" src="${js}/jquery.dataTables.min.js"></script>


	<!-- Custum JS file -->
	<script type="text/javascript" src="${js}/script.js"></script>


</body>

</html>
