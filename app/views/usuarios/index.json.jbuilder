json.usuarios @usuarios do |usuario|
    json.partial! 'usuario', usuario: usuario
end
