<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
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
            background-color: #ece5f3;
            color: #333;
        }
        
        /* Container */
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(96, 76, 139, 0.2);
            border: 2px solid #d1c4e9;
        }
        
        /* Heading */
        h1 {
            text-align: center;
            color: #6a0dad;
            margin-bottom: 20px;
            font-weight: bold;
        }
        
        /* Profile Info */
        .profile-info {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .profile-pic {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 3px solid #b39ddb;
            margin-bottom: 15px;
        }
        
        /* Paragraphs */
        p {
            font-size: 18px;
            line-height: 1.5;
            color: #4b0082;
        }
        
        /* Button Group */
        .button-group {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
        }
        
        /* Buttons */
        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            transition: background 0.3s ease;
            color: #fff;
            font-weight: bold;
            box-shadow: 0 5px 15px rgba(96, 76, 139, 0.2);
        }
        
        .btn-warning {
            background-color: #b39ddb;
        }
        
        .btn-warning:hover {
            background-color: #9575cd;
        }
        
        .btn-secondary {
            background-color: #d1c4e9;
            color: #4b0082;
        }
        
        .btn-secondary:hover {
            background-color: #b39ddb;
            color: #fff;
        }

        /* Darker button for Home */
        .btn-home {
            background-color: #5e35b1; /* Darker purple */
            color: #fff;
        }
        
        .btn-home:hover {
            background-color: #4527a0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>โปรไฟล์ของฉัน</h1>
        
        <div class="profile-info">
            <c:choose>
        		<c:when test="${not empty user.urlPic}">
            		<img src="${user.urlPic}" alt="Profile Picture" class="profile-pic">
        		</c:when>
        		<c:otherwise>
            		<img src="https://notebookspec.com/web/wp-content/uploads/2015/01/kindsoffacebookprofilephotoswearesickofseeing1_1420801169.jpg" alt="Default Profile Picture" class="profile-pic">
        		</c:otherwise>
    		</c:choose>
            <p><strong>อีเมล:</strong> ${user.email}</p>
            <p><strong>ชื่อ-นามสกุล:</strong> ${user.name}</p>
            <p><strong>วันเกิด:</strong> ${user.birth}</p>
        </div>
        
        <div class="button-group">
            <a href="editProfile" class="btn btn-warning">แก้ไขโปรไฟล์</a>
            <a href="list_post" class="btn btn-secondary" style="transform: translateX(7px);">กระทู้ของฉัน</a>
            <a href="myComments" class="btn btn-warning">ความคิดเห็นของฉัน</a>
        </div>
        
        <form action="showHome" method="get" style="display: flex; justify-content: center; margin-top: 20px;">
            <button type="submit" class="btn btn-home">กลับไปหน้าหลัก</button>
        </form>
    </div>
</body>
</html>
