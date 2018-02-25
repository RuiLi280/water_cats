<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400|Roboto:300" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <title>Login</title>
</head>
<body>
    <div class="content">
        <?php
        require_once 'objects/Person.php';
        $posted = false;
        if($_POST) {
            //$email = $_POST["email"];
            //$password = $_POST["password"];
            $email = filter_input(INPUT_POST, "email");
            $password = filter_input(INPUT_POST,"password");
            echo $email;
            echo $password;

            try {
                $con = new PDO("mysql:host=localhost;dbname=water_cats", "water_cats", "sesame");
                $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                $query = "SELECT * FROM person WHERE email = :email";
                $ps = $con->prepare($query);
                $ps->execute(array(':email' => $email));
                $ps->setFetchMode(PDO::FETCH_CLASS, "Person");
                if ($person = $ps->fetch() && $password == $person->getPassword()) {
                    session_start();
                    $_SESSION['person'] = $person;
                    header("Location: http://localhost/board.html");
                    exit();
                } else {
                    $posted = true;
                }

            } catch (PDOException $ex) {
                echo 'ERROR: ' . $ex->getMessage();
            } catch (Exception $ex) {
                echo 'ERROR: ' . $ex->getMessage();
            }
        }
        ?>
        <?php
        if($posted){
            $msg = "Email and/or password incorrect.";
            echo "<script type='text/javascript'>alert('$msg');</script>";
        }
        ?>

        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
            <h1>
                Welcome to Water_Cats
            </h1>
            <p>
                Email: <input type="text" name="email" />
            </p>
            <p>
                Password: <input type="password" name="password"/>
            </p>
            <p>
                <button type="submit">Login</button>
            </p>
        </form>

    </div>

</body>
</html>



