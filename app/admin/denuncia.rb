ActiveAdmin.register Denuncia do

    index :title => proc {"Denuncias"} do |f|
      if current_usuario.admin?
        column :id
        column :estado
        column :observacion
        column :direccion
        column :comisaria
        column :created_at
        column :updated_at

        default_actions
      else
        if current_usuario.is_comisaria
          column :estado do |denuncia|
            denuncia.estado == 'c' ? 'Cerrado' : 'Abierto'
          end
          column :observacion
          column :direccion do |denuncia|

            dir = denuncia.direccion

            if dir
              s = "#{dir.calle} #{dir.numero} #{dir.piso} #{dir.departamento}"

              if !dir.entre_calle_1.blank? && !dir.entre_calle_2.blank?
                s = s.concat(" entre #{dir.entre_calle_1} y #{dir.entre_calle_2}")
              end

              s.concat(" - #{dir.localidad.nombre}")

              s
            end

          end
          column :usuario do |denuncia|

            u = denuncia.direccion && denuncia.direccion.usuario

            if u
              s = "#{u.nombre} #{u.apellido} (#{u.edad})"

              s
            end

          end
          column :comisaria do |denuncia|
            c = denuncia.comisaria
            if c
              "#{c.nombre} (#{c.calle} #{c.numero} - #{c.telefono})"
            end
          end
          column 'Fecha', :created_at
        end
      end
    end

    show do
      attributes_table do
        row :id
        row :estado
        row :observacion
        row :direccion
        row :comisaria
        row :created_at
        row :updated_at
      end
    end

    form do |f|

      f.inputs 'Denuncia' do
        f.input :estado
        f.input :direccion, :as => :select, :member_label => :descripcion
        f.input :comisaria, :as => :select, :member_label => :nombre
      end

      f.buttons
    end

end

