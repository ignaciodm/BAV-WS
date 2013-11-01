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

ActiveRecord::Schema.define(:version => 20131030005542) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "comisarias", :force => true do |t|
    t.string   "nombre",     :limit => 50,  :null => false
    t.string   "calle",      :limit => 100, :null => false
    t.integer  "numero",                    :null => false
    t.string   "telefono",   :limit => 50,  :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "usuario_id",                :null => false
  end

  create_table "comisarias_localidades", :id => false, :force => true do |t|
    t.integer "comisaria_id"
    t.integer "localidad_id"
  end

  add_index "comisarias_localidades", ["comisaria_id", "localidad_id"], :name => "index_comisarias_localidades_on_comisaria_id_and_localidad_id", :unique => true

  create_table "denuncia", :force => true do |t|
    t.integer  "comisaria_id",                  :null => false
    t.integer  "direccion_id",                  :null => false
    t.string   "estado",       :default => "a"
    t.string   "observacion"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "direcciones", :force => true do |t|
    t.string   "descripcion",   :null => false
    t.string   "calle",         :null => false
    t.integer  "numero",        :null => false
    t.integer  "piso"
    t.string   "departamento"
    t.string   "comentarios"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "localidad_id",  :null => false
    t.integer  "usuario_id",    :null => false
    t.integer  "comisaria_id",  :null => false
    t.string   "entre_calle_1"
    t.string   "entre_calle_2"
  end

  add_index "direcciones", ["id", "comisaria_id"], :name => "index_direcciones_on_id_and_comisaria_id", :unique => true
  add_index "direcciones", ["id", "localidad_id"], :name => "index_direcciones_on_id_and_localidad_id", :unique => true
  add_index "direcciones", ["id", "usuario_id"], :name => "index_direcciones_on_id_and_usuario_id", :unique => true

  create_table "localidades", :force => true do |t|
    t.string   "nombre",     :null => false
    t.integer  "partido_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "localidades", ["nombre", "partido_id"], :name => "index_localidades_on_nombre_and_partido_id", :unique => true
  add_index "localidades", ["nombre"], :name => "index_localidades_on_nombre"

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

  create_table "usuarios", :force => true do |t|
    t.string   "email",                                :default => "",    :null => false
    t.string   "encrypted_password",                   :default => "",    :null => false
    t.string   "nombre",                 :limit => 50,                    :null => false
    t.string   "apellido",               :limit => 50,                    :null => false
    t.string   "dni",                    :limit => 25,                    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                      :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.boolean  "admin",                                :default => false
    t.string   "telefono",               :limit => 50,                    :null => false
    t.date     "fecha_de_nacimiento",                                     :null => false
    t.boolean  "is_comisaria",                         :default => false
    t.boolean  "bloqueado_comisaria",                  :default => false
  end

  add_index "usuarios", ["authentication_token"], :name => "index_usuarios_on_authentication_token", :unique => true
  add_index "usuarios", ["confirmation_token"], :name => "index_usuarios_on_confirmation_token", :unique => true
  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true
  add_index "usuarios", ["unlock_token"], :name => "index_usuarios_on_unlock_token", :unique => true

end
