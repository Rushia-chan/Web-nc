<?php
require_once('database/dbhelper.php');

?>

<!DOCTYPE html>
<html>

<head>
    <title>Quản lý giỏ hàng</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    <!-- summernote -->
    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>

<body>
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link" href="category/index.php">Thống kê</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="category/index.php">Quản lý danh mục</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="product/">Quản lý sản phẩm</a>
        </li>
        <li class="nav-item ">
            <a class="nav-link active" href="dashboard.php">Quản lý giỏ hàng</a>
        </li>
    </ul>

    <form action="" method="POST">
        <table class="table table-bordered table-hover">
            <thead>
                <tr style="font-weight: 500;text-align: center;">
                    <td width="50px">STT</td>
                    <td width="200px">Tên User</td>
                    <td>Tên Sản Phẩm/<br>Số lượng</td>
                    <td>Tổng tiền</td>
                    <td width="250px">Địa chỉ</td>
                    <td>Số điện thoại</td>
                    <td>Trạng thái</td>
                    <!-- <td width="50px">Lưu</td> -->
                </tr>
            </thead>
            <tbody>
                <?php
                try {
                    if (isset($_GET['order_id'])) {
                        $order_id = $_GET['order_id'];
                    } else {
                        $order_id = 0;
                    }

                    $count = 0;
                    $sql = "SELECT * FROM orders, order_details, product
                            WHERE order_details.order_id = orders.id 
                            AND product.id = order_details.product_id 
                            AND order_id = $order_id";

                    $order_details_List = executeResult($sql);

                    foreach ($order_details_List as $item) {
                        // Hiển thị dữ liệu trong bảng
                    }
                } catch (Exception $e) {
                    die("Lỗi thực thi sql: " . $e->getMessage());
                }
                ?>
            </tbody>
        </table>
        <a href="dashboard.php" class="btn btn-warning">Quay lại</a>
    </form>

    <?php
    if ($_SERVER['REQUEST_METHOD'] == "POST") {
        $status = $_POST['status'];
        $sql = "UPDATE `order_details` SET `status` = '$status' WHERE `order_id` = $order_id";
        execute($sql);
        echo '<script language="javascript">
                    alert("Cập nhật thành công!");
                    window.location = "dashboard.php";
                 </script>';
    }
    ?>
</body>
<style>
.b-500 {
    font-weight: 500;
}

.red {
    color: red;
}
</style>

</html>