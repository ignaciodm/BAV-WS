json.(localidad, :id, :nombre)
json.partido do |json|
    json.partial! 'partidos/resume', partido: localidad.partido
end
json.comisarias localidad.comisarias do |comisaria|
    json.partial! 'comisarias/resume', comisaria: comisaria
end
