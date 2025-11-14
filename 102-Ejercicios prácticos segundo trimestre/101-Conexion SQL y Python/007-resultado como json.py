import mysql.connector 
import json

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
resultado_json = json.dumps(filas, ensure_ascii=False, indent=2)
print(resultado_json)




