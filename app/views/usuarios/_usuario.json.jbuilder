if usuario.is_comisaria?
    json.(usuario, :id, :email)
    json.comisaria do
        json.partial! 'comisarias/resume', comisaria: usuario.comisaria
    end
else
    json.(usuario, :id, :nombre, :apellido, :dni, :email, :telefono)
    json.fechaDeNacimiento usuario.fecha_de_nacimiento
    json.direcciones usuario.direcciones do |direccion|
        json.partial! 'direcciones/resume', direccion: direccion
    end
end
json.authToken  usuario.authentication_token
json.bloqueado usuario.access_locked?


