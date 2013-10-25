if denuncia
    json.(denuncia, :id, :estado, :observacion)
    json.comisaria do
        json.partial! 'comisarias/resume', comisaria: denuncia.comisaria
    end
    json.direccion do
        json.partial! 'direcciones/resume', direccion: denuncia.direccion
    end
    json.usuario do
        json.partial! 'usuarios/usuario', usuario: denuncia.direccion && denuncia.direccion.usuario
    end
end
