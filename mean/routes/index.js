var express = require('express');
var router = express.Router();
var ctrlMain  = require("../controllers/cntrlMain");
var modelMain = require("../models/modelMain");

console.log("Router:"); console.log(router);

/*
 * GET home page.
 */
router.get('/', ctrlMain.home);

/*
 * GET task list page.
 */
router.get('/tasklist', modelMain.get_tasklist);

/*
 * GET new task page.
 */
router.get('/newtask', ctrlMain.get_newtask);

/*
 * POST add task page.
 */
router.post('/addtask', modelMain.post_addtask);

/*
 * GET show task page.
 */
router.get('/tasklist/:taskid', modelMain.get_showtask);

/*
 * GET delete task page.
 */
router.get('/deletetask/:taskid', ctrlMain.get_deletetask);

/*
 * POST delete task page.
 */
router.post('/deletetask/:taskid', modelMain.post_deletetask);

/*
 * GET update task page.
 */
router.get('/updatetask/:taskid', modelMain.get_updatetask);

/*
 * POST update task page.
 */
router.post('/updatetask/:taskid', modelMain.post_updatetask);

module.exports = router;

/*
 * GET team list page.
 */
router.get('/teamlist', modelMain.get_teamlist);

/*
 * GET show team page.
 */
router.get('/teamlist/:teamid', modelMain.get_showteam);