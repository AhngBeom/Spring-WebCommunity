<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Page Title - SB Admin</title>
<link href="/resources/css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<body class="bg-light">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Login</h3>
									<h5>
										<c:out value="${error }" />
									</h5>
									<h5>
										<c:out value="${logout }" />
									</h5>
								</div>

								<div class="card-body">
									<form method="post" action="/login">
										<div class="form-group">
											<label class="small mb-1" for="inputId">ID</label><input
												class="form-control py-4" id="inputId" name="username"
												type="text" placeholder="Enter Identification" />
										</div>
										<div class="form-group">
											<label class="small mb-1" for="inputPw">Password</label><input
												class="form-control py-4" id="inputPw" type="password"
												name="password" placeholder="Enter password" />
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox">
												<input class="custom-control-input"
													id="rememberPasswordCheck" type="checkbox" name="remember-me"/><label
													class="custom-control-label" for="rememberPasswordCheck">Remember
													password</label>
											</div>
										</div>
										<div
											class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
											<a class="small" href="/password">Forgot Password?</a>
											<button type="submit" class="btn btn-primary">Login</button>
										</div>
										<input type="hidden" name="${_csrf.parameterName }"
											value="${_csrf.token }">
									</form>
								</div>
								<div class="card-footer text-center">
									<div class="small">
										<a href="register.html">Need an account? Sign up!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="layoutAuthentication_footer">
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2019</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="/resources/js/scripts.js"></script>
</body>
</html>