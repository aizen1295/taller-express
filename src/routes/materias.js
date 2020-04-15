const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/listar', async (req, res) => {
	const materia = await pool.query('SELECT * FROM materias');

	res.render('materias/listar', { materia });
});

router.post('/agregar', async (req, res) => {
	const newmateria = req.body;
	await pool.query('insert into materias set ?', [newmateria]);
	res.redirect('listar');
	console.log(req.body);
});

module.exports = router;
