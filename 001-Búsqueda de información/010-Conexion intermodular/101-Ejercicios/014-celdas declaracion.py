# Abre una terminal e instala flask:
# pip install flask

from flask import Flask             

aplicacion = Flask(__name__)

@aplicacion.route("/")
def raiz():
  cadena =  '''
    
  '''
  anchuratablero = 8
  for x in range(0,anchuratablero):
    for y in range(0,anchuratablero):
      cadena += '<div class="celda">c</div>'
  cadena +=  '''
    
  '''
  return cadena
  
if __name__ == "__main__":
  aplicacion.run(debug=True)
