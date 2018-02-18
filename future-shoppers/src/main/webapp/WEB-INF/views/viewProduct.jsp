<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- Page Content -->
<div class="container">
	<br>
	<!--  Item Heading -->
	<h1 class="h1">${product.name}</h1>

	<!--  Item Row -->
	<div class="row">

		<div class="col-md-7" style="text-align: center;">
			<img class="img-fluid banner-img"
				src="${images}/${product.productCode}.jpg" alt="Image">
		</div>

		<div class="col-md-5">
			<h3 class="my-3">${product.name}</h3>
			<p>${product.description}</p>
			<h3 class="my-3">Product Details</h3>
			<ul>
				<li>Quantities Available - <strong>${product.quantitiesAvailable}</strong></li>
				<li>Price - <strong> &#8377; ${product.unitPrice}</strong></li>
				<li>Views <span class="fa fa-eye"></span> - <strong>${product.views}</strong></li>
				<li>Rating - <c:choose>
						<c:when test="${product.rating eq 5}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
						</c:when>
						<c:when test="${product.rating ge 4 and product.rating lt 5}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star"></span>
						</c:when>
						<c:when test="${product.rating ge 3 and product.rating lt 4}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
						</c:when>
						<c:when test="${product.rating ge 2 and product.rating lt 3}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star"></span>
						</c:when>
						<c:when test="${product.rating ge 1 and product.rating lt 2}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star"></span>
						</c:when>
						<c:otherwise>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star"></span>
						</c:otherwise>
					</c:choose></li>
				<li>Seller Name - <strong>${product.user.firstName}</strong></li>
			</ul>
		</div>

	</div>
	<!-- /.row -->

	<!-- Related Projects Row -->
	<h3 class="my-4">Related Products</h3>

	<div class="row">
		<c:forEach items="${products}" var="prod" end="7">
			<div class="col-md-3 col-sm-4 col-xs-12 related-products">
				<a
					href="${contextRoot}/products/${prod.category.name}/${prod.productCode}/${prod.productId}">
					<img class="img-fluid" src="${images}/${prod.productCode}.jpg"
					alt="${prod.name}"><br> <a
					href="${contextRoot}/products/${prod.category.name}/${prod.productCode}/${prod.productId}">${prod.name}
				</a> <br>
					<p>Rating - <c:choose>
						<c:when test="${prod.rating eq 5}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
						</c:when>
						<c:when test="${prod.rating ge 4 and prod.rating lt 5}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star"></span>
						</c:when>
						<c:when test="${prod.rating ge 3 and  prod.rating lt 4}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
						</c:when>
						<c:when test="${prod.rating ge 2 and prod.rating lt 3}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star"></span>
						</c:when>
						<c:when test="${prod.rating ge 1 and prod.rating lt 2}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star"></span>
						</c:when>
						<c:otherwise>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star "></span>
							<span class="fa fa-star"></span>
						</c:otherwise>
					</c:choose>
					<p>
			</div>

		</c:forEach>
	</div>
	<!-- /.row -->

</div>
<br>
<!-- /.container -->