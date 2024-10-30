window.onload = async () => {
    let select = document.querySelector('#selTipo');
    let seleccion = select.value;
    limpiarTablas();

    select.addEventListener('change', async () => {
        limpiarTablas();
        seleccion = select.value;
        let datos = await obtenerVista(seleccion);
        
        if (seleccion === "ordenes_clientes"){
            let tabla = document.getElementById('tablaClientes');
            tabla.style.display = "table";
            mostrarCliente(datos);
            return;
        }

        let tabla = document.getElementById('tablaProductos');
        tabla.style.display = "table";
        mostrarProductos(datos);
        return
    });
    
}

function limpiarTablas(){
    let tablas = document.querySelectorAll('table');
    tablas.forEach(tabla => {
        tabla.style.display = "none";
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

function mostrarCliente(datos){
    let tBody = document.getElementById("tBodyClientes");
    tBody.innerHTML = "";

    datos.forEach(dato => {
        let fila = document.createElement("tr");
        fila.innerHTML += `
            <td>${dato.orden_id}</td>
            <td>${dato.fecha_orden}</td>
            <td>${dato.total_orden}</td>
            <td>${dato.cliente_id}</td>
            <td>${dato.nombre_cliente}</td>
            <td>${dato.email_cliente}</td>
            <td>${dato.direccion_cliente}</td>
            <td>${dato.telefono_cliente}</td>
        `;
        tBody.appendChild(fila);
    });
}
async function obtenerVista(vista){
    let formdata = new FormData();
    formdata.append('vista', vista);
    let url = "http://localhost/Vistas/backend/controller/ProductoController.php?fun=mv";
    let config = {
        method: 'POST',
        body: formdata
    }
    let consulta = await fetch(url, config);
    let datos = await consulta.json();

    return datos.data;
}


