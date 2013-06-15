json.partial! 'provincia', provincia: @provincia
json.partidos_url provincia_partidos_url(provincia_id: @provincia.id)