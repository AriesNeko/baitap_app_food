import express from "express";
import restaurantRoute from "./restaurantRoute.js";

const rootRoute = express.Router();

rootRoute.use("/restaurant", restaurantRoute);

export default rootRoute;
