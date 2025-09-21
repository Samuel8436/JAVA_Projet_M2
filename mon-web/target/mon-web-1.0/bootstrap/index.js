function id_del(id) {
    let var_id = Number(id);
    document.form_app.id_to_del.value = var_id;
}

function close_msg() {
    document.getElementById('close_suppr').style.display="none";
}
