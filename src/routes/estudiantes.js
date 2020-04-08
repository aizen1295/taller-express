const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/listar', async (req, res) => {
	const estudiante = await pool.query('SELECT * FROM estudiantes');

	res.render('estudiantes/listar', { estudiante });
});

router.get('/agregar', async (req, res) => {
	res.render('estudiantes/agregar');
});

router.post('/agregar', async (req, res) => {
	const { nombre, edad, correo } = req.body;
	const newestudiante = { nombre, edad, correo };
	await pool.query('insert into estudiantes set ?', [newestudiante]);
	res.redirect('listar');
	console.log(req.body);
});

module.exports = router;
