const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/listar', async (req, res) => {
	const nota = await pool.query('SELECT * FROM notas WHERE ');
	console.log(nota);
	res.render('notas/listar', { nota });
});

router.get('/agregar', async (req, res) => {
	const estudiante = await pool.query('SELECT * FROM estudiantes');
	const docente = await pool.query('SELECT * FROM docentes');
	const materia = await pool.query('SELECT * FROM materias');
	const periodo = await pool.query('SELECT * FROM periodos');
	res.render('notas/agregar', { estudiante, docente, materia, periodo });
});

router.post('/agregar', async (req, res) => {
	const newnota = req.body;
	await pool.query('insert into notas set ?', [newnota]);
	res.redirect('listar');
	console.log(req.body);
});

module.exports = router;
