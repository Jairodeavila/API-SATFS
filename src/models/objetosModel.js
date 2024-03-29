const connection = require('../config/db.config');

// funcion para tener todos los opbjetos 7
const getAllobjects =  (callback) => {
    const sql = 'SELECT * FROM objetos';
    connection.query(sql,(err, results) =>{
        if (err) {
            return callback(err);
        }
        return callback(null, results);
    });
};

const  createObject = (objData) => {
return new Promise((resolve, reject) => {
    connection.query('INSERT INTO objetos SET ?', objData,(err, results) =>{
        if (err) {
            reject(err);
        }else
        {
            resolve(results);
        }
    });
});
}


const updateObject = (objId, objData) => {
 return new Promise((resolve, reject) => {
    connection.query('UPDATE objetos SET ? WHERE id_obj = ?', [objData, objId],(err, results) =>{
        if(err){
            reject(err);
        }else
        {
            if(res.affectedRows === 0){
                reject(new Error('objeto no encontrado'));
            }else{
                resolve('objeto actualizado correctamente')
            }
        }
    });
 });
}



module.exports = {
    getAllobjects,
    createObject,
    updateObject,
}