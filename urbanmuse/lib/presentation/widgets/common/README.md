# Widgets Comunes

Este directorio contiene widgets reutilizables utilizados en toda la aplicación.

## Widgets Disponibles

- **LoadingIndicator**: Indicador de carga con mensaje opcional
- **ErrorDisplay**: Widget para mostrar errores con opción de reintentar
- **EmptyState**: Widget para estados vacíos con icono y mensaje

## Uso

```dart
// Loading
LoadingIndicator(message: 'Cargando obras...')

// Error
ErrorDisplay(
  message: 'Error al cargar datos',
  onRetry: () => _loadData(),
)

// Empty State
EmptyState(
  message: 'No hay obras disponibles',
  icon: Icons.art_track,
)
```

