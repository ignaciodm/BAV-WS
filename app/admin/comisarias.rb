ActiveAdmin.register Comisaria do

  index do |f|
    column :id
    column :nombre
    column :calle
    column :numero
    column :telefono
    column :localidades do |comisaria|
        comisaria.localidades.map(&:nombre).sort.join(', ')
    end
    default_actions
  end

  show do
    attributes_table do
      row :id
      row :nombre
      row :calle
      row :numero
      row :telefono
      row :localidades do |comisaria|
          comisaria.localidades.map(&:nombre).sort.join(', ')
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|

    f.inputs 'Comisaria' do
      f.input :nombre
      f.input :calle
      f.input :numero
      f.input :telefono
      f.input :localidades, :as => :check_boxes,
              :member_label => :form_name,
              :label => "Create a tracked accounts to",
              :collection => Localidad.order('nombre asc').all
    end

    f.buttons
  end

end
