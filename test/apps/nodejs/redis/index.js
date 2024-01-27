const http = require("http");
const redis = require("redis");
const client = redis.createClient();

const server = http.createServer((req, res) => {
  client.incr("counter");
  client.get("counter", (err, counter) => {
    res.writeHead(200, { "Content-Type": "text/plain" });
    res.end("Hello World\n" + counter);
  });
});

server.listen(3000);
