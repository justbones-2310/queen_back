var pool = require('./bd');

async function getAdministrador() {
    var query = 'select * from administrador order by id desc';
    var rows = await pool.query(query);
    return rows;
}

async function insertAdministrador(obj) {
    try {
        var query = "insert into administrador set ?";
        var rows = await pool.query(query, [obj])
        return rows;
    } catch (error) {
        console.log(error);
        throw error;
    }
}

async function deleteAdministradorById(id) {
    var query = 'delete from administrador where id = ?';
    var rows = await pool.query(query, [id]);
    return rows;
}

async function getAdministradorById(id) {
    var query = 'select * from administrador where id = ?';
    var rows = await pool.query(query, [id]);
    return rows[0];
}

async function modificarAdministradorById(obj, id) {
    try {
        var query = 'update administrador set ? where id= ?';
        var rows = await pool.query(query, [obj, id]);
        return rows;
    } catch (error) {
        throw error;
    }
}


module.exports = {
    getAdministrador, insertAdministrador, deleteAdministradorById,
    getAdministradorById, modificarAdministradorById
}