# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    provincias = [{nombre: 'Capital Federal',
                   partidos: [{nombre: 'San Isidro',
                               localidades: ['Villa Adelina', 'Boulogne', 'Martinez', 'Acassuso', 'San Isidro', 'Beccar']}]},
                  {nombre: 'Buenos Aires'},
                  {nombre: 'Catamarca'},
                  {nombre: 'Chaco'},
                  {nombre: 'Chubut'},
                  {nombre: 'Cordoba'},
                  {nombre: 'Corrientes'},
                  {nombre: 'Entre Rios'},
                  {nombre: 'Formosa'}, 
                  {nombre: 'Jujuy'},
                  {nombre: 'La Pampa'}, 
                  {nombre: 'La Rioja'}, 
                  {nombre: 'Mendoza'},
                  {nombre: 'Misiones'},
                  {nombre: 'Neuquen'},
                  {nombre: 'Rio Negro'},
                  {nombre: 'Salta'},
                  {nombre: 'San Juan'},
                  {nombre: 'San Luis'},
                  {nombre: 'Santa Cruz'},
                  {nombre: 'Santa Fe'},
                  {nombre: 'Santiago del Estero'},
                  {nombre: 'Tierra del Fuego'},
                  {nombre: 'Tucuman'}]

    provincias.each do |provincia|
      partidos = provincia[:partidos]
      provincia = Provincia.create!({nombre: provincia[:nombre]})

      if partidos

        partidos.each do |partido|
          localidades = partido[:localidades]
          partido = Partido.create!({nombre: partido[:nombre], provincia_id: provincia.id})

          if localidades
            localidades.each do |localidad|
              Localidad.create!({nombre: localidad, partido_id: partido.id })
            end
          end

        end

      end
    end



