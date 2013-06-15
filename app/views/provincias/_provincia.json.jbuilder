json.(provincia, :id, :nombre)
json.partidos provincia.partidos do |partido|
    json.partial! 'partidos/resume', partido: partido
end