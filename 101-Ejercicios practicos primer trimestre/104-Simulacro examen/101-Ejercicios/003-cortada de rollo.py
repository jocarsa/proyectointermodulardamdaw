import mysql.connector                    # Importo el conector a base de datos

conexion = mysql.connector.connect(
  host="localhost",
  user="portafolioceac",
  password="portafolioceac",
  database="portafolioceac"
  )                                       # Me conecto a la base de datos
  
cursor = conexion.cursor()                # Creo un cursor

cursor.execute("SELECT * FROM piezas_y_categorias;")  # Pido el contenido de la vista

filas = cursor.fetchall()                 # Lo guardo en una lista

for fila in filas:                        # Para cada elemento de la lista
  print(fila)                             # Lo pinto en pantalla

