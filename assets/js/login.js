document.addEventListener("DOMContentLoaded", function () {
	const token = sessionStorage.getItem("auth_token");

	if (token) {
		window.location.href = "dashboard";
	}

	document
		.getElementById("login-form")
		.addEventListener("submit", function (e) {
			e.preventDefault();

			const username = document.getElementById("username").value;
			const password = document.getElementById("password").value;
			const captchaResponse = grecaptcha.getResponse();

			if (!username || !password || !captchaResponse) {
				document.getElementById("error-message").textContent =
					"Please fill in all fields and solve the CAPTCHA.";
				return;
			}

			const data = {
				username: username,
				password: password,
				recaptcha: captchaResponse,
			};

			fetch("/api/login", {
				method: "POST",
				headers: {
					"Content-Type": "application/json",
				},
				body: JSON.stringify(data),
			})
				.then((response) => response.json())
				.then((responseData) => {
					if (responseData.status === true) {
						sessionStorage.setItem("auth_token", responseData.data.token);
						sessionStorage.setItem("username", responseData.data.username);
						sessionStorage.setItem("role", responseData.data.role);

						window.location.href = "dashboard";
					} else {
						document.getElementById("error-message").textContent =
							responseData.message || "Login failed.";
					}
				})
				.catch((error) => {
					document.getElementById("error-message").textContent =
						"An error occurred. Please try again.";
				});
		});
});
