json.denuncias @denuncias do |denuncia|
    json.partial! 'resume', denuncia: denuncia
end
