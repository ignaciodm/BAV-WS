ActiveAdmin.register Partido do

  menu :if => Proc.new { |c|
    current_usuario.admin?
  }

  index do |f|
    column :id
    column :nombre
    column :provincia do |partido|
      partido.provincia.nombre
    end
    column :created_at
    column :updated_at

    default_actions
  end

  show do
    attributes_table do
      row :id
      row :nombre
      row :provincia do
       partido.provincia.nombre
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|

    f.inputs 'Partido' do
      f.input :nombre
      f.input :provincia, :as => :select, :member_label => :nombre
    end

    f.buttons
  end

end
