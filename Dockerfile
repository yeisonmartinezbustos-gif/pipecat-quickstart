FROM python:3.11-slim-bookworm

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Paquetes del sistema necesarios para audio / red
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ffmpeg \
        libnss3 \
        libglib2.0-0 \
        libasound2 \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Copiamos todo el código del proyecto al contenedor
COPY . .

# Instalamos dependencias de Python (Pipecat + extras que usa el quickstart)
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
        "pipecat-ai[deepgram,openai,cartesia,webrtc]" \
        python-dotenv

# El bot expone el puerto 7860
EXPOSE 7860

# Ejecutar el bot
CMD ["python", "bot.py"]
