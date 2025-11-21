from flask import Flask, render_template 
import mysql.connector                    # Importamos MySQL
###################### MYSQL ##############################################
conexion = mysql.connector.connect(
host="localhost",user="portafolioceac",password="portafolioceac",database="portafolioceac"
)                                         # Datos de conexión a la base de datos
cursor = conexion.cursor()                # Creo un cursor MySQL
cursor.execute("SHOW TABLES;")            # Muestra las tablas de la base de datos
tablas = []                               # Creo una lista vacia
filas = cursor.fetchall()                 # Lo guardo en una lista
for fila in filas:                        # Recorro el resultado
  tablas.append(fila[0])                  # Lo añado a la lista de tablas                
###################### MYSQL ##############################################

app = Flask(__name__)

@app.route("/")
def inicio():
  return render_template("backoffice.html",mis_tablas = tablas) # Envio las tablas a HTML
  
if __name__ == "__main__":
  app.run(debug=True)
  

