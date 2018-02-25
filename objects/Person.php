<?php
class Person
{
    private $personID;
    private $email;
    private $password;
    private $firstName;
    private $lastName;

    public function getPersonID() { return $this->personID; }
    public function getEmail() { return $this->email; }
    public function getPassword() { return $this->password; }
    public function getFirstName() { return $this->firstName; }
    public function getLastName() { return $this->lastName; }
}
?>