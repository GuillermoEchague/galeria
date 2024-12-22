# Biblioteca de Datos 📚

Este proyecto es la **Prueba Final** del curso de iOS, desarrollado utilizando **SwiftUI**. La aplicación se enfoca en conceptos clave de persistencia y consumo de datos, con el objetivo de ofrecer una experiencia de usuario fluida y organizada.

---

## 📝 Descripción

La aplicación "Biblioteca de Datos" tiene como objetivo permitir al usuario explorar datos externos (provenientes de una API) y generar sus propios datos de manera persistente. A través de una interfaz intuitiva, se pueden realizar operaciones CRUD y navegar entre vistas de manera eficiente.

---

## 🚀 Funcionalidades

### Pantalla Principal
- Dos botones principales:
  - **Ver Héroes**: Muestra datos provenientes de una API.
  - **Elementos Personalizados**: Permite crear y gestionar elementos personalizados.

### Pantalla API
- Lista de 12 héroes obtenidos de la API: [API de Héroes](https://heroes-api-two.vercel.app/es/marvel/heroes).
- Cada héroe redirige a una vista de detalle donde se muestra más información.
- Botón para regresar a la pantalla principal.

### Pantalla Elementos Personalizados
- CRUD completo para elementos personalizados:
  - Crear elementos (formulario en modal o nueva vista).
  - Editar elementos existentes.
  - Eliminar elementos con botón o swipe.
- Persistencia de datos utilizando **Core Data**.

---

## 📋 Requisitos del Proyecto

1. **Pantalla Principal**:
   - Botones visibles y funcionales que redirigen a las pantallas correspondientes.

2. **Pantalla API**:
   - Lista con datos de la API.
   - Vista de detalle para cada héroe, mostrando todos los campos relevantes.

3. **Pantalla Elementos Personalizados**:
   - CRUD funcional con persistencia en **Core Data**.

4. **General**:
   - Solo modo **Portrait**.
   - Uso de **ColorSet** y un ícono personalizado en los assets.
   - Organización del proyecto bajo la arquitectura **MVVM**.

---

## ⚙️ Requerimientos Técnicos

El proyecto debe cumplir con los siguientes puntos para obtener la máxima calificación:

1. Navegación intuitiva entre vistas. ✅
2. Datos de la API correctamente visualizados (general y detalle). ✅
3. CRUD completo para elementos personalizados. ✅
4. Solo versión Portrait. ✅
5. Organización en carpetas según arquitectura MVVM. ✅
6. Uso de Assets (mínimo 2 ColorSet y un ícono). ✅
7. Pantalla principal organizada e intuitiva. ✅
8. Separación lógica en múltiples ViewModels. ✅
9. Uso de un componente reutilizable en más de una vista. ✅
10. Creación de 1 Test Unitario y 1 Test de UI. ✅

---

## 📦 Organización del Proyecto

El proyecto está organizado bajo la arquitectura **MVVM** y estructurado en carpetas para facilitar su mantenimiento:



---

## 🛠 Tecnologías y Herramientas Utilizadas

- **SwiftUI**: Framework principal para el desarrollo de la interfaz.
- **Core Data**: Para la persistencia de datos.
- **URLSession**: Para consumir la API de héroes.
- **Xcode**: IDE principal.
- **GitHub**: Para la entrega del proyecto.

---

## 🧪 Pruebas

### Test Unitario
- Valida la correcta creación de un elemento personalizado.

### Test UI
- Verifica el flujo de navegación entre la pantalla principal, la lista de héroes, y la vuelta a la pantalla principal.

---

## 🗂 Entrega

1. **Subir a GitHub**:
   - Asegúrate de que el repositorio sea **público**.
   - Adjunta el enlace al repositorio en un archivo `.txt` con tu nombre.

2. **Formato Alternativo**:
   - Si no puedes alojar el código en GitHub, comprime el proyecto y adjunta un enlace de Drive en el archivo `.txt`.

---

## ✨ Conclusión

Este proyecto evalúa las habilidades en **SwiftUI**, arquitectura **MVVM**, consumo de APIs, y manejo de datos persistentes. Su desarrollo demuestra la capacidad para construir aplicaciones iOS eficientes y bien estructuradas.

**"No se trata solo de aprobar, sino de demostrar que estás listo para crear grandes cosas."**

¡Mucho éxito! 🚀
