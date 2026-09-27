const http = require("http");

const PORT = process.env.PORT || 3000;

const news = [
  {
    id: 1,
    title: "🔥 Nine Server",
    text: "به Nine Server خوش آمدید!",
    date: "امروز"
  }
];

const server = http.createServer((req, res) => {
  res.setHeader("Content-Type", "application/json; charset=utf-8");
  res.setHeader("Access-Control-Allow-Origin", "*");

  if (req.url === "/") {
    res.end(JSON.stringify({
      name: "Nine Server API",
      status: "online"
    }));
    return;
  }

  if (req.url === "/news") {
    res.end(JSON.stringify(news));
    return;
  }

  res.statusCode = 404;
  res.end(JSON.stringify({
    error: "مسیر پیدا نشد"
  }));
});

server.listen(PORT, () => {
  console.log(`Nine Server API running on port ${PORT}`);
});	

