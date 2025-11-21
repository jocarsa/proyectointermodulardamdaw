from flask import Flask, render_template 

app = Flask(__name__)

@app.route("/")
def inicio():
  mis_frutas = ["manzanas","peras","platanos","fresas"]
  return render_template("lista.html",frutas=mis_frutas)
  
if __name__ == "__main__":
  app.run(debug=True)

