import mysql.connector

conexion = mysql.connector.connect(
  host="localhost",
  user="portafolioceac",
  password="portafolioceac",
  database="portafolioceac"
  )
  
cursor = conexion.cursor()

cursor.execute('''
  SELECT * FROM piezas_y_categorias;
''')

filas = cursor.fetchall()

for fila in filas:
  print(fila)

