import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import { Request, Response } from "express";
import authRouter from "./routers/authRouter.js"

dotenv.config();

const server = express();

server
  .use(cors())
  .use(express.json())
  .use(authRouter);

server.get("/", (req: Request, res: Response) => res.sendStatus(200));

server.listen(process.env.PORT, () => console.log("Listening on port " + process.env.PORT));