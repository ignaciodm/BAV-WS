json.(@comisaria, :id, :nombre, :calle, :numero, :telefono)
json.localidades @comisaria.localidades do |localidad|
  json.partial! 'localidades/resume', localidad: localidad
end