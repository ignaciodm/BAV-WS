json.localidades @localidades do |localidad|
    json.partial! 'localidad', localidad: localidad
    json.show_url localidad_url(id: localidad.id)
    json.partido do |json|
        partido = localidad.partido
        json.partial! 'partidos/partido', partido: partido
        json.show_url provincia_partido_url(provincia_id: partido.provincia.id, id: partido.id)
    end
end
