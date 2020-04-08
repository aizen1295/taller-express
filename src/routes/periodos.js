const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/listar', async (req, res) => {
	const periodo = await pool.query('SELECT * FROM periodos');

	res.render('periodo_academico/listar', { periodo });
});

module.exports = router;
