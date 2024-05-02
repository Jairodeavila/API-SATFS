
import jsonwebtoken from "jsonwebtoken";
import Token from "../models/tokens.js"
import { response } from "../utils/response.js";
const jwt = jsonwebtoken;

export const GetAllToken = (req, res, next) =>{
    jwt.verify(req.token, process.env.SECREDWORD, async (err, data) =>{
        if(err){
            response(res,500,105, "algo salio mal")
        }else{
            try{
                const token = await Token.findAll();
                if(token) {
                    response(res, 200, token);
                }  else{
                    response(res,404,404, "Token no encontrado");
                }
            } catch (err) {

                if (err.errno) {
                    response(res, 500, 500, "Algo salio mal");
                } else {
                    response(res, 500, 500, "Algo salio mal");
                }
            }
        }
    })
}