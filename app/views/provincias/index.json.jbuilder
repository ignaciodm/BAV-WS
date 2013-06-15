json.provincias @provincias do |provincia|
    json.partial! 'provincia', provincia: provincia
    json.show_url provincia_url(provincia)
    json.partidos_url provincia_partidos_url(provincia_id: provincia.id)
end
