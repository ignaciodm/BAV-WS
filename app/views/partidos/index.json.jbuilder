json.partidos @partidos do |partido|
    json.partial! 'resume', partido: partido
end
