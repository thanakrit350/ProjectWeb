<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="th">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>เข้าสู่ระบบ Panpee</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #ece5f3; /* สีพื้นหลังม่วงอ่อน */
        color: #333;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 500px;
        margin: 50px auto;
        background-color: #ffffff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(96, 76, 139, 0.2);
        border: 2px solid #d1c4e9; /* ขอบสีม่วงอ่อน */
    }

    h2 {
        color: #6a0dad; /* สีม่วงสำหรับหัวข้อ */
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
        color: #4b0082; /* สีม่วงเข้มสำหรับข้อความ */
        font-weight: bold;
    }

    input[type="email"], input[type="password"] {
        padding: 12px;
        margin-top: 5px;
        border: 1px solid #b39ddb; /* ขอบสีม่วงอ่อน */
        border-radius: 5px;
        font-size: 16px;
        transition: border-color 0.3s ease;
    }

    input[type="email"]:focus, input[type="password"]:focus {
        border-color: #6a0dad; /* ขอบสีม่วงเข้มเมื่อโฟกัส */
        outline: none;
    }

    input[type="submit"] {
        background-color: #6a0dad; /* สีม่วงปุ่มหลัก */
        color: white;
        padding: 12px;
        margin-top: 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
        font-weight: bold;
    }

    input[type="submit"]:hover {
        background-color: #5a0088; /* สีม่วงเข้มเมื่อชี้ */
    }

    .error {
        color: red;
        font-size: 0.9em;
        text-align: center;
        margin-top: 10px;
    }

    .register-link {
        text-align: center;
        margin-top: 15px;
    }

    .register-link a {
        color: #6a0dad; /* สีม่วงสำหรับลิงก์สมัครสมาชิก */
        text-decoration: none;
        font-weight: bold;
    }

    .register-link a:hover {
        text-decoration: underline;
    }
</style>
<script type="text/javascript">
    function validateForm(frm1) {

        // ตรวจสอบฟิลด์ email
        if (frm1.email.value == "") {
            document.getElementById('emailError').innerHTML = "* กรุณากรอกอีเมล";
            return false;
        } else {
            document.getElementById('emailError').innerHTML = ""; // เคลียร์ข้อความเมื่อกรอกครบ
        }

        // ตรวจสอบฟิลด์ password
        if (frm1.password.value == "") {
            document.getElementById('passwordError').innerHTML = "* กรุณากรอกรหัสผ่าน";
            return false;
        } else {
            document.getElementById('passwordError').innerHTML = ""; // เคลียร์ข้อความเมื่อกรอกครบ
        }

        return true; // ส่งฟอร์มถ้ากรอกข้อมูลครบ
    }
</script>

</head>
<body>
<div class="container">
    <h2>เข้าสู่ระบบ Panpee</h2>
	<form action="home" method="post" onsubmit="return validateForm(this)">
	    <p class="error">${error}</p>
	    <p class="error">${error1}</p>
	
	    <label for="email">อีเมล:</label>
	    <p id="emailError" class="error"></p>
	    <input type="email" id="email" name="email" placeholder="Email">
	
	    <label for="password">รหัสผ่าน:</label>
	    <p id="passwordError" class="error"></p>
	    <input type="password" id="password" name="password" placeholder="Password">
	
	    <input type="submit" value="เข้าสู่ระบบ">
	    <div class="register-link">
	        <a href="reg">สมัครสมาชิก</a>
	    </div>
	</form>
</div>
</body>
</html>
