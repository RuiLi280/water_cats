<?php
class Task
{
    private $taskID;
    private $priority;
    private $taskStatus;
    private $taskDescription;
    private $taskDue;
    private $assignDate;
    private $personID;
    private $boardName;

    public function getTaskID() { return $this->taskID; }
    public function getPriority() { return $this->priority; }
    public function getTaskStatus() { return $this->taskStatus; }
    public function getTaskDescription() { return $this->taskDescription; }
    public function getTaskDue() { return $this->taskDue; }
    public function getAssignDate() { return $this->assignDate; }
    public function getPersonID() { return $this->personID; }
    public function getBoardName() { return $this->boardName; }
}
?>