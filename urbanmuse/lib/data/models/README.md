# Models (Data Layer)

Este directorio contiene los modelos de datos que representan la estructura JSON de la API.

## Estructura

Los modelos deben:
- Extender de las entidades del Domain Layer
- Implementar `fromJson` y `toJson`
- Usar adapters de Hive para persistencia local

## Ejemplo de estructura

```dart
class ObraModel extends Obra {
  ObraModel({
    required super.id,
    required super.titulo,
    // ... otros campos
  });
  
  factory ObraModel.fromJson(Map<String, dynamic> json) {
    return ObraModel(
      id: json['id'],
      titulo: json['titulo'],
      // ...
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      // ...
    };
  }
}
```

