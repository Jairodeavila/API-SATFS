import jsonwebtoken from 'jsonwebtoken';
import Token from '../models/tokens.js';
import { response } from '../utils/response.js';

const jwt = jsonwebtoken;

export const Tokenverificacion = async (req, res, next) => {
  try {
    let token = req.headers['authorization'] ? req.headers['authorization'].split(' ')[1] : req.params.token;

    if (!token) {
      return response(res, 401, 401, "Invalid token");
    }

    const decodedToken = jwt.decode(token, { complete: true });
    const currentDate = Math.floor(Date.now() / 1000);

    if (currentDate > decodedToken.payload.exp) {
      return response(res, 401, 401, "Expired token");
    }

    jwt.verify(token, process.env.SECREDWORD, (err, data) => {
      if (err) {
        return response(res, 401, 401, err);
      } else {
        req.token = token;
        req.Tokendata = data;
        next();
      }
    });
  } catch (error) {
    return response(res, 401, 401, "Invalid token");
  }
};
