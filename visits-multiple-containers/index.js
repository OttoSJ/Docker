const express = require("express");
const redis = require("redis");
const process = require("process");

const app = express();
const client = redis.createClient({
  host: "redis-server", // <== This name has to match whats in the docker-compose under services
  port: 6379,
});
client.set("visits", 0);

app.get("/", (req, res) => {
  process.exit(0);
  client.get("visits", (err, visits) => {
    res.send("Number of visits is " + visits);
    client.set("visits", parseInt(visits) + 1);
  });
});

const PORT = 5000;

app.listen(PORT, () => {
  console.log(`Listening on port ${PORT}`);
});
