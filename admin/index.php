<?php require_once('database/dbhelper.php'); ?>
<!DOCTYPE html>
<html>

<head>
    <title>Thêm Sản Phẩm</title>
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
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div id="wrapper">
        <header>
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="category/index.php">Thống kê</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="category/index.php">Quản lý danh mục</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="product/">Quản lý sản phẩm</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link " href="dashboard.php">Quản lý đơn hàng</a>
                </li>
            </ul>
        </header>
        <div class="container">
            <main>
                <h1>Bảng thống kê</h1>
                <section class="dashboard">
  <div class="container">
    <div class="row">
      <div class="col-md-3">
        <div class="card bg-primary text-white text-center">
          <div class="card-body">
            <h5 class="card-title">Sản phẩm</h5>
            <?php
            $sql = "SELECT * FROM `product`";
            $conn = mysqli_connect(HOST, USERNAME, PASSWORD, DATABASE);
            $result = mysqli_query($conn, $sql);
            echo '<span class="card-text">' . mysqli_num_rows($result) . '</span>';
            ?>
            <a href="product/" class="card-link text-white">xem chi tiết➜</a>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="card bg-success text-white text-center">
          <div class="card-body">
            <h5 class="card-title">Khách hàng</h5>
            <?php
            $sql = "SELECT * FROM `user`";
            $conn = mysqli_connect(HOST, USERNAME, PASSWORD, DATABASE);
            $result = mysqli_query($conn, $sql);
            echo '<span class="card-text">' . mysqli_num_rows($result) . '</span>';
            ?>
            <a href="" class="card-link text-white">xem chi tiết➜</a>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="card bg-info text-white text-center">
          <div class="card-body">
            <h5 class="card-title">Danh mục</h5>
            <?php
            $sql = "SELECT * FROM `category`";
            $conn = mysqli_connect(HOST, USERNAME, PASSWORD, DATABASE);
            $result = mysqli_query($conn, $sql);
            echo '<span class="card-text">' . mysqli_num_rows($result) . '</span>';
            ?>
            <a href="category/" class="card-link text-white">xem chi tiết➜</a>
          </div>
        </div>
      </div>
      <div class="col-md-3">
        <div class="card bg-danger text-white text-center">
          <div class="card-body">
            <h5 class="card-title">Đơn hàng</h5>
            <?php
            $sql = "SELECT * FROM `order_details`";
            $conn = mysqli_connect(HOST, USERNAME, PASSWORD, DATABASE);
            $result = mysqli_query($conn, $sql);
            echo '<span class="card-text">' . mysqli_num_rows($result) . '</span>';
            ?>
            <a href="dashboard.php" class="card-link text-white">xem chi tiết➜</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<section class="new-order">
  <!-- Nội dung phần new-order -->
</section>

                    <h4>Đơn hàng mới</h4>
                    <table>
                        <tr class="bold">
                            <td>STT</td>
                            <td>Tên</td>
                            <td>Tên sản phẩm/Số lượng</td>
                            <td>Giá sản phẩm</td>
                            <td>Địa chỉ</td>
                            <td>Số điện thoại</td>
                        </tr>
                        <?php
                            try {

                                if (isset($_GET['page'])) {
                                    $page = $_GET['page'];
                                } else {
                                    $page = 1;
                                }
                                $limit = 10;
                                $start = ($page - 1) * $limit;

                                $sql = "SELECT * from orders, order_details, product
                                where order_details.order_id=orders.id and product.id=order_details.product_id ORDER BY order_date DESC limit $start,$limit ";
                                $order_details_List = executeResult($sql);
                                $total = 0;
                                $count = 0;
                                // if (is_array($order_details_List) || is_object($order_details_List)){
                                foreach ($order_details_List as $item) {
                                    echo '
                                        <tr style="text-align: center;">
                                            <td>' . (++$count) . '</td>
                                            <td>' . $item['fullname'] . '</td>
                                            <td>' . $item['title'] . '<br>(<strong>' . $item['num'] . '</strong>)</td>
                                            <td class="b-500 red">' . number_format($item['num'] * $item['price'], 0, ',', '.') . '<span> VNĐ</span></td>
                                            <td>' . $item['address'] . '</td>
                                            <td class="b-500">' . $item['phone_number'] . '</td>
                                        </tr>
                                    ';
                                }
                            } catch (Exception $e) {
                                die("Lỗi thực thi sql: " . $e->getMessage());
                            }
                            ?>
                    </table>
                </section>
            </main>
        </div>
    </div>
</body>
<style>
    #wrapper{
        padding-bottom: 5rem;
    }
    .b-500 {
        font-weight: 500;
    }

    .red {
        color: red;
    }

    .green {
        color: green;
    }
</style>

</html>