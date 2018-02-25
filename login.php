<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>

<body>
    <?php
        $email = filter_input(INPUT_POST, "email");
        $password = filter_input(INPUT_POST,"passwd");

        try {
            $con = new PDO("mysql:host=localhost;dbname=water_cats","water_cats","sesame");
            $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $query = "SELECT * FROM person WHERE email = :email";
            $ps = $con->prepare($query);

            $ps->execute(array(':email' => $email));
            $data = $ps->fetchAll(PDO::FETCH_ASSOC);

            if(count($data) > 0) {
                if($password == $data[0]["password"]) {
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