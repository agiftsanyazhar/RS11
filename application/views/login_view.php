<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<title>Login</title>

	<link rel="stylesheet" href="<?= base_url('assets/css/login.css'); ?>">
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>

<body>
	<div class="login-container">
		<h2>Login</h2>
		<form id="login-form">
			<div class="form-group">
				<label for="username">Username</label>
				<input type="text" id="username" name="username" required>
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" id="password" name="password" minlength="8" required>
			</div>
			<div class="form-group">
				<div class="g-recaptcha" data-sitekey="6LfDFhQrAAAAACBX7WgFNu0A0_ISplh6yYggATNM"></div>
			</div>
			<button type="submit">Login</button>
			<div id="error-message" class="error-message"></div>
		</form>
	</div>

	<script src="<?= base_url('assets/js/login.js'); ?>"></script>
</body>

</html>