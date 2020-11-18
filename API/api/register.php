<?php

require "../config/connect.php";

if ($_SERVER['REQUEST_METHOD']=="POST") {
    # code...
    $response = array();
    $username = $_POST['username'];
    $password = md5($_POST['password']);
    $nama = $_POST['nama'];

    $cek = "SELECT * FROM login1 WHERE username ='$username'";
    $hasil = mysqli_fetch_array(mysqli_query($con, $cek));

    if (isset($hasil)) {
        # code...
        $response['value']=2;
        $response['message']= "sama";
        echo json_encode($response);
    } else {
        # code...
        $insert = "INSERT INTO login1 VALUE(NULL, '$username', '$password','$nama', NOW())";

        if (mysqli_query($con, $insert)) {
            # code...
            $response['value']=1;
            $response['message']= "berhasil";
            echo json_encode($response);
        } else {
            # code...
            $response['value']=0;
            $response['message']= "gagal";
            echo json_encode($response);
        }
    }
    

}
?>