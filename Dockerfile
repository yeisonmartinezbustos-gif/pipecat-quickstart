FROM dailyco/pipecat-base:latest

# Opcional: mejora pequeños temas de rendimiento
ENV UV_COMPILE_BYTECODE=1
ENV UV_LINK_MODE=copy

# Copiamos el archivo de dependencias
COPY pyproject.toml pyproject.toml

# Instalamos dependencias (sin usar uv.lock)
RUN uv sync --no-install-project --no-dev

# Copiamos el código de la app
COPY ./bot.py bot.py

