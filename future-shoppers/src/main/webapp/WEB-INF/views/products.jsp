<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid" style="width: 100%">

	<div class=row>

		<!-- SideBar -->
		<div class="col-lg-3">
		<c:import url="shared/sidebar.jsp" />
	</div>

		<div class="col-lg-9 col-xs-12">
			<c:if test="${userClicksAllProducts eq true}">

				<script type="text/javascript">
					window.categoryId = " ";
				</script>
				<!-- Showing all the products BREadcrumb -->

				<div class="breadcrumb"
					style="background-color: #fff; border: 0px solid white;">
					<a class="breadcrumb__step" href="${contextRoot}/">Home</a> <a
						class="breadcrumb__step breadcrumb__step--active"
						href="javscript:void(0)">All Products</a>
				</div>
				<hr>

			</c:if>

			<c:if test="${userClicksProductsByCategory eq true}">

				<script type="text/javascript">
					window.categoryId = "${category.name}";
				</script>
				<div class="breadcrumb"
					style="background-color: #fff; border: 0px solid white;">
					<a class="breadcrumb__step" href="${contextRoot}/">Home</a><a
						class="breadcrumb__step" href="${contextRoot}/products/all">All
						Products</a> <a class="breadcrumb__step breadcrumb__step--active"
						href="javscript:void(0)">${category.name}</a>
				</div>
				<hr>
			</c:if>

			<div class="row">

				
						<div class="table-responsive">

							<table id="productListTable"
								class="table table-striped table-borderd">


								<thead>

									<tr>
										<th></th>
										<th>Name</th>
										<th>Rating</th>
										<th>Price</th>
										<th>Qty. Available</th>
										<th></th>

									</tr>

								</thead>


							</table>
						
				</div>

			</div>

		</div>



	</div>

</div>