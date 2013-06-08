# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130608004338) do

  create_table "comisarias", :force => true do |t|
    t.string   "nombre",     :limit => 50,  :null => false
    t.string   "calle",      :limit => 100, :null => false
    t.integer  "numero",                    :null => false
    t.string   "telefono",   :limit => 50,  :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "comisarias_localidades", :id => false, :force => true do |t|
    t.integer "comisaria_id"
    t.integer "localidad_id"
  end

  add_index "comisarias_localidades", ["comisaria_id", "localidad_id"], :name => "index_comisarias_localidades_on_comisaria_id_and_localidad_id", :unique => true

  create_table "direcciones", :force => true do |t|
    t.string   "descripcion",  :null => false
    t.string   "calle",        :null => false
    t.integer  "numero",       :null => false
    t.integer  "piso"
    t.string   "departamento"
    t.string   "comentarios"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "localidad_id", :null => false
  end

  create_table "localidades", :force => true do |t|
    t.string   "nombre",     :null => false
    t.integer  "partido_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "localidades", ["nombre", "partido_id"], :name => "index_localidades_on_nombre_and_partido_id", :unique => true
  add_index "localidades", ["nombre"], :name => "index_localidades_on_nombre"

  create_table "localidades_comisarias", :id => false, :force => true do |t|
    t.integer "localidad_id"
    t.integer "comisaria_id"
  end

  create_table "partidos", :force => true do |t|
    t.string   "nombre",       :null => false
    t.integer  "provincia_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "partidos", ["nombre", "provincia_id"], :name => "index_partidos_on_nombre_and_provincia_id", :unique => true
  add_index "partidos", ["nombre"], :name => "index_partidos_on_nombre"

  create_table "provincias", :force => true do |t|
    t.string   "nombre",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "provincias", ["nombre"], :name => "index_provincias_on_nombre", :unique => true

end
