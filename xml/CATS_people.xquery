xquery version "1.0";

for $board in
	doc("project.xml")
	//board
	
for $person in
	doc("directory.xml")
	//person
	
where
	$board/@board_name="CATS"
	and
	$board//person/@first_name = $person/@first_name
	and
	$board//person/@last_name = $person/@last_name
	
return (
	<email>{data($person/email)}</email>,
	<gender>{$person/@gender}</gender>
)