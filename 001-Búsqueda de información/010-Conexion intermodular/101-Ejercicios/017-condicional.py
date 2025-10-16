# Abre una terminal e instala flask:
# pip install flask

from flask import Flask             

aplicacion = Flask(__name__)

@aplicacion.route("/")
def raiz():
  cadena =  '''
    <style>
      .celda{width:50px;height:50px;border:1px solid grey;}
      body{display:grid;grid-template-columns:auto auto auto auto auto auto auto auto;}
      .negra{background:black;}
    </style>
  '''
  anchuratablero = 8
  for x in range(0,anchuratablero):
    for y in range(0,anchuratablero):
      if y%2 == 0:
        cadena += '<div class="celda">c</div>'
      else:
        cadena += '<div class="celda negra">c</div>'
  cadena +=  '''
    
  '''
  return cadena
  
if __name__ == "__main__":
  aplicacion.run(debug=True)
