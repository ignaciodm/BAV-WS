json.(partido, :id, :nombre)
json.localidades partido.localidades do |localidad|
    json.partial! 'localidades/resume', localidad: localidad
end
json.provincia do |json|
    json.partial! 'provincias/resume', provincia: partido.provincia
end