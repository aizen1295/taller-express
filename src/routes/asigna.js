const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/listar', async (req, res) => {
	const asigna = await pool.query(
		'SELECT id_asigna, d.nombre docente, m.materia, p.periodo FROM asigna_materia_docente a,docentes d,materias m,periodos p WHERE a.id_periodo = p.id_periodo AND a.id_docente = d.id_docente AND a.id_materia = m.id_materia'
	);
	res.render('asignar_materias/listar', { asigna });
});

router.get('/agregar', async (req, res) => {
	const docente = await pool.query('SELECT * FROM docentes');
	const materia = await pool.query('SELECT * FROM materias');
	const periodo = await pool.query('SELECT * FROM periodos');
	res.render('asignar_materias/agregar', { docente, materia, periodo });
});

router.post('/agregar', async (req, res) => {
	const newdocente = req.body;
	await pool.query('insert into asigna_materia_docente set ?', [newdocente]);
	res.redirect('listar');
	console.log(req.body);
});

module.exports = router;
