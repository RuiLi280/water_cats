xquery version "1.0";

<ul>
{
for $task in
	doc("project.xml")
	//task
	
return 
	<li>{data($task)}</li>
}
</ul>