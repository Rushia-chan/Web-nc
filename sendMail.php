<?php session_start() ?>
<?php require_once('layout/header.php'); ?>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
</head>
<style>

    form {
        display: flex;
        flex-flow: column;
        justify-content: center;
        align-items: center;
    }

    .form-group {
        padding: 10px;
        width: 650px;
    }

    .form-group input {
        padding: 5px 0;
        width: 100%;
    }

    textarea {
        width: 100%;
    }

    button {
        padding: 10px 50px;
        border-radius: 5px;
        color: white;
        background-color: red;
        border: none;
        outline: 0;
    }

    button:hover {
        opacity: 0.7;
        cursor: pointer;
    }

    center {
        font-size: 20px;
        font-weight: bold;
        color: green;
        padding: 20px;
    }
</style>

<body>
    <h2 style="text-align: center; margin-top: 25px;">Hãy liên hệ với chúng tôi nếu các bạn gặp các vấn đề trên Website</h2>
    <form method="POST" action="">
        <div class="form-group">
            <label>Tên của bạn:</label>
            <input type="text" name="name" required="required" />
        </div>
        <div class="form-group">
            <label>Gửi đến gmail:</label>
            <input type="email" name="email" required="required" />
        </div>
        <div class="form-group">
            <label>Tên Email</label>
            <input type="text" name="subject" required="required" />
        </div>
        <div class="form-group">
            <label>Nội dung email</label>
            <textarea name="message" id="" cols="30" rows="10"></textarea>
        </div>
        <button name="send"> Send</button>
    </form>
    <?php
require 'PHPMailer-master/src/PHPMailer.php';
require 'PHPMailer-master/src/SMTP.php';
require 'PHPMailer-master/src/Exception.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $subject = $_POST['subject'];
    $message = $_POST['message'];

    $mail = new PHPMailer(true);

    try {
        // Cấu hình SMTP
        $mail->isSMTP();
        $mail->Host = 'your_smtp_host'; // Địa chỉ máy chủ SMTP của bạn
        $mail->SMTPAuth = true;
        $mail->Username = 'your_username'; // Tên người dùng SMTP
        $mail->Password = 'your_password'; // Mật khẩu SMTP
        $mail->SMTPAutoTLS = false; // Tắt tự động kích hoạt TLS
        $mail->SMTPSecure = false; // Không sử dụng giao thức bảo mật
        $mail->Port = 25; // Cổng kết nối SMTP

        // Thiết lập người gửi và địa chỉ email người gửi
        $mail->setFrom($email, $name);

        // Thiết lập người nhận và địa chỉ email người nhận
        $mail->addAddress('recipient_email@example.com', 'Recipient Name'); // Địa chỉ email và tên người nhận

        // Thiết lập nội dung email
        $mail->isHTML(true);
        $mail->Subject = $subject;
        $mail->Body = $message;

        $mail->send();
        echo '<center>Email đã được gửi thành công.</center>';
    } catch (Exception $e) {
        echo 'Email không thể được gửi. Lỗi: ', $mail->ErrorInfo;
    }
}
?>



    
</body>
<?php require_once('layout/footer.php'); ?>

</html>