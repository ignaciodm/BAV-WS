json.localidades @localidades do |localidad|
    json.partial! 'resume', localidad: localidad
    json.partido do |json|
        json.partial! 'partidos/resume', partido: localidad.partido
    end
end
