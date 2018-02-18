// solving the active menu problem
var categories1 = [];
$(document)
		.ready(
				function() {
					// var categories = [];
					var categoryUrl = window.contextRoot + "/data/categories";
					console.log(categoryUrl);
					$.get(categoryUrl, function(data) {
						categories = data;

					});

					// To solve active menu problem
					switch (menu) {

					case 'Home':
						$('#home').addClass('active');
						break;
					case 'About Us':
						$('#about').addClass('active');
						break;
					case 'Contact Us':
						$('#contact').addClass('active');
						break;
					case 'All Products':
						$('#listProducts').addClass('active');
						break;
					case 'Manage Products':
						$('#manageProducts').addClass('active');
						break;
					case 'Shopping Cart':
						$('#userModel').addClass('active');
						break;
					default:
						$('#listProducts').addClass('active');
						$('#a_' + menu).addClass('active');
						break;
					}

					/* for fading out the alert message after 3 seconds */
					$alert = $('.alert');
					if ($alert.length) {
						setTimeout(function() {
							$alert.fadeOut('slow');
						}, 3000);
					}

					// code for jquery dataTable
					var $table = $('#productListTable');

					// execute the below code only where we have this table
					if ($table.length) {
						// console.log('Inside the table!');

						var jsonUrl = '';
						if (window.categoryId == ' ') {
							jsonUrl = window.contextRoot + '/data/products';
						} else {
							jsonUrl = window.contextRoot
									+ '/data/products/categories/'
									+ window.categoryId;
						}

						$table
								.DataTable({
									lengthMenu : [
											[ 3, 5, 10, -1 ],
											[ '3 Records', '5 Records',
													'10 Records', 'ALL' ] ],
									pageLength : 5,
									ajax : {
										url : jsonUrl,
										dataSrc : ''
									},
									columnDefs : [ {
										'max-width' : '20%',
										'targets' : 0
									} ],
									columns : [
											{
												data : 'productCode',
												bSortable : false,
												mRender : function(data, type,
														row) {

													return '<a href="'
													+ window.contextRoot
													+ '/products/'
													+ getCategoryName(row.categoryId)
													+ '/'
													+ row.productCode
													+ '/'
													+ row.productId
													+ '"><img src="'
															+ window.contextRoot
															+ '/resources/images/'
															+ data
															+ '.jpg" class="dataTableImg"/></a>';

												}
											},
											{
												data : 'name'
											},
											{
												data : 'rating',
												mRender : function(data, type,
														row) {

													return showRating(data);

												}
											},
											{
												data : 'unitPrice',
												mRender : function(data, type,
														row) {
													return '&#8377; ' + data
												}
											},
											{
												data : 'quantitiesAvailable',
												mRender : function(data, type,
														row) {

													if (data < 1) {
														return '<span style="color:red">Out of Stock!</span>';
													}

													return data;

												}
											},
											{
												data : 'productId',
												bSortable : false,
												mRender : function(data, type,
														row) {

													var str = '';
													str += '<a href="'
															+ window.contextRoot
															+ '/products/'
															+ getCategoryName(row.categoryId)
															+ '/'
															+ row.productCode
															+ '/'
															+ row.productId
															+ '" class="btn btn-primary"><span class="fa fa-eye"></span></a> &#160;';

													str += '<a href="'
															+ window.contextRoot
															+ '/manage/'
															+ data
															+ '/product" class="btn btn-warning"><span class="fa fa-cart-plus"></span></a>';

													return str;

												}

											} ]
								});
					}

					// list of all products for admin
					var $productsTable = $('#productsTable');

					if ($productsTable.length) {

						var jsonUrl = window.contextRoot + '/data/products/all';
						console.log(jsonUrl);

						$productsTable
								.DataTable({
									lengthMenu : [
											[ 10, 30, 50, -1 ],
											[ '10 Records', '30 Records',
													'50 Records', 'ALL' ] ],
									pageLength : 30,
									ajax : {
										url : jsonUrl,
										dataSrc : ''
									},
									columns : [
											{
												data : 'productCode',
												bSortable : false,
												mRender : function(data, type,
														row) {

													return '<a href="'
															+ window.contextRoot
															+ '/products/'
															+ getCategoryName(row.categoryId)
															+ '/'
															+ row.productCode
															+ '/'
															+ row.productId
															+ '"><img src="'
															+ window.contextRoot
															+ '/resources/images/'
															+ data
															+ '.jpg" class="dataTableImg"/></a>';

												}
											},
											{
												data : 'productId'
											},
											{
												data : 'name'
											},
											{
												data : 'rating',
												mRender : function(data, type,
														row) {

													return showRating(data);

												}
											},
											{
												data : 'quantitiesAvailable',
												mRender : function(data, type,
														row) {

													if (data < 1) {
														return '<span style="color:red">Out of Stock!</span>';
													}

													return data;

												}
											},
											{
												data : 'unitPrice',
												mRender : function(data, type,
														row) {
													return '&#8377; ' + data
												}
											},
											{
												data : 'active',
												bSortable : false,
												mRender : function(data, type,
														row) {
													var str = '';
													if (data) {
														str += '<label class="switch"> <input type="checkbox" value="'
																+ row.productId
																+ '" checked="checked">  <div class="slider round"> </div></label>';

													} else {
														str += '<label class="switch"> <input type="checkbox" value="'
																+ row.productId
																+ '">  <div class="slider round"> </div></label>';
													}

													return str;
												}
											},
											{
												data : 'productId',
												bSortable : false,
												mRender : function(data, type,
														row) {

													var str = '';
													str += '<button '
															+ '" class="btn btn-primary" data-toggle="modal" data-target="#myProductModal'
															+ data
															+ '"><i class="fa fa-edit"></i></button> &#160;';
													var temp1 = "";
													for (var i = 0; i < categories.length; i++) {
														if (row.categoryId == categories[i].categoryId)
															temp1 += '<option value="'
																	+ categories[i].categoryId
																	+ '" selected class="dropdown-item">'
																	+ categories[i].name
																	+ '</option>';
														else
															temp1 += '<option value="'
																	+ categories[i].categoryId
																	+ '" class="dropdown-item">'
																	+ categories[i].name
																	+ '</option>';
													}

													str += '<div class="modal fade" id="myProductModal'
															+ data
															+ '" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">'
															+ '<div class="modal-dialog" role="document">'
															+ '<div class="modal-content">'
															+ '<div class="modal-header">'
															+ '<button type="button" class="close" data-dismiss="modal" aria-label="Close">'
															+ '<span aria-hidden="true">&times;</span>'
															+ '</button>'
															+ '<h4 class="modal-title" id="myModalLabel">Edit Product</h4>'
															+ '</div>'
															+ '<div class="modal-body">'
															+ '<div class="form-group">'
															+ '<label class="control-label col-md-4" style="padding-left: 0">Name</label>'
															+ '<div class="row">'
															+ '<div class="col-md-12 col-lg-12">'
															+ '<input type="text" name="name" id="name'
															+ row.productId
															+ '" class="form-control"'
															+ 'placeholder="Product Name" value="'
															+ row.name
															+ '" />'
															+ '<div class="help-block" class="em"></div>'
															+ '</div>'
															+ '</div>'
															+ '</div>'
															+

															'<div class="form-group">'
															+ '<label class="control-label col-md-4" style="padding-left: 0">Description</label>'
															+ '<div class="col-md-12 col-lg-12">'
															+ '<div class="row">'
															+ '<textarea name="description" id="description'
															+ row.productId
															+ '" class="form-control"'
															+ 'placeholder="Enter your description here!" rows="4" cols="50">'
															+ row.description
															+ '</textarea>'
															+ '<div class="help-block em"></div>'
															+ '</div>'
															+ '</div>'
															+ '</div>'
															+

															'<div class="row">'
															+ '<div class="col-md-6">'
															+ '<div class="form-group">'
															+ '<label class="control-label" style="padding-left: 0">UnitPrice</label>'
															+ '<div class="row">'
															+ '<div class="col-md-12">'
															+ '<input type="number" id="unitPrice'
															+ row.productId
															+ '" name="unitPrice" class="form-control"'
															+ 'placeholder="Enter Unit Price" value="'
															+ row.unitPrice
															+ '"/>'
															+ '<div  class="help-block em"></div>'
															+ '</div>'
															+ '</div>'
															+ '</div>'
															+ '</div>'
															+ '<div class="col-md-6"><div class="form-group">'
															+ '<label class="control-label" style="padding-left: 0">Quantity</label>'
															+ '<div class="row"><div class="col-md-12">'
															+ '<input type="number" id="quantitiesAvailable'
															+ row.productId
															+ '" name="totalQuantity"'
															+ 'class="form-control" placeholder="Enter Quantity" value="'
															+ row.quantitiesAvailable
															+ '" />'
															+ '<div class="help-block em" ></div>'
															+ '</div>'
															+ '</div>'
															+ '</div>'
															+ '</div>'
															+ '</div>'
															+

															'<div class="form-group">'
															+ '<label class="control-label col-md-4" style="padding-left: 0">Category</label>'
															+ '<div class="row">'
															+ '<div class="col-md-12">'
															+ '<select name="category" id="category'
															+ row.productId
															+ '" class="form-control">'
															+ temp1
															+ '</select>'
															+

															'<div class="text-right">'
															+ '<br />'
															+

															'</div>'
															+ '</div>'
															+

															'</div>'
															+

															'</div>'
															+

															'<div class="form-group">'
															+ '<div class="row">'
															+ '<div class="col-lg-8"></div>'
															+ '<div class="col-lg-4">'
															+ '<input type="button" id="editproduct'
															+ row.productId
															+ '" onclick="edit('
															+ row.productId
															+ ')" name="Submit" value="Save"'
															+ 'class="btn btn-primary btn-block" />'
															+

															'</div>'
															+ '</div>'
															+ '</div>'
															+

															'</div>'
															+ '</div>'
															+

															'</div></div>';

													return str;
												}
											} ],

									initComplete : function() {
										var api = this.api();
										api
												.$(
														'.switch input[type="checkbox"]')
												.on(
														'change',
														function() {
															var dText = (this.checked) ? 'You want to activate the Product?'
																	: 'You want to de-activate the Product?';
															var checked = this.checked;
															var checkbox = $(this);
															debugger;
															bootbox
																	.confirm({
																		size : 'medium',
																		title : 'Product Activation/Deactivation',
																		message : dText,
																		callback : function(
																				confirmed) {
																			if (confirmed) {
																				$
																						.ajax({
																							type : 'GET',
																							url : window.contextRoot
																									+ '/manage/product/'
																									+ checkbox
																											.prop('value')
																									+ '/activation',
																							timeout : 100000,
																							success : function(
																									data) {
																								bootbox
																										.alert(data);
																							},
																							error : function(
																									e) {
																								bootbox
																										.alert('ERROR');
																								// display(e);
																							}
																						});
																			} else {
																				checkbox
																						.prop(
																								'checked',
																								!checked);
																			}
																		}
																	});
														});

										// To Update the Product
									}
								});
					}

				});

function edit(id) {
	var productId = id;
	var name = $('#name' + id).val();
	var description = $('#description' + id).val();
	var unitPrice = $('#unitPrice' + id).val();
	var quantitiesAvailable = $('#quantitiesAvailable' + id).val();
	var categoryId = $('#category' + id).val();
	/*
	 * console.log(name); console.log(description); console.log(unitPrice);
	 * console.log(quantitiesAvailable); console.log(categoryId);
	 */
	$.ajax({
		url : window.contextRoot + '/data/products',
		contentType : "application/json",
		data : JSON.stringify({
			"productId" : productId,
			"name" : name,
			"description" : description,
			"unitPrice" : unitPrice,
			"quantitiesAvailable" : quantitiesAvailable,
			"categoryId" : categoryId
		}),
		type : 'PUT',
		success : function(data) {
			bootbox.alert(data);

		}
	});
}

function getCategoryName(categoryId) {
	for (var i = 0; i < categories.length; i++) {
		if (categories[i].categoryId == categoryId) {
			console.log(categoryId);
			console.log(categories[i].name);
			return categories[i].name;
		}
	}
}

function showRating(rating) {
	var strRating = "";
	if (rating == 5) {
		strRating = '<span class="fa fa-star checked"></span>'
				+ '<span class="fa fa-star checked"></span>'
				+ '<span class="fa fa-star checked"></span>'
				+ '<span class="fa fa-star checked"></span>'
				+ '<span class="fa fa-star checked"></span>';
		return strRating;
	} else if (rating >= 4 && rating < 5) {
		strRating = '<span class="fa fa-star checked"></span>'
				+ '<span class="fa fa-star checked"></span>'
				+ '<span class="fa fa-star checked"></span>'
				+ '<span class="fa fa-star checked"></span>'
				+ '<span class="fa fa-star"></span>';
		return strRating;
	} else if (rating >= 3 && rating < 4) {
		strRating = '<span class="fa fa-star checked"></span>'
				+ '<span class="fa fa-star checked"></span>'
				+ '<span class="fa fa-star checked"></span>'
				+ '<span class="fa fa-star "></span>'
				+ '<span class="fa fa-star"></span>';
		return strRating;
	} else if (rating >= 2 && rating < 3) {
		strRating = '<span class="fa fa-star checked"></span>'
				+ '<span class="fa fa-star checked"></span>'
				+ '<span class="fa fa-star"></span>'
				+ '<span class="fa fa-star "></span>'
				+ '<span class="fa fa-star"></span>';
		return strRating;
	} else if (rating >= 1 && rating < 2) {
		strRating = '<span class="fa fa-star checked"></span>'
				+ '<span class="fa fa-star"></span>'
				+ '<span class="fa fa-star"></span>'
				+ '<span class="fa fa-star "></span>'
				+ '<span class="fa fa-star"></span>';
		return strRating;
	} else {
		strRating = '<span class="fa fa-star"></span>'
				+ '<span class="fa fa-star"></span>'
				+ '<span class="fa fa-star"></span>'
				+ '<span class="fa fa-star "></span>'
				+ '<span class="fa fa-star"></span>';
		return strRating;
	}
}