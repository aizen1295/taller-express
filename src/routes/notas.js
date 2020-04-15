const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/listar', async (req, res) => {
	const nota = await pool.query(
		'SELECT id_nota, e.nombre estudiante,d.nombre docente, m.materia, p.periodo, n.nota FROM notas n,docentes d,estudiantes e,materias m,periodos p WHERE n.id_estudiante = e.id_estudiante AND n.id_docente = d.id_docente AND n.id_materia = m.id_materia AND n.id_periodo = p.id_periodo'
	);
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

router.delete('/eliminar', async (req, res) => {
	res.render('hola');
});

module.exports = router;
