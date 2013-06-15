json.partidos @partidos do |partido|
    json.partial! 'partido', partido: partido
    json.show_url provincia_partido_url(provincia_id: partido.provincia.id, id: partido.id)
    json.localidades_url partido_localidades_url(partido_id: partido.id)
    json.provincia do |json|
        json.partial! 'provincias/provincia', provincia: partido.provincia
        json.show_url provincia_url(partido.provincia)
    end
end
