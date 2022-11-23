const express = require('express')
const db = require('./db')
const app = express()
const port = 8000
const bodyParser = require("body-parser");
const { objectToString } = require('@vue/shared');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use((req, res, next) => {
    res.append('Access-Control-Allow-Origin', ['*']);
    res.append('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.append('Access-Control-Allow-Headers', 'Content-Type');
    next();
});


app.post('/newTable', async (req, res) => {
    let table = req.body;
    try {
        let result = db.run("create table " + table.name + " (" + table.values + ")");
        console.log(result);
        res.send(JSON.stringify(result, (key, value) =>
            typeof value === 'bigint'
                ? parseInt(value)
                : value
        ));
    } catch (err) {
        console.log(err);
    }
});

app.post('/TableTotal', async (req, res) => {
    let tableName = req.body.tableName;
    db.all("select * from " + tableName, (err, data) => {
        if (err) {
            console.log(err);
          }
          res.send(JSON.stringify(data, (_key, value) =>
              typeof value === 'bigint'
                  ? parseInt(value)
                  : value
          ));
    });   
});

app.get('/Component', async (req, res) => {
    let query = req.body;
    try {
        const result = await db.query("select * from " + query.tableName + " where " + query.column + " == " + query.Value);
        console.log(result);
        res.send(JSON.stringify(result, (key, value) =>
            typeof value === 'bigint'
                ? parseInt(value)
                : value
        ));
    } catch (err) {
        console.log(err);
    }
});

/*// GET
app.get('/tasks', async (req, res) => {
    try {
        const result = await db.pool.query("select * from tasks");
        res.send(result);
    } catch (err) {
        throw err;
    }
});

// POST
app.post('/tasks', async (req, res) => {
    let task = req.body;
    try {
        const result = await db.pool.query("insert into tasks (description) values (?)", [task.description]);
        res.send(result);
    } catch (err) {
        throw err;
    }
});

app.put('/tasks', async (req, res) => {
    let task = req.body;
    try {
        const result = await db.pool.query("update tasks set description = ?, completed = ? where id = ?", [task.description, task.completed, task.id]);
        res.send(result);
    } catch (err) {
        throw err;
    }
});

app.delete('/tasks', async (req, res) => {
    let id = req.query.id;
    try {
        const result = await db.pool.query("delete from tasks where id = ?", [id]);
        res.send(result);
    } catch (err) {
        throw err;
    }
});
*/
app.listen(port, () => console.log(`Listening on port ${port}`));