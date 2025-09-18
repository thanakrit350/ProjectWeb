<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>จัดการโพสต์ผู้ใช้</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #3d3154;
            color: white;
        }

        .btn-delete {
            padding: 5px 10px;
            background-color: #ff6600;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-delete:hover {
            background-color: #cc5200;
        }

        .btn-back {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
        }

        .btn-back:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function confirmDeletePost(postId) {
            return confirm('คุณแน่ใจหรือไม่ว่าต้องการลบโพสต์นี้?');
        }
    </script>
</head>
<body>
    <h1>จัดการโพสต์ผู้ใช้</h1>
    ${error}
    <table>
        <thead>
            <tr>
                <th>หัวข้อ</th>
                <th>เนื้อหา</th>
                <th>วันที่สร้าง</th>
                <th>ชื่อผู้โพสต์</th>
                <th>การจัดการ</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="post" items="${posts}">
                <tr>
                    <td>${post.title}</td>
                    <td>${post.content}</td>
                    <td>${post.createdDate.time}</td>
                    <td>${post.user.name}</td>
                    <td>
						<form action="deletePost" method="POST" onsubmit="return confirmDelete();">
						    <input type="hidden" name="id" value="${post.id}">
						    <button type="submit" class="btn-delete">ลบโพสต์</button>
						</form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a href="adminHome" class="btn-back">ย้อนกลับไปหน้า Admin Home</a>
</body>
</html>
