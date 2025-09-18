<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pantip</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        .header {
            background-color: #3d3154;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logo {
            font-size: 24px;
            font-weight: bold;
        }
        .search-bar {
            display: flex;
            align-items: center;
            margin-left: auto;
        }
        .search-bar input[type="text"] {
            width: 200px;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
            outline: none;
            margin-right: 10px;
        }
        .search-bar input[type="submit"],
        .search-bar input[type="button"] {
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        .search-bar input[type="submit"] {
            background-color: #800080;
            color: white;
        }
        .search-bar input[type="submit"]:hover {
            background-color: #6a006a;
        }
        .search-bar input[type="button"] {
            background-color: #ccc;
        }
        .search-bar input[type="button"]:hover {
            background-color: #bbb;
        }
        .user-actions {
            display: flex;
            align-items: center;
        }
        .user-actions a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            transition: color 0.3s;
        }
        .user-actions a:hover {
            color: #ff6600;
        }
        .container {
            display: flex;
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 10px;
        }
        .sidebar {
            width: 200px;
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }
        .sidebar ul li {
            margin-bottom: 10px;
        }
        .sidebar ul li a {
            text-decoration: none;
            color: #3d3154;
            transition: color 0.3s;
        }
        .sidebar ul li a:hover {
            color: #ff6600;
        }
        .main-content {
            flex-grow: 1;
            margin-left: 20px;
        }
        .topic {
            background-color: white;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .topic h2 {
            margin-top: 0;
            font-size: 1.5em;
            color: #3d3154;
        }
        .topic-meta {
            color: #666;
            font-size: 0.9em;
            margin-bottom: 10px;
        }
        .topic img {
            max-width: 100%;
            height: auto;
            margin-top: 10px;
            border-radius: 5px;
        }
        .comments {
            margin-top: 20px;
            border-top: 1px solid #ccc;
            padding-top: 10px;
        }
        .comments h3 {
            margin-bottom: 10px;
        }
        .comment-item {
            margin-bottom: 10px;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        .comment-item strong {
            display: block;
            color: #3d3154;
            margin-bottom: 5px;
        }
        .no-posts {
            text-align: center;
            font-size: 1.2em;
            color: #666;
            margin-top: 20px;
        }
		.like-button {
		    background: none;
		    border: none;
		    cursor: pointer;
		    padding: 0;
		    transform: translateY(6px); /* เลื่อนปุ่มไลค์ลงมา 10px */
		}
		
		.like-count {
		    margin-left: 10px;
		    font-size: 1em;
		    color: #3d3154;
		    transform: translateY(10px); /* เลื่อนตัวนับไลค์ลงมา 10px เช่นกัน */
		}

        .like-button img {
            width: 30px;
            height: 30px;
        }

    </style>
</head>
<body>
    <div class="header">
        <div class="logo">Panpee</div>
        <div class="search-bar">
            <form name="frm1" action="searchPostIndex" method="POST">
                <input type="text" name="keyword" placeholder="ค้นหาบน Panpee">
                <input type="submit" value="ค้นหา">
                <input type="button" value="รีเซ็ต" onclick="window.location.href='index';">
            </form>
        </div>
        <div class="user-actions">
            <a href="login">เข้าสู่ระบบ</a>
            <a href="reg">สมัครสมาชิก</a>
        </div>
    </div>
    <div class="container">
        <div class="sidebar">
            <ul>
                <li><a href="index">หน้าแรก</a></li>
                <li><a href="#" onclick="alert('ทำการเข้าสู่ระบบก่อนครับ');">สร้างกระทู้</a></li>
                <li><a href="ruleAdvice">กฎ กติกาและมารยาท</a></li>
                 <li><a href="postAdvice">คำแนะนำการโพสต์</a></li>
                 <li><a href="contract">ติดต่อเรา</a></li>
            </ul>
        </div>
        <div class="main-content">
            <c:if test="${not empty posts}">
                <c:forEach var="post" items="${posts}">
                    <div class="topic">
                        <h2>${post.title}</h2>
                        <div class="topic-meta">
                            โดย ${post.user.name} | วันที่สร้าง: ${post.createdDate.time}
                        </div>
                        <p>${post.content}</p>
                        <!-- แสดงรูปภาพถ้ามี -->
                        <c:if test="${not empty post.imageUrl}">
                            <img src="${post.imageUrl}" alt="รูปภาพที่เกี่ยวข้องกับโพสต์ ${post.title}">
                        </c:if>
						<form onsubmit="return likeAlert()">
						    <input type="hidden" name="postId" value="${post.id}">
						    <button type="submit" class="like-button">
						    	<img src="https://i.pinimg.com/474x/9b/92/2c/9b922cfb53582455947994310ee13cab.jpg" alt="Like"> <!-- รูป like เมื่อยังไม่กดไลค์ -->
						    </button>
						    <span class="like-count">${post.likeCount}</span>
						</form>
                        <!-- แสดงความคิดเห็นสำหรับโพสต์นี้ -->
                        <div class="comments">
                            <h3>ความคิดเห็น</h3>
                            <c:if test="${not empty post.comments}">
                                <ul>
                                    <c:forEach var="comment" items="${post.comments}">
                                        <li class="comment-item">
                                            <strong>ความคิดเห็นโดย ${comment.post.user.name} เมื่อ ${comment.createdDate.time}</strong>
                                            <p>- ${comment.text}</p>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </c:if>
                            <c:if test="${empty post.comments}">
                                <p>ยังไม่มีความคิดเห็น</p>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty posts}">
                <p class="no-posts">ยังไม่มีโพสต์</p>
            </c:if>
        </div>
    </div>
    <script>
		function likeAlert() {
    		alert('คุณต้องเข้าสู่ระบบเพื่อกดไลค์');
    		return false;  // เพื่อป้องกันการส่งฟอร์ม
		}
	</script>
</body>
</html>
