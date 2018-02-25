<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400|Roboto:300" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <title>Login</title>
</head>

<body>
    <?php
        require_once 'objects/Person.php';

        $email = filter_input(INPUT_POST, "email");
        $password = filter_input(INPUT_POST,"passwd");

        try {
            $con = new PDO("mysql:host=localhost;dbname=water_cats","michelle", "sesame");
            $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $query = "SELECT * FROM person WHERE email = :email";
            $ps = $con->prepare($query);

            $ps->execute(array(':email' => $email));
            $ps->setFetchMode(PDO::FETCH_CLASS, "Person");

            if($person = $ps->fetch()) {
                if($password == $person->getPassword()) {
                    session_start();
                    $_SESSION['person'] = $person;
                    header("Location: http://localhost/board.html");
                    exit();
                }
            }
            print "<p>Incorrect email or password.</p>";
            print "<button onclick='location.href=\"login.html\"'>return</button>";
        }
        catch(PDOException $ex){
            echo 'ERROR: '.$ex->getMessage();
        }
        catch(Exception $ex){
            echo 'ERROR: '.$ex->getMessage();
        }
    ?>
</body>
</html>