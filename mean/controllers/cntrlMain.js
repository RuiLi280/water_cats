/*
 * GET home page.
 */
module.exports.home = function(req, res) 
{
    res.render('index', { "title": 'Water Cats' });
};

/*
 * GET new task page.
 */
module.exports.get_newtask = function(req, res) 
{
    res.render('newtask', { "title": 'Add New Task' });
};

/*
 * GET delete task page.
 */
module.exports.get_deletetask = function(req, res) 
{
    var taskId = req.params.taskid;
    res.render('deletetask', { "id" : taskId } );
};