ActiveAdmin.register Localidad do

  index do |f|
    column :id
    column :nombre
    column :partido do |localidad|
      localidad.partido.nombre
    end
    column :provincia do |localidad|
      localidad.partido.provincia.nombre
    end
    column :comisarias do |localidad|
        localidad.comisarias.map(&:nombre).sort.join(', ')
    end
    column :created_at
    column :updated_at

    default_actions
  end

  show do
    attributes_table do
      row :id
      row :nombre
      row :partido do
        localidad.partido.nombre
      end
      row :provincia do
        localidad.partido.provincia.nombre
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|

    f.inputs 'Localidad' do
      f.input :nombre
      f.input :partido, :as => :select, :member_label => :nombre
    end

    f.buttons
  end

end
