let express = require('express');

let app = express();

let path = require('path');

//Use EJS as view engine
app.set('view engine', 'ejs');

app.use('/', (req, res, next) => {
    console.log("A new request right now at " + Date.now());
    next();
});

app.get("/", (req,res) => {
    res.render("index");
});



app.get("/test", (req, res) => {
    console.log("RenderBefore")
    res.render("test");
    res.console("Render After");
    console.log("RenderAfter");
});

app.get("/redirectTest", (req, res) => {
    console.log("Redirect");
    res.redirect("tester");
    console.log("RedirectAfter");
})

app.get("/tester", (req, res) => {
    res.redirect("test");
});




app.listen(3000, () => console.log("Working"));