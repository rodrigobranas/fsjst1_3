import GetBoard from "./application/GetBoard";
import GetBoards from "./application/GetBoards";
import BoardController from "./infra/controller/BoardController";
import PgPromiseConnection from "./infra/database/PgPromiseConnection";
import ExpressHttp from "./infra/http/ExpressHttp";
import BoardRepositoryDatabase from "./infra/repository/database/BoardRepositoryDatabase";

const http = new ExpressHttp();
const connection = new PgPromiseConnection();
const boardRepository = new BoardRepositoryDatabase(connection);
const boardController = new BoardController(http, boardRepository);
boardController.init();

http.listen(3000);
