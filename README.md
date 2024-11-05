# Clash Royale Tracker

Aplicación de iOS para buscar jugadores de Clash Royale por su tag y mostrar sus estadísticas y cargas en detalle. Creada por Rafael Loggiodice con SwiftUI y el framework Combine, esta aplicación es perfecta para los fans de Clash Royale y una gran adición para el portafolio.

## Funcionalidades

1. **Buscar Jugador por Tag**: Permite al usuario buscar un jugador específico introduciendo su tag. Se realiza una llamada a la API de Supercell para obtener la información del jugador.
2. **Mostrar Cargas a Detalle**: Una vez encontrado el jugador, la aplicación muestra todas las cargas disponibles con información detallada, incluyendo nivel de experiencia, trofeos, victorias, y más.

## Tecnologías Utilizadas

- **SwiftUI**: Para la creación de la interfaz de usuario de la aplicación.
- **Combine**: Utilizado para manejar la asincronía y la recepción de datos de la API de forma reactiva.
- **API de Clash Royale (Supercell)**: La aplicación hace uso de la API oficial para obtener información de los jugadores.

## Instalación

1. Clona el repositorio en tu máquina local:
```bash
git clone https://github.com/tuusuario/ClashRoyaleTracker.git
```
2. Abre el proyecto en Xcode:
```bash
open ClashRoyaleTracker.xcodeproj
```
3. Asegúrate de tener una clave de la API de Clash Royale. Puedes obtenerla desde el [sitio web oficial de la API de Clash Royale](https://developer.clashroyale.com).
4. Configura la clave de la API en el archivo de constantes de la aplicación.

## Uso

1. Abre la aplicación y utiliza el campo de búsqueda para ingresar el tag del jugador de Clash Royale.
2. La aplicación realizará una búsqueda y, si el jugador es encontrado, mostrará sus estadísticas y cargas.
3. En caso de que el tag no sea válido o el jugador no exista, se mostrará un mensaje de error.

## Capturas de Pantalla

*(Aquí puedes agregar capturas de pantalla de la interfaz de usuario mostrando las búsquedas y las cargas a detalle).*

## Notas

- **API de Supercell**: La aplicación depende de la disponibilidad de la API de Supercell. Asegúrate de respetar los límites de la API.
- **Permisos y Privacidad**: Esta aplicación se crea únicamente para fines de portafolio y no recopila ni comparte información personal del usuario.

## Contribuciones

Las contribuciones son bienvenidas. Si deseas mejorar la funcionalidad o reportar un problema, abre un issue o envía un pull request.

## Licencia

Este proyecto es solo para uso educativo y de portafolio. No está afiliado con, respaldado o patrocinado por Supercell.

--- 

Este README debería servirte como una introducción sólida para tu aplicación. Puedes añadir detalles específicos o personalizarlo según tu necesidad.
