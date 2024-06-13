// Importa los módulos necesarios
const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const usuarios = require("../models/usuarioModel.js");
 // Importa el modelo de usuario de Sequelize

// Crea una instancia de Express
const app = express();

// Middleware para parsear el cuerpo de las solicitudes JSON
app.use(express.json());

// Ruta para el inicio de sesión
app.post('/login', async (req, res) => {
  const { email, password } = req.body;

  try {
    // Busca el usuario en la base de datos por su correo electrónico
    const user = await usuarios.findOne({ where: { email: email } });

    // Si no se encontró el usuario, responde con un mensaje de error
    if (!user) {
      return res.status(401).json({ message: 'Usuario no encontrado.' });
    }

    // Compara la contraseña proporcionada con la contraseña almacenada
    const passwordMatch = await bcrypt.compare(password, user.password);

    // Si las contraseñas no coinciden, responde con un mensaje de error
    if (!passwordMatch) {
      return res.status(401).json({ message: 'Contraseña incorrecta.' });
    }

    // Si la autenticación es exitosa, genera un token de acceso
    const token = jwt.sign({ userId: user.id }, 'secreto', { expiresIn: '1h' });

    // Responde con el token de acceso
    res.json({ token: token });
  } catch (error) {
    console.error('Error de inicio de sesión:', error);
    res.status(500).json({ message: 'Error de servidor.' });
  }
});

// Inicia el servidor en el puerto 3000
app.listen(3000, () => {
  console.log('Servidor de API en ejecución en http://localhost:3000');
});
