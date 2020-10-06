<%@page import="pack.product.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="productMgr" class="pack.product.ProductMgr" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>상품목록</title>
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/themify/themify-icons.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/elegant-font/html-css/style.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/noui/nouislider.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->

<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js">
</script>
</head>
<body>
	<%@include file="guest_top.jsp"%>
		<!-- Title Page -->
	<section class="bg-title-page p-t-50 p-b-40 flex-col-c-m" style="background-image: url(../images/login.jpg);">
		<h2 class="l-text2 t-center">
			NEW ARRIBALS
		</h2>
		<p class="m-text13 t-center">
			New Arrivals Women Collection 2018
		</p>
	</section>
	<section class="bgwhite p-t-55 p-b-65">
		<div class="container">
			<div class="row">
			<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
					<div class="leftbar p-r-20 p-r-0-sm">
						<!--  -->
						<h4 class="m-text14 p-b-7">
							Categories
						</h4>

						<ul class="p-b-54">
							<li class="p-t-4">
								<a href="productlist.jsp" class="s-text13 active1">
									All
								</a>
							</li>

							<li class="p-t-4">
								<a href="productlist_outer.jsp" class="s-text13">
									Outer
								</a>
							</li>

							<li class="p-t-4">
								<a href="productlist_top.jsp" class="s-text13">
									Top
								</a>
							</li>

							<li class="p-t-4">
								<a href="productlist_bottom.jsp" class="s-text13">
									Bottom
								</a>
							</li>

							<li class="p-t-4">
								<a href="productlist_shoes.jsp" class="s-text13">
									Shoes
								</a>
							</li>
						</ul>

					</div>
				</div>
				<!-- Product -->
				<div class="row">
					<%
						ArrayList<ProductBean> list = productMgr.getProductAll();
						for (ProductBean p : list) {
					%>
					<div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
						<!-- Block2 -->
						<div class="block2">
							<div
								class="block2-img wrap-pic-w of-hidden pos-relative block2-labelnew">
								<img src="../images/<%=p.getImage()%>" alt="IMG-PRODUCT">

								<div class="block2-overlay trans-0-4">
									<a href="#"
										class="block2-btn-addwishlist hov-pointer trans-0-4"> <i
										class="icon-wishlist icon_heart_alt" aria-hidden="true"></i> <i
										class="icon-wishlist icon_heart dis-none" aria-hidden="true"></i>
									</a>

									<div class="block2-btn-addcart w-size1 trans-0-4">
										<!-- Button -->
										<button onclick="javascript:productDetail_guest('<%=p.getNo()%>')"
											class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
											Show Detail</button>
									</div>
								</div>
							</div>

							<div class="block2-txt p-t-20">
								<a
									class="block2-name dis-block s-text3 p-b-5"
									href="javascript:productDetail_guest('<%=p.getNo()%>')"> <%=p.getName()%></a>
								<span class="block2-price m-text6 p-r-5"> <%=p.getPrice()%></span>
							</div>
						</div>
					</div>

				<%
							}
						%>
			</div>
		</div>
		</div>
	</section>

	<%@include file="guest_bottom.jsp"%>\
	<form action="productdetail_guest.jsp" name="detailFrm" method="post">
		<input type="hidden" name="no">
	</form>
</body>
<!--===============================================================================================-->
<script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript"
	src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="vendor/bootstrap/js/popper.js"></script>
<script type="text/javascript"
	src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="vendor/select2/select2.min.js"></script>
<script type="text/javascript">
	$(".selection-1").select2({
		minimumResultsForSearch : 20,
		dropdownParent : $('#dropDownSelect1')
	});

	$(".selection-2").select2({
		minimumResultsForSearch : 20,
		dropdownParent : $('#dropDownSelect2')
	});
</script>
<!--===============================================================================================-->
<script type="text/javascript"
	src="vendor/daterangepicker/moment.min.js"></script>
<script type="text/javascript"
	src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="vendor/slick/slick.min.js"></script>
<script type="text/javascript" src="js/slick-custom.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="vendor/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
	$('.block2-btn-addcart').each(
			function() {
				var nameProduct = $(this).parent().parent().parent().find(
						'.block2-name').html();
				$(this).on('click', function() {
					swal(nameProduct, "is added to cart !", "success");
				});
			});

	$('.block2-btn-addwishlist').each(
			function() {
				var nameProduct = $(this).parent().parent().parent().find(
						'.block2-name').html();
				$(this).on('click', function() {
					swal(nameProduct, "is added to wishlist !", "success");
				});
			});
</script>

<!--===============================================================================================-->
<script type="text/javascript" src="vendor/noui/nouislider.min.js"></script>
<script type="text/javascript">
	/*[ No ui ]
	===========================================================*/
	var filterBar = document.getElementById('filter-bar');

	noUiSlider.create(filterBar, {
		start : [ 50, 200 ],
		connect : true,
		range : {
			'min' : 50,
			'max' : 200
		}
	});

	var skipValues = [ document.getElementById('value-lower'),
			document.getElementById('value-upper') ];

	filterBar.noUiSlider.on('update', function(values, handle) {
		skipValues[handle].innerHTML = Math.round(values[handle]);
	});
</script>
<!--===============================================================================================-->
<script src="js/main.js"></script>

</html>