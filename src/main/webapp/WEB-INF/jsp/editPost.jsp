<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Post</title>
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
            max-width: 600px;
            margin: 30px auto;
            padding: 30px;
            border-radius: 10px;
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

        /* Form labels */
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #4b0082;
        }

        /* Input fields */
        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        /* Focused input */
        input[type="text"]:focus,
        textarea:focus {
            border-color: #9575cd; /* Lavender focus */
            outline: none;
        }

        /* Submit Button */
        button {
            background-color: #9575cd; /* Lavender */
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        /* Hover effect */
        button:hover {
            background-color: #6a0dad; /* Darker lavender */
        }

        /* Back button */
        .back-btn {
            display: block;
            text-align: center;
            background-color: #b39ddb;
            color: white;
            padding: 12px;
            border-radius: 5px;
            margin-top: 10px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        /* Back button hover */
        .back-btn:hover {
            background-color: #9575cd;
        }

        /* Image preview */
        .image-preview {
            text-align: center;
            margin-bottom: 20px;
        }

        /* Image preview styling */
        .image-preview img {
            max-width: 100%;
            height: auto;
            border: 2px solid #d1c4e9; /* Light purple border */
            border-radius: 8px;
        }

        .image-preview p {
            font-size: 14px;
            color: #6a0dad;
        }
        .error {
	        color: red;
	        font-size: 0.9em;
	        text-align: center;
	        margin-top: 10px;
    	}
    </style>
    <script type="text/javascript">
	    function validateForm(frm1) {
	
	        // ตรวจสอบฟิลด์หัวข้อ
	        if (frm1.title.value.trim() == "") {
	            document.getElementById('titleError').innerHTML = "กรุณากรอกหัวข้อ";
	            frm1.title.focus();
	            return false;
	        } else {
	            document.getElementById('titleError').innerHTML = ""; // ลบข้อความเตือนเมื่อกรอกครบ
	        }
	
	        // ตรวจสอบฟิลด์เนื้อหา
	        if (frm1.content.value.trim() == "") {
	            document.getElementById('contentError').innerHTML = "กรุณากรอกเนื้อหา";
	            frm1.content.focus();
	            return false;
	        } else {
	            document.getElementById('contentError').innerHTML = ""; // ลบข้อความเตือนเมื่อกรอกครบ
	        }
	
	        return true; // ส่งฟอร์มเมื่อข้อมูลครบถ้วน
	    }
	</script>
</head>
<body>
    <div class="container">
        <h1>แก้ไขกระทู้</h1>
        <p style="color:red">${meg}</p>

        <!-- Image preview section -->
        <c:if test="${not empty post.imageUrl}">
            <div class="image-preview">
                <img src="${post.imageUrl}" alt="Post Image">
                <p>รูปปัจจุบัน</p>
            </div>
        </c:if>

        <form action="updatePost" method="post" onsubmit="return validateForm(this)">
            <input type="hidden" name="id" value="${post.id}"/>
            <div>
                <label for="title">หัวข้อ:</label>
                <p id="titleError" class="error"></p>
                <input type="text" id="title" name="title" value="${post.title}" >
            </div>
            <div>
                <label for="content">เนื้อหา:</label>
                <p id="contentError" class="error"></p>
                <textarea id="content" name="content" >${post.content}</textarea>
            </div>
            <div>
                <label for="profileUrl">URL รูปภาพโปรไฟล์ (ถ้ามี):</label>
                <textarea id="profileUrl" name="profileUrl">${post.imageUrl}</textarea>
            </div>
            <button type="submit">แก้ไขกระทู้</button>
        </form>
        <a href="list_post" class="back-btn">ย้อนกลับ</a>
    </div>
</body>
</html>
