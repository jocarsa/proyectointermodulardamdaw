# Importo librería flask para crear webs
from flask import Flask, render_template # Cargar archivos HTML

# Creo una nueva aplicación
app = Flask(__name__)

# Escucho en la ruta raiz
@app.route("/")
def inicio():
  # Y renderizo una plantilla llamada index.html
  return render_template("index.html")

# Si este archivo no es una libreria y es el archivo principal
if __name__ == "__main__":
  # Pon en marcha la aplicación
  app.run(debug=True)

