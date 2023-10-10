import express from "express";
import rootRoute from "./routes/rootRoute.js";

const app = express();
app.listen(8080);
app.use(express.json());
app.use(rootRoute);
