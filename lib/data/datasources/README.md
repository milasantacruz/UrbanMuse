# Data Sources

Este directorio contiene las fuentes de datos (local y remoto).

## Estructura

### Local (`local/`)
- **ObraLocalDataSource**: Almacenamiento local de obras (Hive)
- **ArtistaLocalDataSource**: Almacenamiento local de artistas
- **RutaLocalDataSource**: Almacenamiento local de rutas
- **Top10LocalDataSource**: Almacenamiento local del Top 10
- **SalidaLocalDataSource**: Almacenamiento local de salidas

### Remote (`remote/`)
- **ObraRemoteDataSource**: API de obras
- **ArtistaRemoteDataSource**: API de artistas

## Responsabilidades

- **Local**: Leer/escribir en Hive, manejar caché
- **Remote**: Hacer requests HTTP, parsear respuestas

