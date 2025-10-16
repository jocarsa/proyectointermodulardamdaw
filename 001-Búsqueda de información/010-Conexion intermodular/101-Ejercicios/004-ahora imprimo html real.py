# Abre una terminal e instala flask:
# pip install flask
# Flask es un microservidorweb que nos permite generar HTML desde Python

# Importo la librería Flask
from flask import Flask             

# Creo una nueva aplicacion
aplicacion = Flask(__name__)

# Defino que ocurre en una ruta inicial (/)
@aplicacion.route("/")
def raiz():
  return "<h1>Esto es HTML desde Flask</h1>"
  
# Ahora arranco el servidor
if __name__ == "__main__":
  aplicacion.run(debug=True)
