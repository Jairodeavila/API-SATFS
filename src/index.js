// index.js
import express from 'express';
import { connection } from './database/db.js';
import bodyParser from 'body-parser';
import dotenv from 'dotenv';
import ambienteRouter from './routes/ambiente.routes.js';
import userRouter from './routes/user.routes.js';
import centroRouter from './routes/centro.routes.js';
import inventarioRouter from './routes/inventario.routes.js';
import funcionarioRouter from './routes/funcionario.routes.js';
import funxinvenRouter from './routes/funXinven.routes.js';
import municipioRouter from './routes/municipio.routes.js';
import objetoRouter from './routes/objetos.routes.js';
dotenv.config();

const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(bodyParser.json());

// Rutas
app.use('/ambiente', ambienteRouter); // Corregido el uso del enrutador de ambiente
app.use('/user',userRouter)
app.use('/centro', centroRouter); 
app.use('/inventario',inventarioRouter);
app.use('/funcionario',funcionarioRouter);
app.use('/funxinven',funxinvenRouter)
app.use('/municipio',municipioRouter)
app.use('/objeto',objetoRouter);

// Manejador de errores
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send('Error de conexion');
});

// Iniciar el servidor Express y probar la conexión a la base de datos
app.listen(port, () => {
  console.log(`Servidor escuchando en el puerto ${port}`);

});




