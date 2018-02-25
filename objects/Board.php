<?php
class Board
{
    private $boardName;
    private $visibility;
    private $background;
    private $teamID;

    public function getBoardName() { return $this->boardName; }
    public function getVisibility() { return $this->visibility; }
    public function getBackground() { return $this->background; }
    public function getTeamID() { return $this->teamID; }
}
?>