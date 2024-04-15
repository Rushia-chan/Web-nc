<?php require "layout/header.php"; ?>
<?php
require_once('database/config.php');
require_once('database/dbhelper.php');
?>
<!-- END HEADR -->
<main>
    <div class="container">
        <div id="ant-layout">
            <section class="search-quan">
                <i class="fas fa-search"></i>
                <form action="thucdon.php" method="GET">
                    <input name="search" type="text" placeholder="Tìm món hoặc thức ăn">
                </form>
            </section>
            <section class="main-layout">
                <div class="row">
                    <?php
                    $sql = 'SELECT * FROM category';
                    $categoryList = executeResult($sql);
                    $index = 1;
                    $imagePaths = array('images/bg/1.jpg', 'images/bg/2.jpg', 'images/bg/3.jpg');
                    $imageIndex = 0;

                    foreach ($categoryList as $item) {
                        echo '
            <div class="box">
                <a href="thucdon.php?id_category=' . $item['id'] . '">
                    <p style="margin-top:30px">' . $item['name'] . '</p>
                    <div class="bg"></div>
                    <img src="' . $imagePaths[$imageIndex] . '" alt="">
                </a>
            </div>';

                        // Tăng chỉ số hình ảnh để chọn hình tiếp theo
                        $imageIndex++;
                        if ($imageIndex >= count($imagePaths)) {
                            $imageIndex = 0;
                        }
                    }
                    ?>
                </div>

            </section>
        </div>
        <div class="bg-grey">

        </div>
        <!-- END LAYOUT  -->
        <section class="main">
            <section class="recently">
                <div class="title">
                    <h1>Được yêu thích nhất</h1>
                </div>
                <div class="product-recently">
                    <div class="row">
                        <?php
                        $sql = 'SELECT * from product, order_details where order_details.product_id=product.id order by order_details.num DESC limit 4';
                        $productList = executeResult($sql);
                        $index = 1;
                        foreach ($productList as $item) {
                            echo '
                                <div class="col">
                                    <a href="details.php?id=' . $item['product_id'] . '">
                                        <img class="thumbnail" src="admin/product/' . $item['thumbnail'] . '" alt="">
                                        <div class="title">
                                            <p>' . $item['title'] . '</p>
                                        </div>
                                        <div class="price">
                                            <span>' . number_format($item['price'], 0, ',', '.') . ' VNĐ</span>
                                        </div>
                                        <div class="more">
                                            <div class="star">
                                                <img src="images/icon/icon-star.svg" alt="">
                                                <span>4.6</span>
                                            </div>
                                            <div class="time">
                                                <img src="images/icon/icon-clock.svg" alt="">
                                                <span>15 comment</span>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                ';
                        }
                        ?>
                    </div>
                </div>
            </section>
            <!-- end Món ngon gần bạn -->

            <section class="restaurants">
                <div class="title">
                    <h1>Thực đơn tại quán <span class="green" style="color: #775855;">Ăng Go</span></h1>
                </div>
                <div class="product-restaurants">
                    <div class="row">
                        <?php
                        try {
                            if (isset($_GET['page'])) {
                                $page = $_GET['page'];
                            } else {
                                $page = 1;
                            }
                            $limit = 12;
                            $start = ($page - 1) * $limit;
                            $sql = "SELECT * FROM product limit $start,$limit";
                            executeResult($sql);
                            // $sql = 'select * from product limit $star,$limit';
                            $productList = executeResult($sql);

                            $index = 1;
                            foreach ($productList as $item) {
                                echo '
                                <div class="col">
                                    <a href="details.php?id=' . $item['id'] . '">
                                    <img class="thumbnail" src="admin/product/' . $item['thumbnail'] . '" alt="" style="width: 250px;" height="320"; object-fit: scale-down;>
                                        <div class="title">
                                            <p>' . $item['title'] . '</p>
                                        </div>
                                        <div class="price">
                                            <span>' . number_format($item['price'], 0, ',', '.') . ' VNĐ</span>
                                        </div>
                                        <div class="more">
                                            <div class="star">
                                                <img src="images/icon/icon-star.svg" alt="">
                                                <span>4.6</span>
                                            </div>
                                            <div class="time">
                                                <img src="images/icon/icon-clock.svg" alt="">
                                                <span>15 comment</span>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                ';
                            }
                        } catch (Exception $e) {
                            die("Lỗi thực thi sql: " . $e->getMessage());
                        }
                        ?>
                    </div>
                    <div class="pagination">
                        <ul>
                            <?php
                            $sql = "SELECT * FROM `product`";
                            $conn = mysqli_connect(HOST, USERNAME, PASSWORD, DATABASE);
                            $result = mysqli_query($conn, $sql);
                            if (mysqli_num_rows($result)) {
                                $numrow = mysqli_num_rows($result);
                                $current_page = ceil($numrow / 12);
                                // echo $current_page;
                            }
                            for ($i = 1; $i <= $current_page; $i++) {
                                // Nếu là trang hiện tại thì hiển thị thẻ span
                                // ngược lại hiển thị thẻ a
                                if ($i == $current_page) {
                                    echo '
                                    <li style="background: #775855;"><a href="?page=' . $i . '" >' . $i . '</a></li>';
                                } else {
                                    echo '
                                    <li style="background: #775855;"><a href="?page=' . $i . '">' . $i . '</a></li>';
                                }
                            }
                            ?>
                        </ul>
                    </div>
                </div>
            </section>
        </section>
    </div>
</main>
<!-- <link rel="stylesheet" href="https://core.vchat.vn/service/chat?code=18650&jwt=1c445d15cacd67fa608af7546e5af48a"> -->
<?php require_once('layout/footer.php'); ?>
<!-- <script lang="javascript">
    var __vnp = {
        code: 18650,
        key: '',
        secret: '1c445d15cacd67fa608af7546e5af48a'
    };
    (function() {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.defer = true;
        ga.src = '//core.vchat.vn/code/tracking.js';
        var s = document.getElementsByTagName('script');
        s[0].parentNode.insertBefore(ga, s[0]);
    })();
</script> -->
</body>

</html>