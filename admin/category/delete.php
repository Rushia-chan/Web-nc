<?php
require_once('../database/dbhelper.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['id'])) {
    $id = $_POST['id'];

    $sql = 'DELETE FROM category WHERE id = ?';
    $params = array($id);

    execute($sql, 'i', $params);
    header('Location: index.php');
    die();
}
?>

