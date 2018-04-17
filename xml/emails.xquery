xquery version "1.0";

for $a in doc("project.xml")//person

for $b in doc("directory.xml")//person
    
where
    $a/@first_name = $b/@first_name
    and
    $a/@last_name = $b/@last_name

return
    $b/email