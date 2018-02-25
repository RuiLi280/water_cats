<?php
require_once 'login.php';
require_once 'objects/Person.php';
require_once 'objects/Task.php';


//html of a form for uploading a file
echo <<<_END
<html>
    <head>
        <title>Tasks</title>
        <link href="style.css" rel="stylesheet">
    </head>
    <body>
        <form action="board.html">
            <button>Back</button>
        </form>
_END;

function createTableRow(Task $t)
{
    print "        <tr>\n";
    print "            <td>" . $t->getPriority()  . "</td>\n";
    print "            <td>" . $t->getTaskStatus()   . "</td>\n";
    print "            <td>" . $t->getTaskDescription() . "</td>\n";
    print "            <td>" . $t->getTaskDue() . "</td>\n";
    print "            <td>" . $t->getAssignDate() . "</td>\n";
    print "        </tr>\n";
}

try {
    // Connect to the database.
    $con = new PDO("mysql:host=localhost;dbname=water_cats", $username, $password);
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $boardInput = filter_input(INPUT_POST, 'board');
    echo $boardInput . '<br>';

    print "    <table border='1'>\n";

    $query = "SELECT priority, taskStatus, taskDescription, taskDue, assignDate FROM task";

    // Fetch the database field names.
    $result = $con->query($query);
    $row = $result->fetch(PDO::FETCH_ASSOC);
    
    // Construct the header row of the HTML table.
    print "            <tr>\n";
    foreach ($row as $field => $value) {
            print "                <th>$field</th>\n";
    }
    print "            </tr>\n";

    //$query = "SELECT *  FROM Task WHERE personID = $person->getID() AND boardName = :boardInput";
    $query = "SELECT priority, taskStatus, taskDescription, taskDue, assignDate FROM Task WHERE boardName = :boardInput";
    
    $ps = $con->prepare($query);
    $ps->bindParam(':boardInput', $boardInput);

    $ps->execute();
    $ps->setFetchMode(PDO::FETCH_CLASS, "Task");

    while ($task = $ps->fetch()) {
        print "        <tr>\n";
        createTableRow($task);
        print "        </tr>\n";
    }

    print "    </table>\n";
}
catch(PDOException $ex) {
    echo 'ERROR: '.$ex->getMessage();
}  

?>