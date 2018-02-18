<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<div class="conatiner">
	<br>
	<c:if test="${not empty messege}">

		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-xs-12 col-md-6">
				<div class="alert alert-info">${messege}</div>
			</div>
		</div>
	</c:if>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">


			<sf:form class="form-horizontal" modelAttribute="product"
				action="${contextRoot}/manage/products/add" method="POST"
				enctype="multipart/form-data" >
				<div class="form-group">
					<label class="control-label col-md-4" style="padding-left: 0">Name</label>
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<sf:input type="text" path="name" class="form-control"
								placeholder="Product Name" />
							<sf:errors path="name" cssClass="help-block" element="em" />
						</div>
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-md-4" style="padding-left: 0">Description</label>
					<div class="col-md-12 col-lg-12">
						<div class="row">
							<sf:textarea path="description" class="form-control"
								placeholder="Enter your description here!" />
							<sf:errors path="description" cssClass="help-block" element="em" />
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label col-md-4" style="padding-left: 0">Unit
								Price</label>
							<div class="row">
								<div class="col-md-12">
									<sf:input type="number" path="unitPrice" class="form-control"
										placeholder="Enter Unit Price" />
									<sf:errors path="unitPrice" cssClass="help-block" element="em" />
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label col-md-4" style="padding-left: 0">Quantity</label>
							<div class="row">
								<div class="col-md-12">
									<sf:input type="number" path="totalQuantity"
										class="form-control" placeholder="Enter Quantity" />
									<sf:errors path="totalQuantity" cssClass="help-block"
										element="em" />
								</div>
							</div>
						</div>
					</div>
				</div>





				<div class="form-group">
					<label class="control-label col-md-4" style="padding-left: 0">Category</label>
					<div class="row">
						<div class="col-md-12">
							<sf:select path="categoryId" items="${categories}"
								itemLabel="name" itemValue="categoryId" class="form-control" />

							<div class="text-right">
								<br />
								<sf:hidden path="productId" />
								<sf:hidden path="productCode" />
								<%-- <sf:hidden path="supplierId"/> --%>


							</div>
						</div>

					</div>

				</div>

				<div class="form-group">
					<label class="control-label col-md-4">Upload a file</label>
					<div class="row">
						<div class="col-md-12">
							<sf:input type="file" path="productImage" class="form-control" />
							<sf:errors path="productImage" cssClass="help-block" element="em" />
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="row">
						<div class="col-lg-8"></div>
						<div class="col-lg-4">
							<input type="submit" name="submit" value="Save"
								class="btn btn-primary btn-block" />

						</div>
					</div>
				</div>
			</sf:form>



		</div>
	</div>

</div>