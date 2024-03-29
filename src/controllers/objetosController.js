const objModel = require('../models/objetosModel');

const getAllObjControllers = (req, res) => {
    objModel.getAllobjects((err, obj) => {
        if (err) {
            return res.status(500).json({message: 'Erroe al obtener los objetos'});
        }
        res.json(obj);
    })
};


module.exports = 
{
    getAllObjControllers,
}