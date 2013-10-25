if comisaria
    json.(comisaria, :id, :nombre, :calle, :numero, :telefono)
    json.showUrl comisaria_url(comisaria)
end