<?php
    $email = filter_input(INPUT_POST, "email");
    $password = filter_input(INPUT_POST,passwd);

    try {
        $con = new PDO("mysql:host=localhost;dbname=water_cats","water_cats","sesame");
        $con.setAttribute(PDO::ATTR_ERROR, PDO::ERRMODE_EXCEPTION);

        $query = "SELECT * FROM person WHERE email = :email";
        
    }
?>
