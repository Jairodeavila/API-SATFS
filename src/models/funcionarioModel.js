const connection = require('../config/db.config');

//funcion para obtener todos los funcionarios de la base de datos

const getAllFun = (callback) => {
  const sql = 'SELECT * FROM funcionario';
  connection.query(sql, (err, results) => {
    if (err) {
      return callback(err);
    }
    return callback(null, results);
  });
}  

//funcion para crear un funcionario en la base de datos

const createFun = (FunData) => {
    return new Promise((resolve, reject) => {
        connection.query('INSERT INTO funcionario SET ?', FunData, (err,res) => {
           if (err){
            reject(err);
           }else{
            resolve(res);
           }
        });
    });
}

//funcion para actualizar un funcionario en la base de datos 

const editFun = (FunId, FunData) => {
    return new Promise((resolve, reject) => {
      connection.query('UPDATE funcionario SET ? WHERE num_doc = ?', [FunData, FunId], (err, res) => {
        if (err) {
          reject(err);
        } else {
          if (res.affectedRows === 0) {
            reject(new Error('Usuario no encontrado'));
          } else {
            resolve('Usuario actualizado correctamente');
          }
        }
      });
    });
  }

  module.exports = {
    getAllFun,
    createFun,
    editFun,
  }