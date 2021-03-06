const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/listar', async (req, res) => {
	const docente = await pool.query('SELECT * FROM docentes');
	console.log(docente);
	res.render('docentes/listar', { docente });
});

router.get('/agregar', async (req, res) => {
	res.render('docentes/agregar');
});

router.post('/agregar', async (req, res) => {
	const newdocente = req.body;
	await pool.query('insert into docentes set ?', [newdocente]);
	res.redirect('listar');
	console.log(req.body);
});

module.exports = router;
