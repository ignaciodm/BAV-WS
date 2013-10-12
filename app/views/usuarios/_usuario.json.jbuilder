json.(usuario, :id, :nombre, :apellido, :dni, :email, :telefono, :fecha_de_nacimiento, :authentication_token, :failed_attempts, :access_locked?)
json.direcciones usuario.direcciones do |direccion|
    json.partial! 'direcciones/resume', direccion: direccion
end


