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
                        title: 'Show task: ' + doc[0].name,
                        id: doc[0]._id,
                        priority: doc[0].priority,
                        status: doc[0].status,
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

    // Set our collection.
    var collection = db.get('task');

    // Submit to the database.
    collection.insert( { "name" : taskName,
                         "priority" : taskPriority,
                         "status": taskStatus },
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
                        name: doc[0].name,
                        id: doc[0]._id,
                        priority: doc[0].priority,
                        status: doc[0].status,
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

    console.log(req.body);

    // Submit to the database.
    collection.update( { "_id" : taskId }, { name: req.body.taskname, priority: req.body.taskpriority, status: req.body.taskstatus },
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
