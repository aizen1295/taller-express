const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/listar', async (req, res) => {
	const periodo = await pool.query('SELECT * FROM periodos');

	res.render('periodo_academico/listar', { periodo });
});

router.post('/agregar', async (req, res) => {
	const newperiodo = req.body;
	await pool.query('insert into periodos set ?', [newperiodo]);
	res.redirect('listar');
	console.log(req.body);
});

module.exports = router;
