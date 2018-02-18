<br>
<div class="container">
	<div class="row">
		<div class="col-xs-6" style="padding-right: 20px">
			<button type="button" class="btn btn-warning btn-xs"
				data-toggle="modal" data-target="#myCategoryModal">New
				Category</button>
		</div>
		<div class="col-xs-6">
			<!-- <button type="button" class="btn btn-warning btn-xs"
				data-toggle="modal" data-target="#myProductModal">New
				Product</button> -->
			<a href="${contextRoot}/manage/products/add"><button
					type="button" class="btn btn-warning btn-xs">New Product</button></a>
		</div>
	</div>



	<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>



	<!-- Modal -->
	<div class="modal fade" id="myCategoryModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">New Category</h4>
				</div>
				<div class="modal-body">

					<sf:form id="categoryForm" class="form-horizontal"
						modelAttribute="category" action="${contextRoot}/manage/category"
						method="POST">

						<div class="form-group">
							<label class="control-label col-md-4" style="padding-left: 0">Name</label>
							<div class="row">
								<div class="col-md-12 validate">
									<sf:input type="text" path="name" class="form-control"
										placeholder="Category Name" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4" style="padding-left: 0">Description</label>
							<div class="row">
								<div class="col-md-12 validate">
									<sf:textarea path="description" class="form-control"
										placeholder="Enter category description here!" />
								</div>
							</div>
						</div>


						<div class="form-group">
							<div class="row">
								<div class="col-md-8"></div>
								<div class="col-md-4">
									<input type="submit" name="submit" value="Save"
										class="btn btn-primary btn-block" />
								</div>
							</div>
						</div>
					</sf:form>
				</div>
			</div>
		</div>
	</div>

	<!-- Edit product Modal -->
	<div class="modal fade" id="myProductModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Edit Product</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
					<label class="control-label col-md-4" style="padding-left: 0">Name</label>
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<input type="text" name="name" class="form-control"
								placeholder="Product Name" />
							<div class="help-block" class="em"></div>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-md-4" style="padding-left: 0">Description</label>
					<div class="col-md-12 col-lg-12">
						<div class="row">
							<textarea name="description" class="form-control"
								placeholder="Enter your description here!"></textarea>
							<div class="help-block em"></div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label" style="padding-left: 0">UnitPrice</label>
							<div class="row">
								<div class="col-md-12">
									<input type="number" name="unitPrice" class="form-control"
										placeholder="Enter Unit Price" />
									<div  class="help-block em"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label" style="padding-left: 0">Quantity</label>
							<div class="row">
								<div class="col-md-12">
									<input type="number" name="totalQuantity"
										class="form-control" placeholder="Enter Quantity" />
									<div class="help-block em" ></div>
								</div>
							</div>
						</div>
					</div>
				</div>





				<div class="form-group">
					<label class="control-label col-md-4" style="padding-left: 0">Category</label>
					<div class="row">
						<div class="col-md-12">
						<select name="category" class="form-control">
							<c:forEach items="${categories}" var="category">
								<option value="${category.categoryId}" class="dropdown-item">${category.name}</option>
							</c:forEach>
						</select>


								<div class="text-right">
									<br />


								</div>
							</div>

					</div>

				</div>


				<div class="form-group">
					<div class="row">
						<div class="col-lg-8"></div>
						<div class="col-lg-4">
							<input type="button" name="Submit" value="Save"
								class="btn btn-primary btn-block" />

						</div>
					</div>
				</div>
				
				</div>
			</div>
			
		</div>

	</div>




	<hr />
	<h1>Available Products</h1>
	<hr />

	<div class="row">


		<div class="table-responsive">

			<table id="productsTable" class="table table-striped table-borderd">


				<thead>

					<tr>
						<th></th>
						<th>ID</th>
						<th>Name</th>
						<th>Rating</th>
						<th>Qty. Available</th>
						<th>Price</th>
						<th>Activate</th>
						<th></th>

					</tr>

				</thead>


			</table>

		</div>

	</div>
</div>