![world_surf_league_logo_before_after](https://github.com/user-attachments/assets/19506e7b-5a48-4a91-a051-6b4ca01d32a7)

# World Surf League Scrapping App 🏄‍♂️

Aplicación iOS desarrollada con SwiftUI que utiliza scrapping para consultar información actualizada de la **World Surf League**. La app incluye datos sobre atletas, rankings y campeonatos, y sigue la arquitectura MVVM para un diseño limpio y escalable.

---

## 📖 Descripción

Este proyecto extrae información en tiempo real desde la página web oficial de la World Surf League para mostrar:  
- 🏄 **Atletas:** Estadísticas y detalles personales.  
- 🏆 **Rankings:** Clasificaciones globales actualizadas.  
- 🌍 **Campeonatos:** Fechas, ubicaciones y ganadores.

---

## 🚀 Características

- **Interfaz moderna y limpia:** Construida completamente en SwiftUI.  
- **Scrapping dinámico:** Obtención de datos mediante la librería `SwiftSoup`.  
- **Arquitectura escalable:** Basada en el patrón MVVM.  
- **Responsividad:** Compatible con iPhone y iPad (iOS 17+).  

---

## 🛠️ Tecnologías

- **Lenguaje:** Swift 5.9  
- **Frameworks:** SwiftUI, Combine  
- **Scrapping:** [SwiftSoup](https://github.com/scinfu/SwiftSoup)  

---

## 📂 Estructura del Proyecto

```plaintext
WorldSurfLeagueApp/
├── Models/          # Estructuras de datos como Athlete, Ranking y Championship
├── ViewModels/      # Lógica de negocio para cada vista
├── Views/           # Componentes de SwiftUI para la interfaz
├── Services/        # Servicio para realizar el scrapping web
├── Resources/       # Archivos adicionales como JSONs o Strings localizados
└── Tests/           # Pruebas unitarias para ViewModels y Services
```

## 🚩 Requisitos

Antes de ejecutar el proyecto, asegúrate de contar con lo siguiente:

- **Xcode 15** o superior.
- **iOS 17** como versión mínima de deployment target.
- Conexión a internet para obtener los datos en tiempo real.
- Librerías de terceros instaladas mediante Swift Package Manager (SPM) como `SwiftSoup`.
