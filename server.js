var config = require("./config");
var db = require("knex")(config);
var express = require("express");

express()
 .get("*", function(req, res) {
      res.send('continuous build is fine!');
    // db("users").then(function(data) {
    //   res.send(data);
    // });
 })
 .listen(3000, function(err) {
    if (err) {
      console.error(err);
      return;
    }

    console.log("Express Server listening on port 3000");
  })
;
