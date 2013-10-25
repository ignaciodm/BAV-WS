if provincia
    json.(provincia, :id, :nombre)
    json.showUrl provincia_url(provincia)
end