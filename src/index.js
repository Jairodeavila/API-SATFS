// index.js
import express from 'express';
import { connection } from './database/db.js';
import bodyParser from 'body-parser';
import dotenv from 'dotenv';
import ambienteRouter from './routes/ambiente.routes.js';
import centroRouter from './routes/centro.routes.js';
import inventarioRouter from './routes/inventario.routes.js';
import usuarioRouter from './routes/usuario.routes.js';
import UsuxinvenRouter from './routes/UsuXinven.routes.js';
import municipioRouter from './routes/municipio.routes.js';
import objetoRouter from './routes/objetos.routes.js';
import rolesRouter from './routes/roles.routes.js';
dotenv.config();

const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(bodyParser.json());

// Rutas
app.use('/', ambienteRouter); // Corregido el uso del enrutador de ambiente
app.use('/', centroRouter); 
app.use('/',inventarioRouter);
app.use('/',usuarioRouter);
app.use('/',UsuxinvenRouter)
app.use('/',municipioRouter)
app.use('/',objetoRouter);
app.use('/',rolesRouter);

// Manejador de errores
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send('Error de conexion');
});

// Iniciar el servidor Express y probar la conexión a la base de datos
app.listen(port, () => {
  console.log(`Servidor escuchando en el puerto ${port}`);

});




