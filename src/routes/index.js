const express = require('express');
const router = express.Router();

router.get('/',(req,res) => {
 //res.send('Hello World');
 const data = {
    "nombre":"leonardo",
    "apellido":"jimenez",
 };
res.json(data);
});
module.exports = router;
