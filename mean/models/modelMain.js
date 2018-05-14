// https://docs.mongodb.com/v3.0/tutorial/create-an-auto-incrementing-field/
function getNextSequence(db, name) {
    var collection = db.get('counters');
    var ret = collection.findOneAndUpdate(
        { id: name }, 
        { $inc: {seq: 1} }, 
        { "new": true },
    );
    return ret.seq;
}

/*
 * GET task list page.
 */
module.exports.get_tasklist = function(req, res) 
{
    var db = req.db;
    var collection = db.get('task');
    collection.find({}, {}, 
        function(err, docs)
        {
            res.render('tasklist', { "tasklist" : docs });
        });
};

/*
 * GET task list page.
 */
module.exports.get_teamlist = function(req, res)
{
    var db = req.db;
    var team = db.get('team');
    team.find({}, {},
        function(err, docs)
        {
            res.render('teamlist', { "teamlist" : docs });
        });
};

/*
 * GET show task page.
 */
module.exports.get_showtask = function(req, res) 
{
    var taskId = req.params.taskid;
    var db = req.db;
    var collection = db.get('task');
    
    collection.find( { _id : taskId }, 
        function(err, doc) 
        {
            if (err) {
                res.send("Find failed.");
            }
            else {
                res.render('showtask', 
                    {   
                        title: 'Show task: ' + doc[0].taskDescription,
                        id: doc[0]._id,
                        priority: doc[0].priority,
                        status: doc[0].taskStatus,
                        assignDate: doc[0].assignDate,
                        dueDate: doc[0].taskDue,
                    })
            }
        });
};

/*
 * POST add task page.
 */
module.exports.post_addtask = function(req, res) 
{
    // Set our internal DB variable
    var db = req.db;

    // Get our form values. These rely on the "name" attributes.
    var taskName = req.body.taskname;
    var taskPriority = req.body.taskpriority;
    var taskStatus = req.body.taskstatus;
    var taskDue = req.body.taskdue;

    // Set our collection.
    var collection = db.get('task');

    // Submit to the database.
    collection.insert( { "taskDescription" : taskName,
                         "priority" : taskPriority,
                         "taskStatus": taskStatus,
                         "taskDue": taskDue },
                       function (err, doc) 
                       {
                           if (err) {
                               res.send("Insert failed.");
                           }
                           else {
                               // Forward to success page
                               res.redirect("/tasklist");
                           }
                       });
};

/*
 * POST delete task page.
 */
module.exports.post_deletetask = function(req, res) 
{
    var taskId = req.params.taskid;
    var db = req.db;
    var collection = db.get('task');

    // Submit to the database.
    collection.remove( { "_id" : taskId },
                       function (err, doc) 
                       {
                           if (err) {
                               res.send("Delete failed.");
                           }
                           else {
                               // Forward to success page
                               res.redirect("/tasklist");
                           }
                       });
};

/*
 * GET edit task page.
 */
module.exports.get_updatetask = function(req, res) 
{
    var taskId = req.params.taskid;
    var db = req.db;
    var collection = db.get('task');
    
    collection.find( { _id : taskId }, 
        function(err, doc) 
        {
            if (err) {
                res.send("Find failed.");
            }
            else {
                res.render('updatetask', 
                    {   
                        title: 'Update task',
                        name: doc[0].taskDescription,
                        id: doc[0]._id,
                        priority: doc[0].priority,
                        status: doc[0].taskStatus,
                    })
            }
        });
};

/*
 * POST edit task page.
 */
module.exports.post_updatetask = function(req, res) 
{
    var taskId = req.params.taskid;
    var db = req.db;
    var collection = db.get('task');

    // Submit to the database.
    collection.update( { "_id" : taskId }, { $set: {
                            taskDescription: req.body.taskname,
                            priority: req.body.taskpriority,
                            taskStatus: req.body.taskstatus,
                        } },
                       function (err, doc) 
                       {
                           if (err) {
                               res.send("Update failed.");
                           }
                           else {
                               //res.send("Successfully updated " + taskId);
                               res.redirect("/tasklist");
                           }
                       });
};

/*
 * GET show team page.
 */
module.exports.get_showteam = function(req, res)
{
    var teamid = req.params.teamid;
    var db = req.db;
    var team = db.get('team');
    var includes = db.get('includes');
    var person = db.get('person');

    team.findOne( {_id: teamid}, function(err, team) {
        includes.find( { teamID: team.teamID }, { _id: 0, personID: 1 }, function(err, memberIds) {
            memberIds = memberIds.map(function(memberId) {
                return memberId.personID;
            });
            person.find( { personID: {$in: memberIds} }, function(err, members) {
                    if (err) {
                        res.send("Find failed.");
                    }
                    else {
                        res.render('showteam',
                            {
                                title: team.teamName,
                                focus: team.focus,
                                members: members
                            });
                    }

            });
        });
    });

};
