<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />

    <title>Edit User</title>

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
        <h3>Edit User</h3>
        <form id="editUserForm" enctype="multipart/form-data">
            <div>
                <input type="hidden" id="userId" name="id" />
                <label>Username<span style="color: red;">*</span></label><br>
                <input type="text" name="username" id="username" required /><br><br>
            </div>

            <div>
                <label>Password<span style="color: red;">*</span></label><br>
                <input type="password" name="password" id="password" minlength="8" required /><br><br>
            </div>

            <div>
                <label>Role<span style="color: red;">*</span></label><br>
                <select name="role" id="role" required>
                    <option value="" disabled selected hidden>Select Role</option>
                    <option value="Admin">Admin</option>
                    <option value="Editor">Editor</option>
                    <option value="User">User</option>
                </select><br><br>
            </div>

            <p style="color: red;">* Required</p>

            <button type="submit">Submit</button>
        </form>
    </main>

    <script src="<?= base_url('assets/js/dashboard.js'); ?>"></script>
</body>

</html>