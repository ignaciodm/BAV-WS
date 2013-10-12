json.(usuario, :id, :nombre, :apellido, :dni, :email, :telefono)
json.fechaDeNacimiento usuario.fecha_de_nacimiento
json.authToken  usuario.authentication_token
json.bloqueado usuario.access_locked?
json.direcciones usuario.direcciones do |direccion|
    json.partial! 'direcciones/resume', direccion: direccion
end


