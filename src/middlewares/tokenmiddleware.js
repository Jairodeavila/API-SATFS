import jsonwebtoken from "jsonwebtoken";
import { response } from "../utils/response.js";
const jwt = jsonwebtoken;

export const Tokenverificacion = async (req, res, next) => {
    try {
        let barearHeader = req.headers ["Authorization"];
        let token = req.params.token;
        if (token) {
            const barearToken = token;
            const decodetoken = jwt.decode(barearToken,{complete: true})
            const fechaAct = Math.floor(Date.now() / 1000);
            if (fechaAct > decodetoken.payload.exp){
                response(res,400,105, 'token caducado');
            }else{
                req.token = barearToken;
                next();
            }

        } else if (typeof barearHeader !== "undefined"){
            const barearToken = jwt.decode(barearHeader,{complete:true});
            const fechaAct = Math.floor(Date.now()/1000);
            if (fechaAct > decodetoken.payload.exp){
                response(res,400,105, "token expirado")
            }else{
                req.token = barearToken;
                next();
            }
        }else {
            response(res,400,101, "token invalido");
        }
    }catch(error){
        response(res,400,101, " token invalido")
    }
}
        