import mysql.connector 

conexion = mysql.connector.connect(
  host="localhost",
  user="clientes",
  password="Clientes123$",
  database="clientes"
)                                      
  
cursor = conexion.cursor(dictionary=True) # Diccionario
cursor.execute('''
  SELECT
  nombre AS "Nombre del cliente",
  apellidos AS "Apellidos del cliente",
  edad AS "Edad del cliente"
  FROM clientes
  ORDER BY edad DESC;
''')  

filas = cursor.fetchall()

for fila in filas:
  print("Nombre: ",fila['Nombre del cliente'])
  print("Apellidos: ",fila['Apellidos del cliente'])
  print("Edad: ",fila['Edad del cliente'])
  print("##################")




