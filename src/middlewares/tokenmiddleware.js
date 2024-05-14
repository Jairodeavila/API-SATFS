import jsonwebtoken from 'jsonwebtoken';
import Token from '../models/tokens.js';
import { response } from '../utils/response.js';
const jwt = jsonwebtoken;

export const Tokenverificacion = async (req, res, next) => {
    try {
        let bearerHeader = req.headers['authorization'];
        let token = req.params.token;
        
        if (token) {

            const bearerToken = token;

            const decodetoken = jwt.decode(bearerToken, { complete: true })

            const fechaActual = Math.floor(Date.now() / 1000);

            if (fechaActual > decodetoken.payload.exp) {

                response(res,401,401,"Expired token");
            }else{

                req.token = bearerToken;
                next();
            }

           

        } else if (typeof bearerHeader !== "undefined") {

            
            const bearerToken = bearerHeader.split(' ')[1];


            const decodetoken = jwt.decode(bearerToken, { complete: true })

            const fechaActual = Math.floor(Date.now() / 1000);

            if (fechaActual > decodetoken.payload.exp) {
                response(res,401,401,"Expired token");
            }else{
                req.token = bearerToken;
                console.log(bearerToken)
                jwt.verify(bearerToken, 'CANTS',async (err,data)=>{
                    if(err){
                        response(res,401,401, err);
                    }else{
                        
                                req.Tokendata = data;
                           
                                next();
                                
                            
                    }
                });
            
            }
        } else {
            
            response(res,401,401,"invalid token");
        }
    } catch (error) {

        response(res,401,401,"invalid token");
    }
}