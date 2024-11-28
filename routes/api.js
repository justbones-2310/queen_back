var express = require('express');
var router = express.Router();
var administradorModel = require('./../models/administradorModel');
var cloudinary = require('cloudinary').v2;

router.get('/administrador', async function (req, res, next) {
    var administrador = await administradorModel.getAdministrador();

    administrador = administrador.map(administrador => {

        if (administrador.img_id) {
            const imagen = cloudinary.url(administrador.img_id, {
                width: 960,
                height: 200,
                crop: 'fill'
            });

            return {
                ...administrador,
                imagen
            }

        } else {
            return {
                ...administrador,
                imagen: ''
            }
        }
    });

    res.json(administrador);
});

module.exports = router;