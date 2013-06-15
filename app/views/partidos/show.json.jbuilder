json.partial! 'partido', partido: @partido
json.localidades_url partido_localidades_url(partido_id: @partido.id)
json.provincia do |json|
    json.partial! 'provincias/provincia', provincia: @partido.provincia
    json.show_url provincia_url(@partido.provincia)
end