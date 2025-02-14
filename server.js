const express = require("express");
const app = express();
const PORT = 3000;

// Serve static files from the 'public' directory
app.use(express.static("public"));

app.get("/", (req, res) => {
  res.send("Hello from Node.js running behind Nginx!");
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});

