<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>สร้างกระทู้ใหม่</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ece5f3; /* สีพื้นหลังม่วงอ่อน */
            color: #333;
            margin: 0;
            padding: 0;
        }

        .form-container {
            width: 500px;
            margin: 50px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(96, 76, 139, 0.2);
            border: 2px solid #d1c4e9; /* ขอบสีม่วงอ่อน */
        }

        .form-container h2 {
            text-align: center;
            color: #6a0dad; /* สีม่วงสำหรับหัวข้อ */
            margin-bottom: 20px;
        }

        input[type="text"], input[type="url"], textarea {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            box-sizing: border-box;
            border: 1px solid #b39ddb; /* ขอบสีม่วงอ่อน */
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus, input[type="url"]:focus, textarea:focus {
            border-color: #6a0dad; /* ขอบสีม่วงเมื่อโฟกัส */
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #6a0dad; /* สีม่วงปุ่มหลัก */
            color: white;
            padding: 12px;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-weight: bold;
        }

        input[type="submit"]:hover {
            background-color: #5a0088; /* สีม่วงเข้มเมื่อชี้ */
        }

        .cancel-button {
            display: block;
            text-align: center;
            margin-top: 15px;
            padding: 12px;
            background-color: #d1c4e9; /* สีปุ่มยกเลิก */
            color: #4b0082;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .cancel-button:hover {
            background-color: #b39ddb; /* เปลี่ยนสีเมื่อชี้ */
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

    <div class="form-container">
        <h2>สร้างกระทู้ใหม่</h2>
        <p style="color:green">${mg}</p>
        <form action="createPost" method="POST" onsubmit="return validateForm(this)">
            <label for="title">หัวข้อ:</label>
            <p id="titleError" class="error"></p>
            <input type="text" id="title" name="title"> 

            <label for="content">เนื้อหา:</label>
            <p id="contentError" class="error"></p>
            <textarea id="content" name="content" rows="5" ></textarea>

            <label for="imageUrl">ลิงก์ของรูปภาพ (ถ้ามี):</label>
            <input type="url" id="imageUrl" name="imageUrl" placeholder="กรุณากรอก URL ของรูปภาพ (ถ้ามี)"> 

            <input type="submit" value="สร้างกระทู้">
            <a href="showHome" class="cancel-button">ยกเลิก</a>
        </form>
    </div>

</body>
</html>
