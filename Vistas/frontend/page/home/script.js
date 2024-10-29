window.onload = async () => {
    let select = document.querySelector('#selTipo');
    let seleccion = select.value;
    select.addEventListener('change', async () => {
        seleccion = select.value;
        let datos = await obtenerVista(seleccion);
        console.log(datos);
        mostrarProductos(datos);
        return
    });
    
}

function mostrarProductos(datos){
    let tBody = document.getElementById("tBodyProductos");
    tBody.innerHTML = "";

    datos.forEach(dato => {
        let fila = document.createElement("tr");
        fila.innerHTML += `
            <td>${dato.id}</td>
            <td>${dato.nombre}</td>
            <td>${dato.precio}</td>
            <td>${dato.stock}</td>
        `;
        tBody.appendChild(fila);
    });
}

async function obtenerVista(vista){
    let formdata = new FormData();
    formdata.append('vista', vista);
    let url = "http://localhost/ejercicio_view/backend/controller/ProductoController.php?fun=mv";
    let config = {
        method: 'POST',
        body: formdata
    }
    let consulta = await fetch(url, config);
    let datos = await consulta.json();

    return datos.data;
}


