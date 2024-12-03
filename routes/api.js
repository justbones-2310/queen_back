var express = require('express');
var router = express.Router();
var administradorModel = require('./../models/administradorModel');
var cloudinary = require('cloudinary').v2;
var nodemailer = require('nodemailer');

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

//finalizo administrador

//inicio de contacto
router.post('/contacto', async (req, res) => {
    const mail = {
        to: 'justbones2310@gmail.com',
        subject: 'Contacto Web',
        html: `${req.body.nombre} se contacto a través de la página
        web y quiere más información a este correo: ${req.body.email} 
        <br> Además, hizo el siguiente comentario: ${req.body.mensaje}
        <br> Su país de origen es ${req.body.pais}`
    }
    const transport = nodemailer.createTransport({
        host: process.env.SMTP_HOST,
        port: process.env.SMTP_PORT,
        auth: {
            user: process.env.SMTP_USER,
            pass: process.env.SMTP_PASS
        }
    });
    await transport.sendMail(mail)

    res.status(201).json({
        error: false,
        message: 'Mensaje enviado'
    });
});
//finalizo contacto


module.exports = router;