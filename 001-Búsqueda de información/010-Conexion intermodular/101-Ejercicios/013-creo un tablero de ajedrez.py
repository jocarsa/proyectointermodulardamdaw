# Abre una terminal e instala flask:
# pip install flask

from flask import Flask             

aplicacion = Flask(__name__)

@aplicacion.route("/")
def raiz():
  cadena =  '''
    
  '''
  return cadena
  
if __name__ == "__main__":
  aplicacion.run(debug=True)
