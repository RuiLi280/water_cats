xquery version "1.0";

for $board in
    doc("project.xml")
    //board
    
let
    $b := $board/@visibility
    
where
    $b = "Public"
    
order by
    $b

return
    $board