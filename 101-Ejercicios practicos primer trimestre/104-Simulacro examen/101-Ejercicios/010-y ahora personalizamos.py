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
  cadena = ''' 
    <!doctype html>
<html lang="es">
  <head>
    <title>Examen</title>
    <meta charset="utf-8">
    <style>
      html,body{background:grey;font-family:sans-serif;}
      header,main,footer{
        background:white;
        padding:20px;
        width:800px;
        margin:auto;
        text-align:center;
      }
      main{
        display:grid;
        grid-template-columns:auto auto auto;
        gap:20px;
      }
    </style>
  </head>
  <body>
    <header>
      <h1>Jose Vicente Carratala</h1>
      <h2>info@jocarsa.com</h2>
    </header>
    <main>
  '''                               # Creo una cadena vacia
  ########### AQUI PONGO LO QUE SE REPITE
  for fila in filas:                        # Para cada elemento de la lista
    cadena += '''
      <article>
        <p>'''+fila[0]+'''</p>
        <h3>'''+fila[2]+'''</h3>
        <p>'''+fila[3]+'''</p>
        <img src="'''+fila[4]+'''">
      </article>
    '''
  ########### AQUI PONGO EL FINAL
  cadena += ''' 
    </main>
    <footer>
      (c) 2025 Jose Vicente Carratala
    </footer>
  </body>
</html>
  '''
  return cadena                             # Devuelvo la cadena como HTML en la web

if __name__ == "__main__":                # Si este es el archivo principal
    app.run(debug=True)                   # Ejecuta la web
