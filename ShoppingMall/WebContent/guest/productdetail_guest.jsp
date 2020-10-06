<%@page import="pack.product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="productMgr" class="pack.product.ProductMgr" />

<%
	String no = request.getParameter("no");
	ProductBean bean = productMgr.getProduct(no);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js">
	
</script>
</head>
<body>
	<%@include file="guest_top.jsp"%>
	<form action="cartproc.jsp">
		<div class="container bgwhite p-t-35 p-b-80">
			<div class="flex-w flex-sb">
				<div class="w-size13 p-t-30 respon5">
					<div class="wrap-slick3 flex-sb flex-w">
						<div class="wrap-slick3-dots"></div>

						<div class="slick3">
							<div class="item-slick3" data-thumb="images/thumb-item-01.jpg">
								<div class="wrap-pic-w">
									<img src="../images/<%=bean.getImage()%>" alt=<%=bean.getImage()%>>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="w-size14 p-t-30 respon5">
					<h4 class="product-detail-name m-text16 p-b-13"><%=bean.getName() %></h4>

					<span class="m-text17"> <%=bean.getPrice()%> </span>

					<!--  -->
					<div class="p-t-33 p-b-60">
						<div class="flex-m flex-w p-b-10">
							<div class="s-text15 w-size15 t-center">Size</div>

							<div class="rs2-select2 rs3-select2 bo4 of-hidden w-size16">
								<select class="selection-2" name="size">
									<option>Choose an option</option>
									<option>Size S</option>
									<option>Size M</option>
									<option>Size L</option>
									<option>Size XL</option>
								</select>
							</div>
						</div>

						<div class="flex-m flex-w">
							<div class="s-text15 w-size15 t-center">Color</div>

							<div class="rs2-select2 rs3-select2 bo4 of-hidden w-size16">
								<select class="selection-2" name="color">
									<option>Choose an option</option>
									<option>Gray</option>
									<option>Red</option>
									<option>Black</option>
									<option>Blue</option>
								</select>
							</div>
						</div>

						<div class="flex-r-m flex-w p-t-10">
							<div class="w-size16 flex-m flex-w">
								<div class="flex-w bo5 of-hidden m-r-22 m-t-10 m-b-10">
					
									<input class="size8 m-text18 t-center num-product"
										type="number" name="quantity" value="1">
								</div>

								<div
									class="btn-addcart-product-detail size9 trans-0-4 m-t-10 m-b-10">
									<!-- Button -->
									<input
								type="hidden" name="product_no" value="<%=bean.getNo()%>">
									<input type=submit
										class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4" value="Add to cart">
										
								</div>
							</div>
						</div>
					</div>


					<!--  -->
					<div
						class="wrap-dropdown-content bo6 p-t-15 p-b-14 active-dropdown-content">
								<h5 class="js-toggle-dropdown-content flex-sb-m cs-pointer m-text19 color0-hov trans-0-4">
						Description
						<i class="down-mark fs-12 color1 fa fa-minus dis-none" aria-hidden="true"></i>
						<i class="up-mark fs-12 color1 fa fa-plus" aria-hidden="true"></i>
					</h5>

					<div class="dropdown-content dis-none p-t-15 p-b-23">
						<p class="s-text8">
							<%=bean.getDetail() %>
						</p>
					</div>
					</div>

				</div>
			</div>
		</div>

	</form>
	<%@include file="guest_bottom.jsp"%>



	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- Container Selection -->
	<div id="dropDownSelect1"></div>
	<div id="dropDownSelect2"></div>



<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/select2/select2.min.js"></script>
	<script type="text/javascript">
		$(".selection-1").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});

		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect2')
		});
	</script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="vendor/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript">
		$('.block2-btn-addcart').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});

		$('.block2-btn-addwishlist').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");
			});
		});

		$('.btn-addcart-product-detail').each(function(){
			var nameProduct = $('.product-detail-name').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");
			});
		});
	</script>

<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>
