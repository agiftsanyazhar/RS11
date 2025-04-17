<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />

    <title>Article</title>

    <link rel="stylesheet" href="<?= base_url('assets/css/dashboard.css'); ?>" />
</head>

<body>
    <div class="header">
        <h2 id="welcome-text">Welcome</h2>
        <button class="logout-button" id="logoutButton">Logout</button>
    </div>

    <div class="nav">
        <a href="<?= base_url('dashboard'); ?>">Dashboard</a>
        <a href="<?= base_url('dashboard/article'); ?>">Article</a>
        <a href="<?= base_url('dashboard/user'); ?>">User</a>
    </div>

    <main>
        <h3>Article</h3>

        <div class="top-bar">
            <button class="addArticleButton" onclick="window.location.href='<?= base_url('dashboard/article/create'); ?>'" disabled>+ Add Article</button>

            <form id="searchForm">
                <input type="text" id="searchInput" placeholder="Search article..." />
                <select id="categoryInput">
                    <option value="">All Categories</option>
                    <option value="Kesehatan">Kesehatan</option>
                    <option value="Pendidikan">Pendidikan</option>
                    <option value="Teknologi">Teknologi</option>
                </select>
                <button type="submit">Search</button>
            </form>
        </div>

        <table id="articleTable">
            <thead>
                <tr>
                    <th style="width: 5%;">#</th>
                    <th style="width: 10%;">Title</th>
                    <th style="width: 30%;">Content</th>
                    <th style="width: 10%;">Category</th>
                    <th style="width: 10%;">File</th>
                    <th style="width: 10%;">Created By</th>
                    <th style="width: 15%;">Actions</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>

        <div id="pagination" class="pagination"></div>
    </main>

    <script src="<?= base_url('assets/js/dashboard.js'); ?>"></script>
</body>

</html>