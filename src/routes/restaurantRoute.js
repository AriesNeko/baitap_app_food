import express from "express";
import {
  getLikeRes,
  getLikeUser,
  getRateRes,
  getRateUser,
  handelOrder,
  likeRes,
  rateRes,
  unlikeRes,
} from "../controllers/restaurantController.js";

const restaurantRoute = express.Router();

// api danh sách like theo id nhà hàng
restaurantRoute.get("/get-res-like/:id", getLikeRes);

// api danh sách like theo id user
restaurantRoute.get("/get-user-like/:id", getLikeUser);

// api chức năng like nhà hàng
restaurantRoute.post("/like-res", likeRes);

// api chức năng unlike nhà hàng
restaurantRoute.post("/unlike-res/:id", unlikeRes);

// api order
restaurantRoute.post("/order", handelOrder);

// api danh sách rate theo id nhà hàng
restaurantRoute.get("/get-res-rate/:id", getRateRes);

// api danh sách rate theo id  user
restaurantRoute.get("/get-user-rate/:id", getRateUser);

// api thêm đánh giá nhà hàng
restaurantRoute.post("/rate-res", rateRes);

export default restaurantRoute;
