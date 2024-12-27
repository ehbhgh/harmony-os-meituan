const Koa = require("koa");
const app = new Koa();
const fs = require("fs");
const { promisify } = require("util");
const cors = require("koa-cors");
const Router = require("koa-router");
const bodyParser = require("koa-bodyparser");
const readFile = promisify(fs.readFile);
const router = new Router();
const serve = require("koa-static");
const path = require("path");
//处理跨域问题中间件
app.use(cors());
//处理post参数解析中间件
app.use(bodyParser());
const staticPath = path.join(__dirname, "public");
app.use(serve(staticPath));
// 根据id获取食物
router.post("/findFoodsById", async (ctx) => {


  const { foodId } = ctx.request.body
  const res = await readFile("./db/index.json", "utf-8");
  const data = JSON.parse(res).data
  const foodList = data.filter(item => item.foodId === foodId)
  ctx.body = {
    code: 200,
    msg: "success",
    data: foodList,
  };
});

//获取
router.get("/menu", async (ctx) => {
const list= [
  {
    title: "点菜",
    subTitle: "dianCai",
    status: true,
    num:null

  },
  {
    title: "评价",
    subTitle: "pingJia",
    status: false,
    num: 1796
  },
  {
    title: "商家",
    subTitle: "shopping",
    status: false,
    num:null
  },
  {
    title: "输入框",
    subTitle: "input",
    status: false,
    num:null
  }
]
  ctx.body = {
    code: 200,
    msg: "success",
    data: list,
  };
});

router.get("/foodsCategory", async (ctx) => {
 const foodsCategoryList= [{
    foodId: "1",
    foodCategory: "一人套餐"
  }, {
    foodId: "2",
    foodCategory: "特色烧烤"
  }, {
    foodId: "3",
    foodCategory: "杂粮主食"
  }]
    ctx.body = {
      code: 200,
      msg: "success",
      data: foodsCategoryList,
    };
  });
app.use(router.routes()).use(router.allowedMethods());
// 监听端口
const PORT = 3100;
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
