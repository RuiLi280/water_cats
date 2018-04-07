xquery version "1.0";

for $task in
	doc("project.xml")
	//task

where
    $task/person/@first_name ="Jason" 
    and 
    $task/person/@last_name = "Kelly"
	
return 
	($task/task_name)