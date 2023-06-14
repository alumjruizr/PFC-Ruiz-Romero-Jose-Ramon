FROM python:3.10.4-alpine3.15

WORKDIR /src

RUN apk update \
    && apk add --no-cache gcc musl-dev mysql-dev python3-dev libffi-dev \
    && pip install --upgrade pip

# Copia el archivo requirements.txt y lo instala
COPY src/requirements.txt .

RUN pip install -r requirements.txt
RUN pip install django-polymorphic
RUN pip install mysqlclient
RUN pip install crispy-bootstrap4

# Copia el resto de los archivos del proyecto
COPY ./ ./

# Expone el puerto 8000 para acceder a la aplicación
EXPOSE 8000

# Comando para ejecutar la aplicación cuando se inicie el contenedor
CMD ["python", "src/manage.py", "runserver", "0.0.0.0:8000"]