<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post List</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body */
        body {
            font-family: Arial, sans-serif;
            background-color: #ece5f3; /* Light purple background */
            color: #4b0082; /* Dark purple text */
            padding: 20px;
        }

        /* Container */
        .container {
            width: 100%;
            padding: 20px;
            border-radius: 8px;
            background-color: #fff;
            border: 2px solid #d1c4e9; /* Light purple border */
            box-shadow: 0 4px 15px rgba(96, 76, 139, 0.2); /* Softer shadow */
        }

        /* Heading */
        h1 {
            text-align: center;
            color: #6a0dad;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* Table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        /* Table Header */
        thead th {
            background-color: #6a0dad; /* Purple */
            color: white;
            padding: 12px;
            text-align: left;
            font-size: 16px;
        }

        /* Table Cells */
        tbody td {
            border: 1px solid #ddd;
            padding: 10px;
            vertical-align: top;
        }

        /* Buttons */
        .btn {
            display: inline-block;
            padding: 8px 16px;
            border-radius: 5px;
            text-decoration: none;
            color: #fff;
            font-size: 14px;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        .btn-primary {
            background-color: #9575cd; /* Soft purple */
        }

        .btn-warning {
            background-color: #ffb74d; /* Orange */
        }

        .btn-danger {
            background-color: #e57373; /* Soft red */
        }

        .btn:hover {
            opacity: 0.9;
        }

        /* Images */
        .post-image {
            max-width: 100px;
            height: auto;
            border-radius: 5px;
        }

        /* No Posts Message */
        .no-posts {
            text-align: center;
            color: #666;
            font-size: 18px;
            margin-top: 20px;
        }

        /* Responsive Design */
        @media screen and (max-width: 768px) {
            .container {
                width: 100%;
                padding: 15px;
            }

            table {
                font-size: 14px;
            }

            .post-image {
                max-width: 80px;
            }

            .btn {
                font-size: 12px;
            }
        }
        .button{
        	margin-top:20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>รายการกระทู้ของฉัน</h1>
        <table>
            <thead>
                <tr>
                    <th>หัวข้อ</th>
                    <th>เนื้อหา</th>
                    <th>รูป</th>
                    <th>วันที่สร้างกระทู้</th>
                    <th>ทำรายการ</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty user.posts}">
                        <c:forEach var="post" items="${user.posts}">
                            <tr>
                                <td>${post.title}</td>
                                <td>${post.content}</td>
                                <td>
                                    <c:if test="${not empty post.imageUrl}">
                                        <img src="${post.imageUrl}" alt="Post Image" class="post-image"/>
                                    </c:if>
                                    <c:if test="${empty post.imageUrl}">
                                        <p>ไม่มีรูปภาพ</p>
                                    </c:if>
                                </td>
                                <td>${post.createdDate.time}</td>
                                <td>
                                    <a href="editPost?id=${post.id}" class="btn btn-warning">แก้ไข</a>
                                    <a href="deletePost?id=${post.id}" onclick="return confirm('ต้องการลบกระทู้อันนี้?')" class="btn btn-danger">ลบ</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="5" class="no-posts">ยังไม่มีโพสต์</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
        <div class ="button">
	        <a href="open_createPost" class="btn btn-primary">สร้างกระทู้ใหม่</a>
	        <a href="profile" class="btn btn-primary">กลับไปหน้าโปรไฟล์</a>
        </div>
    </div>
</body>
</html>

