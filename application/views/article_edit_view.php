<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />

    <title>Edit Article</title>

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
        <h3>Edit Article</h3>
        <form id="editArticleForm" enctype="multipart/form-data">
            <div>
                <input type="hidden" id="articleId" name="id" />
                <label>Title<span style="color: red;">*</span></label><br>
                <input type="text" name="title" id="title" minlength="3" maxlength="255" required /><br><br>
            </div>

            <div>
                <label>Content<span style="color: red;">*</span></label><br>
                <textarea name="content" id="content" rows="5" cols="50" minlength="5" required></textarea><br><br>
            </div>

            <div>
                <label>Category<span style="color: red;">*</span></label><br>
                <select name="category" id="category" required>
                    <option value="" disabled selected hidden>Select Category</option>
                    <option value="Kesehatan">Kesehatan</option>
                    <option value="Pendidikan">Pendidikan</option>
                    <option value="Teknologi">Teknologi</option>
                </select><br><br>
            </div>

            <div>
                <label>File<span style="color: red;">*</span></label><br>
                <input type="file" name="uploaded_file" /><br>
                <small style="color: red;">File must be less than 2MB and in .jpg, .jpeg, .png, or .pdf format</small><br><br>
            </div>

            <p style="color: red;">* Required</p>

            <button type="submit">Submit</button>
        </form>
    </main>

    <script src="<?= base_url('assets/js/dashboard.js'); ?>"></script>
</body>

</html>