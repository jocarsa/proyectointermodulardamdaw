from flask import Flask, render_template, request # Tomo parametros de la url

app = Flask(__name__)

@app.route("/")
def inicio():
  return render_template("index.html")

@app.route("/envio")
def envio():
  nombre = request.args.get("nombre")
  apellidos = request.args.get("apellidos")
  return "nombre: "+nombre+" - apellidos: "+apellidos

if __name__ == "__main__":
  app.run(debug=True)

# http://127.0.0.1:5000/?nombre=Jose%20Vicente
# %20 = espacio (en url)
