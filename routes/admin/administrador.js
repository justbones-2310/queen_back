var express = require('express');
var router = express.Router();
var administradorModel = require('../../models/administradorModel')
const util = require('util');
const cloudinary = require('cloudinary').v2;
const uploader = util.promisify(cloudinary.uploader.upload);
const destroy = util.promisify(cloudinary.uploader.destroy);


router.get('/', async function (req, res, next) {
    var administrador = await administradorModel.getAdministrador();

    administrador = administrador.map(administrador => {

        if (administrador.img_id) {
            const imagen = cloudinary.image(administrador.img_id, {
                width: 50,
                height: 50,
                crop: 'fill' //pad
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

    res.render('admin/administrador', {
        layout: 'admin/layout',
        usuario: req.session.nombre,
        administrador
    });
});

router.get('/agregar', (req, res, next) => {
    res.render('admin/agregar', {
        layout: 'admin/layout'
    })
});

router.post('/agregar', async (req, res, next) => {
    try {

        var img_id = '';
        //console.log(req.files.imagen);

        if (req.files && Object.keys(req.files).length > 0) {
            imagen = req.files.imagen;
            img_id = (await uploader(imagen.tempFilePath)).public_id;
        }

        if (req.body.titulo != "" && req.body.subtitulo != "" && req.body.cuerpo != "") {

            await administradorModel.insertAdministrador({
                ...req.body,
                img_id
            });
            res.redirect('/admin/administrador')
        } else {
            res.render('admin/agregar', {
                layout: 'admin/layout',
                error: true, message: 'Por favor, completar todos los campos'
            })
        }
    } catch (error) {
        console.log(error)
        res.render('admin/agregar', {
            layout: 'admin/layout',
            error: true, message: 'No se actualizo la info'
        });
    }
});


router.get('/eliminar/:id', async (req, res, next) => {
    var id = req.params.id;

    var administrador = await administradorModel.getAdministradorById(id);
    if (administrador.img_id) {
        await (destroy(administrador.img_id));
    }

    await administradorModel.deleteAdministradorById(id);
    res.redirect('/admin/administrador');
});

router.get('/modificar/:id', async (req, res, next) => {

    var id = req.params.id;

    var administrador = await administradorModel.getAdministradorById(id);

    res.render('admin/modificar', {
        layout: 'admin/layout',
        administrador
    })
});

router.post('/modificar', async (req, res, next) => {
    try {

        var img_id = req.body.img_original;
        var borrar_img_vieja = false;

        if (req.body.img_delete === "1") {
            img_id = null;
            borrar_img_vieja = true;
        } else {
            if (req.files && Object.keys(req.files).length > 0) {
                imagen = req.files.imagen;
                img_id = (await uploader(imagen.tempFilePath)).public_id;
                borrar_img_vieja = true;
            }
        }
        if (borrar_img_vieja && req.body.img_original) {
            await (destroy(req.body.img_original));
        }

        var obj = {
            titulo: req.body.titulo,
            subtitulo: req.body.subtitulo,
            cuerpo: req.body.cuerpo,
            img_id
        }
        console.log(obj)

        await administradorModel.modificarAdministradorById(obj, req.body.id);

        res.redirect('/admin/administrador');

    } catch (error) {

        console.log(error)

        res.render('/admin/modificar', {
            layout: 'admin/layout',
            error: true, message: 'No se realizaron modificaciones'
        })
    }
});

module.exports = router;

