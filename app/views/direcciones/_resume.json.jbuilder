json.(direccion, :id, :descripcion, :numero, :calle, :piso,:departamento)
json.entreCalle1 direccion.entre_calle_1
json.entreCalle2 direccion.entre_calle_2
json.comisaria direccion.comisaria, :id, :nombre
json.localidad direccion.localidad, :id, :nombre
json.partido direccion.localidad.partido, :id, :nombre
json.provincia direccion.localidad.partido.provincia, :id, :nombre
json.showUrl direccion_url(direccion.usuario, direccion)

