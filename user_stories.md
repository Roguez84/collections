## Cualquier persona
- DUS000 Cualquier persona puede entrar a pagina root y le aparecen 2 botones: "Soy Paciente" o "Soy Doctor" (pagina ...com/)
- UUS000 Boton "soy doctor" redirige a (pagina ...com/Doctores/) formulario para crear cuenta o hacer log in
- UUS001 Boton "Soy paciente" redirige a pagina para hacer busqueda (pagina ...com/Pacientes/)

## Doctor
### Manejo de Horas existentes
- DUS010 Doctor entra a la plataforma con login y password y ve un dashboard DASHBOARD 1 (pagina ...com/Doctores/Nombre)
- UUS010 Doctor puede filtrar y Ordenar DASHBOARD 1 por cualquiera de sus columnas (pagina ...com/Doctores/Nombre)
- UUS011 Doctor puede ver un calendario por semana con el nombre del paciente
- DUS011 Doctor puede crear una hora nueva (pagina ...com/Doctores/Nombre)
- UUS011 Doctor al crear una hora nueva puede ingresar un paciente nuevo al sistema (pagina ...com/Doctores/Nombre)
- DUS012 Doctor puede editar una hora existente (pagina ...com/Doctores/Nombre)
- DUS013 Doctor puede borrar una hora existente (pagina ...com/Doctores/Nombre)
- DUS030 Doctor puede pinchar un link para ser dirigido a una vista con dashboard por boleta DASHBOARD 2 (redirige a ...com/Doctores/boletas)
- DUS020 Doctor puede pinchar un link para ser dirigido a una vista igual a DASHBOARD 1 pero con posibilidad de agrupar (redirige a ...com/Doctores/Nueva_boleta)


### Crear Boleta
- DUS020 Doctor puede pinchar un boton para crear nueva boleta en base a agrupacion anteriod y es redirigido a DASHBOARD 2 (redirige a ...com/Doctores/boletas)

### Manejo de Boletas
- UUS030 Doctor puede filtrar y Ordenar DASHBOARD 2 por cualquiera de sus columnas (pagina ...com/Doctores/boletas)
- DUS031 Doctor ve un grafico de barras de boletas pagadas vs no pagadas por mes (...com/Doctores/boletas)
- DUS032 Doctor puede apretar un boton (localizado al lado de cada boleta) para enviar un email al paciente (...com/Doctores/boletas)
- UUS032 Doctor envia email automatico por boton DUS022 que contiene un link que dirige al paciente a hacer un pago por el monto correspondiente a la boleta
- Doctor puede manualmente cambiar el estatus de boleta pagado/no pagado


## Pacientes
### Paciente no registrado
- DUS110 Paciente accede a una pagina con un buscador por nombre y/o especialidad de doctor (pagina ...com//)
- DUS120Al realizarse y seleccionar un doctor, el paciente puede llenar un formulario y enviarle un mensaje predeterminado consultando por disponibilidad

### Paciente registrado vista de horas existentes
- DUS130 Ve el mismo buscador que el paciente no registrado, pero ademas ve un Dashboard Con informacion sore sus horas pasadas y futuras
- DUS140 Paciente puede acceder (mediante a un link) a pagina con todas sus Boletas pagadas y pendientes

####  Paciente registrado - Boletas
- DUS140 Paciente ve dashboard de boletas
- Al lado de cada boleta hay un boton que redirige a pagar la boletas por paypal

















## NO LEER DE AQUI PARA ABAJO
#############################################################
#############################################################
## NO LEER DE AQUI PARA ABAJO
Vista por fecha:
- Fecha
- Hora
- Nombres Paciente (Tabla - Pacientes)
- Apellidos Paciente (Tabla - Pacientes)
- Lugar de Atencion (Tabla - Lugares)
- $ Total por atencion (Tabla - )
- # boleta (Tabla - Boletas)
- Status de pago (Tabla - Boletas)


Vista por Paciente:
- Nombres Paciente (Tabla - Pacientes)
- Apellidos Paciente (Tabla - Pacientes)
- Email Paciente (Table - Pacientes)
- # boleta (Tabla - Boletas)
- Status de pago (Tabla - Boletas)



Vista por Boleta
- # boleta (Tabla - Boletas)
- $ Total boleta
- Status de pago (Tabla - Boletas)
- Nombres Paciente
- Apellidos Paciente


#### Tablas:
Pacientes: (has_many :atenciones)
- ID: primary_key
- RUT:integer
- Nombres:string
- Apellidos:string
- Email:email

Doctores: (has_many :atenciones)
- ID: primary_key
- RUT:integer
- Nombres:string
- Apellidos:string
- Email:email
- Especialidad:string


Atenciones: (Belongs_to :Doctor, Belongs_to :Pacientes, Belongs_to :Boletas)
- ID: primary_key
- Fecha: date_time
- Hora: date_time
- ID_pacientes: Foreign Key
- ID_doctores: Foreign Key
- ID_boletas: Foreign Key
- $ Prestacion

Boletas: (has_many :atenciones)
- ID: primary_key
- #Boleta:integer
- Status: Boolean



////////////
ESTAS TABLAS NO VAN A ESTAR POR AHORA
Lugares:
- ID: primary_key
- Direccion:string
- Direccion 2 (# apt):string
- Comuna:string


Prestaciones (Belongs_to :atencion, has_and_belongs_to_many :doctores)
- ID: primary_key
- Nombre Prestacion
- Precio Prestacion
- ID_doctores: Foreign Key
////////////
