ActiveAdmin.register Usuario do
  index do                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count
    column :admin
    column :comisaria
    column :bloqueado_comisaria
    column :bloquear, :as => :block do |usuario|
      div do
        link_to "#{usuario.bloqueado_comisaria ? 'Desbloquear': 'Bloquear'}", "#" , :id => "bloqueo-#{usuario.id}", :class => "#{usuario.bloqueado_comisaria ? 'js-desbloqueo': 'js-bloqueo'}"
      end
    end
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
      f.input :is_comisaria
    end
    f.actions                         
  end                                 
end                                   
