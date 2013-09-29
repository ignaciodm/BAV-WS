json.(usuario, :id, :nombre, :apellido)
json.direcciones usuario.direcciones do |direccion|
    json.partial! 'direcciones/resume', direccion: direccion
end