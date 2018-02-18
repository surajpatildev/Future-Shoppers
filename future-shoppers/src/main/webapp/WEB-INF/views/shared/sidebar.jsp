<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



	<h1 class="my-4">Categories</h1>
	<div class="list-group">
		
		<a href="${contextRoot}/products/all/" id="a_all" class="list-group-item">All Products</a>
		<c:forEach items="${categories}" var="category">

			<a href="${contextRoot}/products/${category.name}/" id="a_${category.name}" class="list-group-item">${category.name}</a>

		</c:forEach>

	</div>


<!-- /.col-lg-3 -->