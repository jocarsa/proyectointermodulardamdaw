# Abre una terminal e instala flask:
# pip install flask

from flask import Flask             

aplicacion = Flask(__name__)

@aplicacion.route("/")
def raiz():
  # En primer lugar arrancamos con un estilo css
  cadena =  '''
    <style>
      .celda{width:50px;height:50px;border:1px solid grey;}
      body{display:grid;grid-template-columns:auto auto auto auto auto auto auto auto;}
      .negra{background:black;}
    </style>
  '''                
  # Ahora defino la anchura del tablero                                         
  anchuratablero = 8
  # Primero recorro las celdas en X (horizontal
  for x in range(0,anchuratablero):
  # Luego recorro las celdas en Y (vertical)
    for y in range(0,anchuratablero):
      # Si estamos en una fila PAR
      if x%2 == 0:
        # Si estamos en una columna par:
        if y%2 == 0:
          cadena += '<div class="celda">c</div>'
        # Si estamos en una columna impar
        else:
          cadena += '<div class="celda negra">c</div>'
      # Si estamos en una fila IMPAR
      else:
        # Si estamos en una columna par:
        if y%2 == 0:
          cadena += '<div class="celda negra">c</div>'
        # Si estamos en una columna impar
        else:
          cadena += '<div class="celda">c</div>'
  cadena +=  '''
    
  '''
  return cadena
  
if __name__ == "__main__":
  aplicacion.run(debug=True)
