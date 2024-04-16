import speakeasy from 'speakeasy';
import { Tokenverificacion } from '../middlewares/tokenmiddleware';

export const GenTemporal = (tiempo)=>{
    const secret = speakeasy.generateSecret({length:6});

    const token = speakeasy.totp({
        secret: secret.ascii,
        encoding: 'ascii',
        step: tiempo 
    });

    const exp = Math.floor((Date.now() / 1000) + tiempo);
    const data = {
        codigo: token,
        exp: exp,
    }
    return data;
}