document.addEventListener("DOMContentLoaded", function () {
	const token = sessionStorage.getItem("auth_token");

	if (!token) {
		alert("You must login first.");
		window.location.href = "/";
		return;
	}

	const username = sessionStorage.getItem("username");
	const role = sessionStorage.getItem("role");

	const welcome = document.getElementById("welcome-text");
	if (welcome) {
		welcome.innerHTML = `Welcome, ${username || "User"}! <br>
			Username : ${username || "User"} <br>
			Role : ${role || "Unknown"}`;
	}

	// Logout
	const logoutButton = document.getElementById("logoutButton");
	if (logoutButton) {
		logoutButton.addEventListener("click", function () {
			sessionStorage.clear();
			window.location.href = "/";
		});
	}

	// Article
	// Hide add button for non-admin
	if (role === "Admin" || role === "Editor") {
		const addArticleButton = document.querySelector(".addArticleButton");
		if (addArticleButton) {
			addArticleButton.disabled = false;
		}
	}

	if (window.location.pathname.includes("/dashboard/article/edit/")) {
		const pathParts = window.location.pathname.split("/");
		const articleId = pathParts[pathParts.length - 1];

		if (articleId) {
			fetchArticleById(articleId);
			handleArticleUpdate(articleId);
		} else {
			alert("No article ID provided.");
			window.location.href = "/dashboard/article";
		}
	}

	// User
	if (role !== "Admin") {
		const addArticleButton = document.querySelector(".addUserButton");
		if (addArticleButton) {
			addArticleButton.disabled = true;
		}
	}

	// Article
	initSearchArticle();
	fetchArticles();
	createArticle();

	// User
	initSearchUser();
	fetchUsers();
});

// Article
let currentPage = 1;
let currentLimit = 10;
let currentTitle = "";
let currentCategory = "";

// User
let currentUsername = "";
let currentRole = "";

// Article
function initSearchArticle() {
	const searchForm = document.getElementById("searchForm");

	if (searchForm) {
		searchForm.addEventListener("submit", function (e) {
			e.preventDefault();

			currentTitle = document.getElementById("searchInput").value.trim();
			currentCategory = document.getElementById("categoryInput").value;

			currentPage = 1;
			fetchArticles(currentLimit, currentPage, currentTitle, currentCategory);
		});
	}
}

function fetchArticles(limit = 10, page = 1, title = "", category = "") {
	const token = sessionStorage.getItem("auth_token");
	const baseUrl = window.location.origin;

	fetch(
		`/api/article?limit=${limit}&page=${page}&title=${title}&category=${category}`,
		{
			headers: {
				Authorization: `Bearer ${token}`,
			},
		}
	)
		.then((res) => res.json())
		.then((response) => {
			if (response.status) {
				const tbody = document.querySelector("#articleTable tbody");
				if (!tbody) return;
				tbody.innerHTML = "";

				response.data.forEach((article, index) => {
					const tr = document.createElement("tr");

					tr.innerHTML = `
						<td>${(page - 1) * limit + index + 1}</td>
						<td>${article.title}</td>
						<td>${article.content}</td>
						<td>${article.category}</td>
						<td>
							${
								article.uploaded_file
									? `<a href="${baseUrl}/assets/uploads/${article.uploaded_file}" target="_blank">Download</a>`
									: "-"
							}
						</td>
						<td>${article.username}</td>
						<td>
							<button class="editArticleButton" onclick="window.location.href='${baseUrl}/dashboard/article/edit/${
						article.id
					}'" ${
						sessionStorage.getItem("role") !== "Admin" ? "disabled" : ""
					}>Edit</button>
							<button class="deleteArticleButton" onclick="deleteArticle(${article.id})" ${
						sessionStorage.getItem("role") !== "Admin" ? "disabled" : ""
					}>Delete</button>
						</td>
					`;

					tbody.appendChild(tr);
				});

				renderPaginationArticle(
					page,
					response.pagination.total_pages,
					limit,
					response.pagination.total_articles
				);
			} else {
				alert("Failed to load articles. " + response.message);
			}
		})
		.catch((err) => {
			alert("An error occurred while loading articles.");
			console.error(err);
		});
}

function renderPaginationArticle(currentPage, totalPages, limit, totalData) {
	const pagination = document.getElementById("pagination");
	pagination.innerHTML = "";

	pagination.insertAdjacentHTML(
		"beforeend",
		`<p>Showing ${currentPage} to ${totalPages} of ${totalData} entries | Showing ${limit} entries per page</p>`
	);

	for (let i = 1; i <= totalPages; i++) {
		const button = document.createElement("button");
		button.textContent = i;
		button.disabled = i === currentPage;
		button.addEventListener("click", () => {
			currentPage = i;
			fetchArticles(currentLimit, i, currentTitle, currentCategory);
		});
		pagination.appendChild(button);
	}
}

function createArticle() {
	const createForm = document.getElementById("createArticleForm");

	if (createForm) {
		createForm.addEventListener("submit", function (e) {
			e.preventDefault();

			const token = sessionStorage.getItem("auth_token");
			const formData = new FormData(createForm);

			const submitButton = createForm.querySelector("button[type='submit']");
			submitButton.disabled = true;

			const file = createForm.querySelector('input[type="file"]').files[0];
			if (file && file.size > 2 * 1024 * 1024) {
				alert("File is too large. Max 2MB allowed.");
				submitButton.disabled = false;
				return;
			}

			fetch("/api/article/store", {
				method: "POST",
				headers: {
					Authorization: `Bearer ${token}`,
				},
				body: formData,
			})
				.then((res) => res.json())
				.then((response) => {
					if (response.status) {
						alert("Article created successfully!");
						window.location.href = "/dashboard/article";
					} else {
						alert("Failed to create article: " + response.message);
						submitButton.disabled = false;
					}
				})
				.catch((err) => {
					alert("An error occurred while creating the article.");
					submitButton.disabled = false;
					console.error(err);
				});
		});
	}
}

function fetchArticleById(id) {
	const token = sessionStorage.getItem("auth_token");

	fetch(`/api/article/${id}`, {
		headers: {
			Authorization: `Bearer ${token}`,
		},
	})
		.then((res) => res.json())
		.then((response) => {
			if (response.status) {
				const article = response.data;

				document.getElementById("articleId").value = article.id;
				document.getElementById("title").value = article.title;
				document.getElementById("content").value = article.content;
				document.getElementById("category").value = article.category;
			} else {
				alert("Failed to fetch article.");
				window.location.href = "/dashboard/article";
			}
		})
		.catch((err) => {
			alert("Error fetching article.");
			console.error(err);
			window.location.href = "/dashboard/article";
		});
}

function handleArticleUpdate(id) {
	const form = document.getElementById("editArticleForm");

	form.addEventListener("submit", function (e) {
		e.preventDefault();

		const token = sessionStorage.getItem("auth_token");
		const formData = new FormData(form);

		fetch(`/api/article/update-post/${id}`, {
			method: "POST",
			headers: {
				Authorization: `Bearer ${token}`,
			},
			body: formData,
		})
			.then((res) => res.json())
			.then((response) => {
				if (response.status) {
					alert("Article updated successfully.");
					window.location.href = "/dashboard/article";
				} else {
					alert("Failed to update article: " + response.message);
					console.error(response);
				}
			})
			.catch((err) => {
				alert("Error updating article.");
				console.error(err);
			});
	});
}

function deleteArticle(id) {
	if (!confirm("Are you sure you want to delete this article?")) return;

	const token = sessionStorage.getItem("auth_token");

	fetch(`/api/article/delete/${id}`, {
		method: "DELETE",
		headers: {
			Authorization: `Bearer ${token}`,
		},
	})
		.then((res) => res.json())
		.then((data) => {
			alert(data.message);
			fetchArticles(currentLimit, currentPage, currentTitle, currentCategory);
		})
		.catch((err) => {
			alert("Failed to delete article.");
			console.error(err);
		});
}

// User
function initSearchUser() {
	const searchForm = document.getElementById("searchForm");

	if (searchForm) {
		searchForm.addEventListener("submit", function (e) {
			e.preventDefault();

			currentUsername = document.getElementById("searchInput").value.trim();
			currentRole = document.getElementById("roleInput").value;

			currentPage = 1;
			fetchUsers(currentLimit, currentPage, currentUsername, currentRole);
		});
	}
}

function fetchUsers(limit = 10, page = 1, username = "", role = "") {
	const token = sessionStorage.getItem("auth_token");
	const baseUrl = window.location.origin;

	fetch(
		`/api/user?limit=${limit}&page=${page}&username=${username}&role=${role}`,
		{
			headers: {
				Authorization: `Bearer ${token}`,
			},
		}
	)
		.then((res) => res.json())
		.then((response) => {
			if (response.status) {
				const tbody = document.querySelector("#userTable tbody");
				if (!tbody) return;
				tbody.innerHTML = "";

				response.data.forEach((user, index) => {
					const tr = document.createElement("tr");

					tr.innerHTML = `
						<td>${(page - 1) * limit + index + 1}</td>
						<td>${user.username}</td>
						<td>${user.role}</td>
						<td>
							<button class="editUserButton" onclick="window.location.href='${baseUrl}/dashboard/user/edit/${
						user.id
					}'" ${
						sessionStorage.getItem("role") !== "Admin" ? "disabled" : ""
					}>Edit</button>
							<button class="deleteUserButton" onclick="deleteUser(${user.id})" ${
						sessionStorage.getItem("role") !== "Admin" ? "disabled" : ""
					}>Delete</button>
						</td>
					`;

					tbody.appendChild(tr);
				});

				renderPaginationUser(
					page,
					response.pagination.total_pages,
					limit,
					response.pagination.total_users
				);
			} else {
				alert("Failed to load users. " + response.message);
			}
		})
		.catch((err) => {
			alert("An error occurred while loading users.");
			console.error(err);
		});
}

function renderPaginationUser(currentPage, totalPages, limit, totalData) {
	const pagination = document.getElementById("pagination");
	pagination.innerHTML = "";

	pagination.insertAdjacentHTML(
		"beforeend",
		`<p>Showing ${currentPage} to ${totalPages} of ${totalData} entries | Showing ${limit} entries per page</p>`
	);

	for (let i = 1; i <= totalPages; i++) {
		const button = document.createElement("button");
		button.textContent = i;
		button.disabled = i === currentPage;
		button.addEventListener("click", () => {
			currentPage = i;
			fetchUsers(currentLimit, i, currentTitle, currentRole);
		});
		pagination.appendChild(button);
	}
}
