if localidad
    json.(localidad, :id, :nombre)
    json.showUrl localidad_url(id: localidad.id)
end