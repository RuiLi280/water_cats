xquery version "1.0";

for $task in
	doc("project.xml")
	//task
	
let 
	$p := $task/@priority
	
where
	$p > 2
	
order by
    $p
	
return 
	($task/task_name)