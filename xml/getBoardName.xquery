xquery version "1.0";

<project>{
    for $boards in 
        doc("project.xml")
        //board
    return 
        <board_name>{
        ($boards/@board_name,
        
        for $name in $boards
            //person
        return <name>{
        (data($name/@first_name), data($name/@last_name))
        }</name>
        )
        }</board_name>
}
</project>
