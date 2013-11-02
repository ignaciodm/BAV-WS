ActiveAdmin.register Provincia do

  menu :if => Proc.new { |c|
    current_usuario.admin?
  }
  
end
