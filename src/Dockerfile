# Define la imagen base
FROM python:3.9

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /PFC-Ruiz-Romero-Jose-Ramon

# Copia el archivo requirements.txt y lo instala
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip install django-polymorphic
RUN pip install mysqlclient

# Copia el resto de los archivos del proyecto
COPY .. .

# Expone el puerto 8000 para acceder a la aplicación
EXPOSE 8000

# Comando para ejecutar la aplicación cuando se inicie el contenedor
CMD ["python", "src/manage.py", "runserver", "0.0.0.0:8000"]
