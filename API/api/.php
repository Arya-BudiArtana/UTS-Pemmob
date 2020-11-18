<?php

require "../config/connect.php";

if ($_SERVER['REQUEST_METHOD']=="POST") {
    # code...
    $response = array();
    $username = $_POST['username'];
    $password = md5($_POST['password']);

    $cek = "SELECT * FROM login1 WHERE username ='$username' and password = '$password'";
    $hasil = mysqli_fetch_array(mysqli_query($con, $cek));

    if (isset($hasil)) {
        # code...
        $response['value']=1;
        $response['message']= "login berhasil";
        echo json_encode($response);
    } else {
            # code...
            $response['value']=0;
            $response['message']= "gagal";
            echo json_encode($response);
    }
    

}
?>