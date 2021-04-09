# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Appointment.destroy_all
#Doctor.destroy_all



######### Pacientes
# t.string "RUT", null: false
# t.string "names"
# t.string "surnames"
# t.string "email"
# t.string "address"


# 50.times do
#     rut = Faker::ChileRut.full_rut
#     nombre = Faker::Name.first_name
#     apellido = Faker::Name.last_name
#     mail = Faker::Internet.email(name: "#{nombre}+.+#{apellido}")
#     direccion = Faker::Address.street_address
#     duplicate = Patient.find_by(RUT: rut) || Patient.find_by(email: mail)
#     if !duplicate
#             Patient.create(
#                 [
#                     {
#                         RUT: rut,
#                         names: nombre,
#                         surnames: apellido,
#                         email: mail,
#                         address: direccion
#                     }
#                 ]
#             )
#     end
# end
#########################3

############## Doctores
# t.string "RUT", null: false
# t.string "names"
# t.string "surnames"
# t.string "specialty"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.string "email", default: "", null: false
# t.string "encrypted_password", default: "", null: false





# 10.times do
#     rut = Faker::ChileRut.full_rut
#     nombre = Faker::Name.first_name
#     apellido = Faker::Name.last_name
#     mail = Faker::Internet.email(name: "#{nombre}+.+#{apellido}")
#     especialidad = "Dentist"
#     duplicate = Doctor.find_by(RUT: rut) || Doctor.find_by(email: mail)
#     if !duplicate
#             Doctor.create(
#                 [
#                     {
#                         RUT: rut,
#                         names: nombre,
#                         surnames: apellido,
#                         email: mail,
#                         specialty: especialidad,
#                         password: '123456'
#                     }
#                 ]
#             )
#     end
# end
##################



########### appointments
#Appointment.destroy_all

# t.datetime "date_time", null: false
# t.integer "cost"
# t.bigint "patient_id"
# t.bigint "doctor_id"
# t.bigint "invoice_id"
# t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
# t.index ["invoice_id"], name: "index_appointments_on_invoice_id"
# t.index ["patient_id"], name: "index_appointments_on_patient_id"


100.times do
    hora_fecha = Faker::Time.between_dates(from: Date.today - 60, to: Date.today +  30, period: :day)
    monto = rand(9990..99990)
    paciente = rand(Patient.minimum(:id)..Patient.maximum(:id))
    doctor = rand(Doctor.minimum(:id)..Doctor.maximum(:id))
    boleta = rand(Invoice.minimum(:id)..Invoice.maximum(:id))
            Appointment.create(
                [
                    {
                        date_time: hora_fecha,
                        cost: monto,
                        patient_id: paciente,
                        doctor_id: doctor,
                    }
                ]
            )
end


######################

############## Boletas
# t.integer "invoice_num"
# t.integer "invoice_amt"
# t.boolean "paid_status", default: false
# t.datetime "invoice_date"

# 10.times do
#     numero = rand(111111..999999)
#     duplicate = Invoice.find_by(invoice_num: numero)
#     if !duplicate
#             Invoice.create(
#                 [
#                     {
#                         invoice_num: numero
#                     }
#                 ]
#             )
#     end
# end
