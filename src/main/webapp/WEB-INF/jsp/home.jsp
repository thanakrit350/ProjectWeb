<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pantip - หน้าหลัก</title>
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
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .user-menu {
            display: flex;
            align-items: center;
        }

        .user-menu a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            transition: color 0.3s ease;
        }

        .user-menu a:hover {
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
            font-weight: bold;
            transition: color 0.3s ease;
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

        .comments-section {
            margin-top: 20px;
            border-top: 1px solid #ccc;
            padding-top: 10px;
        }

        .comments-section h3 {
            margin-bottom: 10px;
            font-size: 1.2em;
            color: #3d3154;
        }

        .comment {
            margin-bottom: 10px;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        .comment-item {
            margin-bottom: 10px;
            padding: 10px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        .comment strong {
            color: #3d3154;
            display: block;
            margin-bottom: 5px;
        }

        .comment-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
            resize: vertical;
            background-color: #f7f7f7;
        }

        .comment-form input[type="submit"] {
            padding: 10px 20px;
            background-color: #800080;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .comment-form input[type="submit"]:hover {
            background-color: #6a006a;
        }

        .no-posts {
            text-align: center;
            font-size: 1.2em;
            color: #666;
            margin-top: 20px;
        }

        .search-container {
            display: flex;
            align-items: center;
            margin-left: auto;
        }

        .search-container input[type="text"] {
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
            outline: none;
            margin-right: 10px;
            flex-grow: 1;
        }

        .search-container input[type="submit"],
        .search-container input[type="button"] {
            padding: 8px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .search-container input[type="submit"] {
            background-color: #800080;
            color: white;
        }

        .search-container input[type="submit"]:hover {
            background-color: #6a006a;
        }

        .search-container input[type="button"] {
            background-color: #ccc;
        }

        .search-container input[type="button"]:hover {
            background-color: #bbb;
        }

        /* Responsive styling */
        @media screen and (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                margin-bottom: 20px;
            }

            .main-content {
                margin-left: 0;
            }
        }

        /* Like button styling */
        .like-container {
		    display: flex;
		    align-items: center; /* จัดกึ่งกลางตามแนวตั้ง */
		    margin-top: 10px; /* เพิ่มระยะห่างจากด้านบน */
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
        <div class="search-container">
            <form name="frm1" action="searchPostHome" method="POST">
                <input type="text" name="keyword" placeholder="ค้นหาบน Panpee">
                <input type="submit" value="ค้นหา">
                <input type="button" value="รีเซ็ต" onclick="window.location.href='showHome';">
            </form>
        </div>
        <div class="user-menu">
            <span>ยินดีต้อนรับ, ${user.name}</span>
            <a href="profile">ดูโปรไฟล์</a>
            <a href="open_createPost">สร้างกระทู้</a>
            <a href="logout">ออกจากระบบ</a>
        </div>
    </div>
    
    <div class="container">
        <div class="sidebar">
            <ul>
                <li><a href="showHome">หน้าแรก</a></li>
                <li><a href="open_createPost">สร้างกระทู้</a></li>
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
                        
                        <!-- การแสดงรูปภาพ -->
                        <c:if test="${not empty post.imageUrl}">
                            <img src="${post.imageUrl}" alt="${post.title}" style="max-width:100%; height:auto;">
                        </c:if>

                        <!-- ปุ่มกดไลค์และการแสดงยอดไลค์ -->
                        <div class="like-container">
							<form action="toggleLikePost" method="POST">
							    <input type="hidden" name="postId" value="${post.id}">
							    <button type="submit" class="like-button">
							        <!-- ตรวจสอบว่าผู้ใช้กดไลค์โพสต์นี้หรือยัง -->
							    	<img src="https://i.pinimg.com/474x/9b/92/2c/9b922cfb53582455947994310ee13cab.jpg" alt="like"> <!-- รูป unlike เมื่อกดไลค์แล้ว -->
							    </button>
							    <span class="like-count">${post.likeCount}</span> <!-- ใช้ likeCount ตามเดิม -->
							</form>
						</div>


                        <!-- ส่วนการแสดงความคิดเห็น -->
                        <div class="comments-section">
                            <h3>ความคิดเห็น</h3>
                            <c:if test="${not empty post.comments}">
                                <c:forEach var="comment" items="${post.comments}">
                                        <li class="comment-item">
                                            <strong>ความคิดเห็นโดย ${comment.post.user.name} เมื่อ ${comment.createdDate.time}</strong>
                                            <p>- ${comment.text}</p>
                                        </li>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty post.comments}">
                                <p>ยังไม่มีความคิดเห็น</p>
                            </c:if>
                        
                            <!-- ฟอร์มเพิ่มความคิดเห็น -->
                            <div class="comment-form">
                                <form action="addComment" method="POST">
                                    <input type="hidden" name="postId" value="${post.id}">
                                    <textarea name="commentText" placeholder="เขียนความคิดเห็นของคุณ" rows="4" required></textarea>
                                    <input type="submit" value="แสดงความคิดเห็น">
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty posts}">
                <p class="no-posts">ยังไม่มีโพสต์</p>
            </c:if>
        </div>
    </div>
</body>
</html>
