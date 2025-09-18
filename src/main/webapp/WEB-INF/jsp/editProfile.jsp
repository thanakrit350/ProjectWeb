<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ece5f3; /* Light purple background */
            margin: 0;
            padding: 20px;
            color: #4b0082; /* Dark purple text */
        }

        .form-container {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(96, 76, 139, 0.2);
            padding: 25px;
            max-width: 450px;
            margin: auto;
            border: 2px solid #d1c4e9; /* Light purple border */
        }

        h2 {
            text-align: center;
            color: #6a0dad; /* Purple title */
            font-weight: bold;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #6a0dad; /* Purple label text */
            font-weight: bold;
        }

        input[type="email"],
        input[type="text"],
        input[type="date"],
        input[type="url"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #b39ddb;
            border-radius: 6px;
            color: #4b0082; /* Dark purple text in inputs */
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #9575cd; /* Soft purple button */
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 6px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
            box-shadow: 0 3px 10px rgba(96, 76, 139, 0.2); /* Soft button shadow */
        }

        input[type="submit"]:hover {
            background-color: #6a0dad; /* Darker purple on hover */
        }

        /* Back to profile button */
        .btn-secondary {
            display: block;
            text-align: center;
            background-color: #d1c4e9; /* Lighter purple */
            color: #4b0082;
            text-decoration: none;
            padding: 12px;
            border-radius: 6px;
            margin-top: 15px;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn-secondary:hover {
            background-color: #b39ddb; /* Slightly darker purple on hover */
            color: #fff;
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
	
	        // ตรวจสอบฟิลด์ email
	        if (frm1.name.value == "") {
	            document.getElementById('nameError').innerHTML = "กรุณากรอกชื่อ-นามสกุล";
	            return false;
	        } else {
	            document.getElementById('nameError').innerHTML = ""; // เคลียร์ข้อความเมื่อกรอกครบ
	        }
	
	        if (frm1.dob.value == "") {
	            document.getElementById('dobError').innerHTML = "กรุณากรอกวันเกิด";
	            return false;
	        } else {
	            document.getElementById('dobError').innerHTML = ""; // เคลียร์ข้อความเมื่อกรอกครบ
	        }
	
	        return true; // ส่งฟอร์มถ้ากรอกข้อมูลครบ
	    }
	</script>
</head>
<body>
    <div class="form-container">
        <h2>แก้ไขโปรไฟล์</h2>
        <form action="updateProfile" method="post" onsubmit="return validateForm(this)">
            <label for="email">อีเมล:</label>
            <input type="email" id="email" name="email" value="${user.email}" readonly>

            <label for="name">ชื่อ-นามสกุล:</label>
            <p id="nameError" class="error"></p>
            <input type="text" id="name" name="name" value="${user.name}">


            <label for="dob">วันเกิด:</label>
            <p id="dobError" class="error"></p>
            <input type="date" id="dob" name="dob" value="${user.birth}">

            <label for="profileUrl">รูปภาพ URL (ถ้ามี):</label>
            <input type="url" id="profileUrl" name="profileUrl" value="${user.urlPic}">

            <input type="submit" value="แก้ไขโปรไฟล์">
        </form>

        <a href="profile" class="btn-secondary">กลับไปหน้าโปรไฟล์</a>
    </div>
</body>
</html>
