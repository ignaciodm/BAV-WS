ActiveAdmin.register Usuario do
  index do                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count
    column :admin
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do
      f.input :nombre
      f.input :apellido
      f.input :dni
      f.input :email
      f.input :telefono
      f.input :fecha_de_nacimiento
      f.input :password               
      f.input :password_confirmation
      f.input :admin
    end                               
    f.actions                         
  end                                 
end                                   
