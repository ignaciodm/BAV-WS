if direccion
    json.(direccion, :id, :descripcion, :numero, :calle, :piso,:departamento,:comentarios)
    json.entreCalle1 direccion.entre_calle_1
    json.entreCalle2 direccion.entre_calle_2

    if direccion.comisaria
        json.comisaria direccion.comisaria, :id, :nombre
    end

    if direccion.localidad
        json.localidad direccion.localidad, :id, :nombre

        if direccion.localidad && direccion.localidad.partido

            json.partido direccion.localidad.partido, :id, :nombre

            if direccion.localidad && direccion.localidad.partido && direccion.localidad.partido.provincia

                json.provincia direccion.localidad.partido.provincia, :id, :nombre

            end
        end
    end

    if direccion.usuario
        json.showUrl usuario_direccion_url(direccion.usuario, direccion)
    end
end

