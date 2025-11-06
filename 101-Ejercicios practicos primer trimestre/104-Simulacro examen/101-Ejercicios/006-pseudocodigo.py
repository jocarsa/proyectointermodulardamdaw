import mysql.connector                    # Importo el conector a base de datos
from flask import Flask                   # Importo la libreria Flask

conexion = mysql.connector.connect(
  host="localhost",
  user="portafolioceac",
  password="portafolioceac",
  database="portafolioceac"
  )                                       # Me conecto a la base de datos
cursor = conexion.cursor()                # Creo un cursor
app = Flask(__name__)                     # Creo una aplicación Flask (web)

@app.route("/")                           # Atrapo la ruta raiz (/)
def holamundo():                          # Defino una funcion
  cursor.execute("SELECT * FROM piezas_y_categorias;")  # Pido el contenido de la vista

  filas = cursor.fetchall()                 # Lo guardo en una lista
  ########### AQUI PONGO EL INICIO HASTA EL MAIN
  cadena = ""                               # Creo una cadena vacia
  ########### AQUI PONGO LO QUE SE REPITE
  for fila in filas:                        # Para cada elemento de la lista
    cadena += str(fila)                     # Añado el registro a la cadena
  ########### AQUI PONGO EL FINAL
  cadena + = ""
  return cadena                             # Devuelvo la cadena como HTML en la web

if __name__ == "__main__":                # Si este es el archivo principal
    app.run(debug=True)                   # Ejecuta la web
