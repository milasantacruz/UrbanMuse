# 🔌 Configuración de Figma MCP

## 📋 Requisitos Previos

1. **Figma Desktop** instalado y abierto
2. **Plugin MCP de Figma** instalado y activo
3. **Servidor MCP** corriendo en `http://127.0.0.1:3845/mcp`

---

## 🚀 Pasos para Activar Figma MCP

### Paso 1: Verificar Figma Desktop
- Abre Figma Desktop (no la versión web)
- Asegúrate de estar logueado

### Paso 2: Instalar Plugin MCP (si no está instalado)
1. En Figma Desktop, ve a **Plugins** → **Browse plugins in Community**
2. Busca "MCP" o "Model Context Protocol"
3. Instala el plugin

### Paso 3: Activar el Plugin
1. Ve a **Plugins** → **Development** → **[Nombre del Plugin MCP]**
2. O usa el atajo: `Ctrl+Alt+P` (Windows) / `Cmd+Option+P` (Mac)
3. Selecciona el plugin MCP

### Paso 4: Verificar que el Servidor Esté Corriendo
El plugin debería iniciar automáticamente un servidor en `http://127.0.0.1:3845/mcp`

---

## ✅ Verificación de Conexión

Una vez que el servidor esté activo, deberías poder:

1. **Ver el servidor respondiendo** en la consola del plugin
2. **Usar herramientas MCP** desde Cursor para interactuar con Figma
3. **Crear archivos, frames, componentes** directamente desde Cursor

---

## 🛠️ Comandos Útiles para Verificar

### Desde PowerShell:
```powershell
# Verificar si el puerto está en uso
Get-NetTCPConnection -LocalPort 3845 -ErrorAction SilentlyContinue

# Intentar conectar
Invoke-WebRequest -Uri "http://127.0.0.1:3845/mcp" -Method GET
```

### Si el servidor no responde:
1. Reinicia el plugin MCP en Figma
2. Verifica que no haya otro proceso usando el puerto 3845
3. Revisa la configuración en `mcp.json`

---

## 📝 Notas

- El servidor MCP debe estar corriendo **mientras trabajas** con Figma
- Si cierras Figma, el servidor se detendrá
- Algunos plugins MCP requieren configuración adicional (API keys, etc.)

---

## 🎯 Próximos Pasos

Una vez que el servidor esté activo:

1. **Crear archivo nuevo en Figma** para el prototipo
2. **Configurar design tokens** (colores, tipografía, espaciado)
3. **Crear componentes base** reutilizables
4. **Diseñar pantallas principales** según el plan
5. **Conectar prototipos interactivos**

---

*Guía de configuración para Figma MCP*  
*Fecha: Inicio del proyecto*

