import "@babel/polyfill";
import Koa from "koa";
import Router from "koa-router";

const PORT = process.env.PORT || "9001";
const router = new Router();
const app = new Koa();

router.get("/", async ctx => (ctx.body = { msg: "Kong Node Api" }));

app.use(router.allowedMethods());
app.use(router.routes());

app.listen(PORT);
console.log(`Server is running on port:${PORT}`);
