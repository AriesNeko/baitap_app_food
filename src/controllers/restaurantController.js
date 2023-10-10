import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

const model = initModels(sequelize);

// lấy danh sách like theo nhà hàng
const getLikeRes = async (req, res) => {
  let { id } = req.params;

  let data = await model.like_res.findAll({
    where: {
      res_id: id,
    },
    include: ["user"],
  });
  res.send(data);
};

// lấy danh sách like theo user
const getLikeUser = async (req, res) => {
  let { id } = req.params;

  let data = await model.like_res.findAll({
    where: {
      user_id: id,
    },
    include: ["re"],
  });
  res.send(data);
};

//  xử lý chức năng like và unlike nhà hàng
const likeRes = async (req, res) => {
  let { user_id, res_id } = req.body;

  let newData = {
    user_id,
    res_id,
    like_status: 1,
  };

  let checkLike = await model.like_res.findAll({
    where: {
      user_id: newData.user_id,
      res_id: newData.res_id,
    },
  });

  if (checkLike.length > 0) {
    let checkUnLike = await model.like_res.findAll({
      where: {
        user_id: newData.user_id,
        res_id: newData.res_id,
        like_status: 1,
      },
    });
    console.log("checkUnLike:", checkUnLike);
    if (checkUnLike.length > 0) {
      await model.like_res.update(
        { like_status: 0 },
        {
          where: {
            user_id: newData.user_id,
            res_id: newData.res_id,
          },
        }
      );
      res.send("Unlike");
    } else {
      await model.like_res.update(
        { like_status: 1 },
        {
          where: {
            user_id: newData.user_id,
            res_id: newData.res_id,
          },
        }
      );
      res.send("Like");
    }
  } else {
    await model.like_res.create(newData);
    res.send("Like");
  }
};

// xử lý chức năng unlike nhà hàng
const unlikeRes = async (req, res) => {
  let { id } = req.params;

  let checkId = await model.like_res.findAll({ where: { id } });

  if (checkId.length > 0) {
    model.like_res.destroy({ where: { id } });
    res.send("Unlike");
  } else {
    res.status(404).send("Xử lý không hợp lệ");
  }
};

// xử lý chức năng order
const handelOrder = async (req, res) => {
  const { user_id, food_id, amount } = req.body;
  let newData = {
    user_id,
    food_id,
    amount,
  };
  await model.orders.create(newData);
  res.send("Order thành công!");
};

// thêm đánh giá nhà hàng
const rateRes = async (req, res) => {
  let { user_id, res_id, amount, date_rate } = req.body;
  let newData = {
    user_id,
    res_id,
    amount,
    date_rate,
  };
  await model.rate_res.create(newData);

  res.send("Đánh giá thành công!");
};

// lấy danh sách đánh giá theo id nhà hàng
const getRateRes = async (req, res) => {
  let { id } = req.params;

  let data = await model.rate_res.findAll({
    where: {
      res_id: id,
    },
    include: ["user"],
  });
  res.send(data);
};

// lấy danh sách giá theo user
const getRateUser = async (req, res) => {
  let { id } = req.params;

  let data = await model.rate_res.findAll({
    where: {
      user_id: id,
    },
    include: ["re"],
  });
  res.send(data);
};
export {
  getRateRes,
  getRateUser,
  rateRes,
  getLikeRes,
  getLikeUser,
  likeRes,
  unlikeRes,
  handelOrder,
};
