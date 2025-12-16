# 🗺️ Mapa de Flujo de Navegación - Street Muse

## Diagrama Principal de Navegación

```mermaid
graph TB
    Start([App Inicio]) --> Mapa[MapaPage /]
    
    Mapa --> |Bottom Nav| Perfil[PerfilPage /perfil]
    Mapa --> |Bottom Nav| Feed[FeedPage /feed]
    Mapa --> |Bottom Nav| RutasList[RutaListPage /rutas]
    Mapa --> |Bottom Nav| TopN[TopNPage /topn]
    
    Mapa --> |Toca pin obra| ObraPreview[AppObraPreviewBottomSheet]
    ObraPreview --> |Ver más| ObraDetail[ObraDetailPage /obra/:id]
    
    Mapa --> |Crear Ruta| CreateRutaModal[CreateRutaModal]
    CreateRutaModal --> |Crear| Mapa
    
    Mapa --> |Filtros| FilterModal[AppFilterModal]
    
    ObraDetail --> |Ver artista| ArtistaProfile[ArtistaProfilePage /artista/:id]
    ObraDetail --> |Ver en mapa| Mapa
    
    ArtistaProfile --> |Toca obra| ObraDetail
    
    Feed --> |Toca obra| ObraDetail
    Feed --> |Filtros| FilterModal
    
    Perfil --> |Publicar Obra| PublicarObra[PublicarObraPage /obra/publicar]
    Perfil --> |Crear Encuentro| CreateEncuentro[CreateEncuentroPage /encuentro/create]
    Perfil --> |Ver Mis Rutas| RutasList
    Perfil --> |Ver Top N| TopN
    Perfil --> |Toca ruta| RutaDetail[RutaDetailPage /ruta/:id]
    
    RutasList --> |Crear Ruta| CreateRutaModal
    RutasList --> |Toca ruta| RutaDetail
    
    RutaDetail --> |Toca obra| ObraDetail
    
    TopN --> |Ver todas rutas| RutasList
    TopN --> |Toca ruta| RutaDetail
    
    EncuentrosList[EncuentroListPage /encuentros] --> |Crear Encuentro| CreateEncuentro
    EncuentrosList --> |Toca encuentro| EncuentroDetail[EncuentroDetailPage /encuentro/:id]
    
    EncuentroDetail --> |Ver artista| ArtistaProfile
    
    PublicarObra --> |Publicar| Perfil
    CreateEncuentro --> |Crear| Perfil
    
    style Mapa fill:#4CAF50,stroke:#2E7D32,color:#fff
    style Perfil fill:#2196F3,stroke:#1565C0,color:#fff
    style Feed fill:#FF9800,stroke:#E65100,color:#fff
    style RutasList fill:#9C27B0,stroke:#6A1B9A,color:#fff
    style TopN fill:#F44336,stroke:#C62828,color:#fff
    style ObraDetail fill:#00BCD4,stroke:#00838F,color:#fff
    style ArtistaProfile fill:#795548,stroke:#5D4037,color:#fff
    style CreateRutaModal fill:#FFC107,stroke:#F57C00,color:#000
    style CreateEncuentro fill:#E91E63,stroke:#AD1457,color:#fff
```

## Flujo Detallado: Crear Ruta

```mermaid
sequenceDiagram
    participant U as Usuario
    participant M as MapaPage
    participant Modal as CreateRutaModal
    participant Bloc as RutaBloc
    
    U->>M: Selecciona punto A
    U->>M: Selecciona punto B
    U->>M: Presiona "Crear Ruta"
    M->>Modal: Abre modal con puntos A y B
    Modal->>Modal: Paso 1: Puntos (completado)
    Modal->>Modal: Paso 2: Seleccionar obras
    U->>Modal: Selecciona obras
    Modal->>Modal: Paso 3: Transporte y visibilidad
    U->>Modal: Selecciona transporte y tipo
    Modal->>Modal: Paso 4: Participantes
    U->>Modal: Agrega participantes (opcional)
    Modal->>Modal: Paso 5: Revisión final
    U->>Modal: Completa nombre y configuración
    U->>Modal: Presiona "Crear Ruta"
    Modal->>Bloc: CreateRuta event
    Bloc->>Bloc: Guarda ruta
    Bloc->>Modal: RutaCreated state
    Modal->>M: Cierra modal
    M->>M: Actualiza mapa con nueva ruta
```

## Flujo Detallado: Descubrir Obra

```mermaid
sequenceDiagram
    participant U as Usuario
    participant M as MapaPage
    participant Preview as ObraPreviewBottomSheet
    participant Detail as ObraDetailPage
    participant Profile as ArtistaProfilePage
    
    U->>M: Toca pin de obra en mapa
    M->>Preview: Abre bottom sheet
    Preview->>Preview: Muestra preview de obra
    U->>Preview: Presiona "Ver más"
    Preview->>M: Cierra bottom sheet
    M->>Detail: Navega a /obra/:id
    Detail->>Detail: Muestra detalle completo
    
    alt Ver artista
        U->>Detail: Toca "Ver artista"
        Detail->>Profile: Navega a /artista/:id
        Profile->>Profile: Muestra perfil del artista
    else Ver en mapa
        U->>Detail: Toca "Ver en mapa"
        Detail->>M: Navega a / con obra centrada
    end
```

## Estructura de Bottom Navigation

```mermaid
graph LR
    subgraph "Bottom Navigation (4 secciones)"
        A[Perfil<br/>Índice 0] --> B[Explorar/Mapa<br/>Índice 1]
        B --> C[Rutas<br/>Índice 2]
        C --> D[Top N<br/>Índice 3]
    end
    
    A --> PerfilPage[/perfil]
    B --> MapaPage[/]
    C --> RutaListPage[/rutas]
    D --> TopNPage[/topn]
```

## Flujo de Navegación por Tipo de Usuario

### Visitante

```mermaid
graph TB
    Start([Visitante entra]) --> Mapa[MapaPage]
    Mapa --> |Explorar| Feed[FeedPage]
    Mapa --> |Ver rutas| RutasList[RutaListPage]
    Mapa --> |Top N| TopN[TopNPage]
    Mapa --> |Crear ruta| CreateRutaModal[CreateRutaModal]
    
    Feed --> ObraDetail[ObraDetailPage]
    RutasList --> RutaDetail[RutaDetailPage]
    TopN --> RutaDetail
    
    ObraDetail --> ArtistaProfile[ArtistaProfilePage]
    RutaDetail --> ObraDetail
    
    style CreateRutaModal fill:#4CAF50,stroke:#2E7D32,color:#fff
```

### Artista

```mermaid
graph TB
    Start([Artista entra]) --> Mapa[MapaPage]
    Mapa --> Perfil[PerfilPage]
    
    Perfil --> |Publicar| PublicarObra[PublicarObraPage]
    Perfil --> |Crear encuentro| CreateEncuentro[CreateEncuentroPage]
    Perfil --> |Ver rutas| RutasList[RutaListPage]
    Perfil --> |Top N| TopN[TopNPage]
    
    PublicarObra --> |Publica| Mapa
    CreateEncuentro --> |Crea| EncuentrosList[EncuentroListPage]
    
    style PublicarObra fill:#E91E63,stroke:#AD1457,color:#fff
    style CreateEncuentro fill:#E91E63,stroke:#AD1457,color:#fff
```

## Matriz de Navegación

| Desde | Hacia | Método | Tipo |
|-------|-------|--------|------|
| MapaPage | ObraDetailPage | `context.push()` | Navegación |
| MapaPage | CreateRutaModal | `showModalBottomSheet()` | Modal |
| MapaPage | AppObraPreviewBottomSheet | `showModalBottomSheet()` | Bottom Sheet |
| FeedPage | ObraDetailPage | `context.push()` | Navegación |
| PerfilPage | PublicarObraPage | `context.push()` | Navegación |
| PerfilPage | CreateEncuentroPage | `context.push()` | Navegación |
| RutaListPage | RutaDetailPage | `context.push()` | Navegación |
| TopNPage | RutaDetailPage | `context.push()` | Navegación |
| ObraDetailPage | ArtistaProfilePage | `context.push()` | Navegación |
| ArtistaProfilePage | ObraDetailPage | `context.push()` | Navegación |
| Bottom Nav | Cualquier sección | `context.go()` | Reemplazo |

## Rutas por Categoría

### Rutas Principales (15)

1. `/` - MapaPage
2. `/feed` - FeedPage
3. `/perfil` - PerfilPage
4. `/topn` - TopNPage
5. `/obra/:id` - ObraDetailPage
6. `/obra/publicar` - PublicarObraPage
7. `/artista/:id` - ArtistaProfilePage
8. `/rutas` - RutaListPage
9. `/ruta/:id` - RutaDetailPage
10. `/ruta/create` - CreateRutaPage (⚠️ No se usa)
11. `/encuentros` - EncuentroListPage
12. `/encuentro/:id` - EncuentroDetailPage
13. `/encuentro/create` - CreateEncuentroPage

### Redirecciones (4)

1. `/top10` → `/topn`
2. `/salidas` → `/encuentros`
3. `/salida/:id` → `/encuentro/:id`
4. `/salida/create` → `/encuentro/create`

### Preview Routes (22)

Todas bajo `/preview/*` - Solo para desarrollo

---

## Notas de Implementación

### Modales vs Páginas

- **CreateRutaModal:** Modal porque permite mantener el mapa visible
- **AppObraPreviewBottomSheet:** Bottom sheet para preview rápido
- **AppFilterModal:** Modal para no perder contexto

### Navegación con GoRouter

- **`context.go()`:** Reemplaza la ruta actual (usado en Bottom Nav)
- **`context.push()`:** Apila nueva ruta (usado para detalles)
- **`Navigator.pop()`:** Cierra modales/bottom sheets

### Bottom Navigation

- Siempre visible en páginas principales
- 4 secciones: Perfil, Explorar, Rutas, Top N
- Usa `context.go()` para reemplazar ruta sin apilar

---

*Diagramas generados en formato Mermaid*  
*Última actualización: Diciembre 2025*
