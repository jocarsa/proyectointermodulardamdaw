# sudo apt install python3-pip - si no tenéis PIP en Ubuntu
# pip install flask - Windows
# pip3 install flask --break-system-packages - Linux o macOS

from flask import Flask

aplicacion = Flask(__name__)

@aplicacion.route("/")
def raiz():
  cadena = '''
    <!doctype html>
    <html>
      <head>
        <title></title>
        <style>
          h1{color:red;}
        </style>
      </head>
      <body>
        <h1>Esto es HTML a tope de power</h1>
  '''
        
  for dia in range(1,31):
    cadena += '<div>'+str(dia)+'</div>' 
         
  cadena += '''
      </body>
    </html>
  '''
  return cadena
  
if __name__ == "__main__":
  aplicacion.run(debug=True)

