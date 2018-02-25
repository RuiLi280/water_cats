<?php

require_once 'objects/Person.php';
require_once 'objects/Task.php';


//html of a form for uploading a file
echo <<<_END
<html>
    <head>
        <title>Tasks</title>
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400|Roboto:300" rel="stylesheet">
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
    $con = new PDO("mysql:host=localhost;dbname=water_cats", "michelle", "sesame");
    $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $boardInput = filter_input(INPUT_POST, 'board');

    session_start();
    $person = $_SESSION['person'];

    print "    <table>\n";

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

    $query = "SELECT priority, taskStatus, taskDescription, taskDue, assignDate
                FROM Task WHERE personID = " . $person->getPersonID() . " AND boardName = :boardInput";
    
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