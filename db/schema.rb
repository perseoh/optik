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

ActiveRecord::Schema.define(:version => 20120510124837) do

  create_table "citas", :force => true do |t|
    t.integer  "user_id"
    t.integer  "cliente_id"
    t.string   "texto"
    t.datetime "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clientes", :force => true do |t|
    t.integer  "user_id"
    t.string   "nombre"
    t.string   "ciudad"
    t.string   "direccion"
    t.string   "provincia"
    t.string   "codigo"
    t.integer  "cp"
    t.string   "telefono"
    t.integer  "grupo_id"
    t.string   "notas"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "excels", :force => true do |t|
    t.string   "archivo"
    t.string   "estado"
    t.integer  "piezas_12m"
    t.integer  "piezas_last_pedido"
    t.integer  "piezas_pendientes"
    t.integer  "piezas_fact_last_mes"
    t.integer  "fecha_last_pedido"
    t.integer  "nombre"
    t.integer  "ciudad"
    t.integer  "direccion"
    t.integer  "provincia"
    t.integer  "codigo"
    t.integer  "cp"
    t.integer  "telefono"
    t.integer  "grupo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marcas", :force => true do |t|
    t.integer  "user_id"
    t.string   "codigo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notas", :force => true do |t|
    t.integer  "user"
    t.integer  "cliente"
    t.string   "texto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tareas", :force => true do |t|
    t.integer  "cliente_id"
    t.string   "texto"
    t.integer  "user_id"
    t.datetime "fecha"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ventas", :force => true do |t|
    t.integer  "user_id"
    t.integer  "cliente_id"
    t.integer  "marca_id"
    t.integer  "piezas_12m"
    t.integer  "piezas_last_pedido"
    t.integer  "piezas_pendientes"
    t.integer  "piezas_fact_last_mes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
