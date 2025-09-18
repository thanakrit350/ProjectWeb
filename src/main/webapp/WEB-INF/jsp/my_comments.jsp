<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Comments</title>
    <style>
        /* Container */
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(76, 50, 112, 0.2); /* Soft shadow */
            border: 2px solid #d1c4e9;
        }

        /* Heading */
        h1 {
            text-align: center;
            color: #6a1b9a;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* Table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
            font-size: 16px;
            color: #4b0082;
        }

        /* Table Headers */
        table th {
            background-color: #9575cd;
            color: white;
        }

        /* No Comments Message */
        .no-comments {
            text-align: center;
            color: #6a1b9a;
            font-size: 18px;
            margin-top: 20px;
        }

        /* Button Styles */
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #7e57c2;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 0px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #673ab7;
        }

        /* Danger Button for Delete */
        .btn-danger {
            background-color: #e57373;
            color: white;
        }

        .btn-danger:hover {
            background-color: #d32f2f;
        }
        .home{
        	margin-top:10px
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>ความคิดเห็นของฉัน</h1>
        
        <c:if test="${not empty comments}">
            <table>
                <thead>
                    <tr>
                        <th>โพสต์</th>
                        <th>ความคิดเห็น</th>
                        <th>วันที่แสดงความคิดเห็น</th>
                        <th>ลบความคิดเห็น</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="comment" items="${comments}">
                        <tr>
                            <td>${comment.post.title}</td>
                            <td>${comment.text}</td>
                            <td>${comment.createdDate.time}</td>
                            <td>
                                <a href="deleteComment?id=${comment.id}" 
                                   class="btn btn-danger" 
                                   onclick="return confirm('คุณต้องการลบความคิดเห็นนี้หรือไม่?')">ลบ</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        
        <c:if test="${empty comments}">
            <p class="no-comments">คุณยังไม่มีความคิดเห็น</p>
        </c:if>
		<div class="home">
        	<a href="profile" class="btn">ย้อนกลับไปที่โปรไฟล์</a>
        </div>
    </div>
</body>
</html>
