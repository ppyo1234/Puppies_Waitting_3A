const express = require('express');
const mysql = require('mysql2');
const app = express();
const port = 3000;  // Puerto del servidor de la aplicación

// Configuración de la conexión a la base de datos
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'usuario_gestor_bd',       // Usuario de la base de datos MySQL
  password: 'contraseña_gestor_bd', // Contraseña del usuario de la base de datos MySQL
  database: 'puppies_waiting',
  port: 3310  // Puerto de la base de datos MySQL
});

// Conectar a la base de datos
connection.connect(err => {
  if (err) {
    console.error('Error conectando a la base de datos:', err.stack);
    return;
  }
  console.log('Conectado a la base de datos como id ' + connection.threadId);
});

// Ruta API para obtener datos
app.get('/api/puppies', (req, res) => {
  connection.query('SELECT * FROM puppies', (error, results) => {
    if (error) {
      res.status(500).send(error);
    } else {
      res.json(results);
    }
  });
});

// Iniciar el servidor
app.listen(port, () => {
  console.log(`Servidor escuchando en http://localhost:${port}`);
});
