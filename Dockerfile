# Utilizamos una imagen base de Python
FROM python:3.8

# Actualizamos pip
RUN pip install --upgrade pip

# Instalamos Jupyter Notebook
RUN pip install jupyter


# Establecemos el directorio de trabajo en /app
WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

# Exponemos el puerto 8889 para acceder a Jupyter Notebook
EXPOSE 8889

# Copiamos un script de configuración que establecerá un token de acceso para Jupyter
COPY jupyter_notebook_config.py /root/.jupyter/

# Ejecutamos Jupyter Notebook cuando se inicie el contenedor
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8889", "--no-browser", "--allow-root"]
