<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - หน้าหลัก</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        .container {
            max-width: 800px;
            margin: 100px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            font-size: 2em;
            color: #3d3154;
            margin-bottom: 20px;
        }

        .btn-manage-users {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            text-decoration: none;
            display: block;
            margin: 10px auto;
            width: 60%; /* Adjust button width */
        }

        .btn-manage-users:hover {
            background-color: #0056b3;
        }
        .btn-logout {
            padding: 10px 20px;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            text-decoration: none;
            display: block;
            margin: 10px auto;
            width: 60%; /* Adjust button width */
        }

        .btn-logout:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>ยินดีต้อนรับ, ${user.name}</h1>
        <hr>
        <p>ระบบจัดการผู้ใช้</p>
        <a href="manageUserPosts" class="btn btn-manage-users">จัดการโพสต์</a>
        <a href="manageUserComments" class="btn btn-manage-users">จัดการคอมเมนต์</a>   
        <a href="manageUsers" class="btn btn-manage-users">จัดการผู้ใช้</a>
        <a href="logout" class="btn-logout">ออกจากระบบ</a>
    </div>
</body>
</html>
