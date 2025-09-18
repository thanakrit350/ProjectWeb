<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="th">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>สมัครสมาชิก Panpee</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #ece5f3; /* พื้นหลังสีม่วงอ่อน */
        margin: 0;
        padding: 0;
        color: #333;
    }

    .container {
        max-width: 500px;
        margin: 50px auto;
        background-color: #ffffff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(96, 76, 139, 0.2); /* เงาอ่อน */
        border: 2px solid #d1c4e9; /* ขอบสีม่วงอ่อน */
    }

    h2 {
        color: #6a0dad; /* สีม่วงเข้มสำหรับหัวข้อ */
        text-align: center;
        margin-bottom: 20px;
        font-weight: bold;
    }

    form {
        display: flex;
        flex-direction: column;
    }

    label {
        margin-top: 10px;
        color: #4b0082; /* สีม่วงเข้ม */
        font-weight: bold;
    }

    input[type="text"], input[type="email"], input[type="password"], input[type="date"], input[type="url"] {
        padding: 12px;
        margin-top: 5px;
        border: 1px solid #b39ddb; /* ขอบสีม่วงอ่อน */
        border-radius: 5px;
        font-size: 16px;
        transition: border-color 0.3s ease;
    }

    input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus, input[type="date"]:focus, input[type="url"]:focus {
        border-color: #6a0dad; /* ขอบสีม่วงเข้มเมื่อโฟกัส */
        outline: none;
    }

    input[type="submit"] {
        background-color: #6a0dad; /* ปุ่มสีม่วง */
        color: white;
        padding: 12px;
        margin-top: 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #5a0088; /* สีม่วงเข้มขึ้นเมื่อชี้ */
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
        if (frm1.email.value == "") {
            document.getElementById('emailError').innerHTML = "กรุณากรอกอีเมล";
            return false;
        } else {
            document.getElementById('emailError').innerHTML = ""; // เคลียร์ข้อความเมื่อกรอกครบ
        }

        if (frm1.name.value == "") {
            document.getElementById('nameError').innerHTML = "กรุณากรอกชื่อ-นามสกุล";
            return false;
        } else {
            document.getElementById('nameError').innerHTML = ""; // เคลียร์ข้อความเมื่อกรอกครบ
        }
        
        // ตรวจสอบฟิลด์ password
        if (frm1.password.value == "") {
            document.getElementById('passwordError').innerHTML = "กรุณากรอกรหัสผ่าน";
            return false;
        } else {
            document.getElementById('passwordError').innerHTML = ""; // เคลียร์ข้อความเมื่อกรอกครบ
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
<div class="container">
    <h2>สมัครสมาชิก Panpee</h2>
    <form action="login" method="get" onsubmit="return validateForm(this)">    
        <label for="email">อีเมล:</label>
        <p id="emailError" class="error"></p>
        <input type="email" id="email" name="email">
        
        <label for="name">ชื่อ-นามสกุล:</label>
        <p id="nameError" class="error"></p>
        <input type="text" id="name" name="name">
        
        <label for="password">รหัสผ่าน:</label>
        <p id="passwordError" class="error"></p>
        <input type="password" id="password" name="password">
        
        <label for="dob">วันเกิด:</label>
        <p id="dobError" class="error"></p>
        <input type="date" id="dob" name="dob">
        
        <label for="profileUrl">URL รูปภาพโปรไฟล์ (ถ้ามี):</label>
        <input type="url" id="profileUrl" name="profileUrl">
        
        <input type="submit" value="สมัครสมาชิก">
    </form>
</div>
</body>
</html>
