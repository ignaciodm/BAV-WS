json.comisarias @comisarias do |comisaria|
    json.(comisaria, :id, :nombre, :calle, :numero, :telefono)
    json.localidades comisaria.localidades, :id, :nombre
end
