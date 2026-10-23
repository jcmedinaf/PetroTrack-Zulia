# 🛢️ PetroTrack Zulia | Monitoreo y Gestión de Activos Petroleros

Aplicación web interactiva desarrollada bajo una arquitectura de Una Sola Página (**SPA**) para la empresa operadora en la Costa Oriental del Lago, Estado Zulia. Su objetivo es automatizar el control de campos petroleros, el registro de presiones en válvulas (**PSI**), la auditoría de operadores en campo y la georreferenciación de activos (**balancines, pozos fluyentes y tanques de almacenamiento**).

---

## 🚀 1. Requisitos Funcionales
* **Gestión de Campos y Activos**: Registro, consulta y estatus operativo de pozos, balancines (*pumping units*) y parques de tanques.
* **Control de Lecturas PSI**: Toma y almacenamiento de presiones en cabezales y válvulas con trazabilidad estricta del operador que realizó la inspección.
* **Geolocalización en Mapa**: Visualización interactiva mediante coordenadas geográficas (Latitud y Longitud) conectadas a servicios cartográficos.
* **Auditoría de Operaciones**: Control de usuarios, roles (Ingenieros y Operadores de Campo) y marcas de tiempo de cada registro.
* **Reportes Operativos**: Generación de informes exportables en formatos **PDF** y **Excel** para la toma de decisiones gerenciales.

---

## 🛠️ 2. Pila Tecnológica (Stack)
* **Frontend**: HTML5, CSS3, **Bootstrap 5**, JavaScript (Vanilla / AJAX) y librerías de mapas interactivos (**Leaflet / Google Maps API**).
* **Backend**: **PHP** (procedural con conexión segura `mysqli` y codificación UTF-8).
* **Base de Datos**: **MySQL** (Relacional).
* **Enrutamiento**: Router SPA personalizado basado en Hash (`#`).

---

## 📂 3. Estructura del Proyecto
*(Ver esquema de directorios en la sección superior del repositorio).*

---

## ⚙️ 4. Instalación y Puesta en Marcha Local

**1. Clonar el Repositorio**
Descarga o clona el proyecto en la carpeta raíz de tu servidor local (ej. `htdocs` en XAMPP):
```bash
git clone [https://github.com/jcmedinaf/-Embotelladora-Thomsom.git](https://github.com/jcmedinaf/-Embotelladora-Thomsom.git)

2. Configurar la Base de Datos

Abre tu gestor de base de datos MySQL (phpMyAdmin o consola).

Ejecuta el script completo ubicado en db_schema.sql para crear la base de datos bd_petrotrack_zulia y sus tablas relacionales.

3. Verificar Conexión

Asegúrate de que las credenciales en backend/config/conexion.php coincidan con tu entorno local:

Host: localhost

Usuario: root

Contraseña: '' (vacía por defecto)

4. Ejecutar la Aplicación

Inicia los servicios de Apache y MySQL.

Abre tu navegador web e ingresa a:http://localhost/petrotrack_zulia/

📋 5. Lineamientos de Entrega
Repositorio GitHub: Código fuente estructurado, documentado y sincronizado.

Defensa: Demostración en vivo del funcionamiento de la SPA, simulación de lecturas PSI y explicación técnica de los componentes backend y consultas SQL.

✍️ Créditos y Autoría
Autor Principal / Desarrollador: Juan Carlos Medina Flores (Ingeniero de Software y Analista de Sistemas)

Institución / Contexto Académico: Universidad Dr. José Gregorio Hernández / Universidad Privada Dr. Rafael Belloso Chacín (URBE)

Ubicación: Maracaibo, Estado Zulia, Venezuela

Año de Desarrollo: 2026

Propósito del Sistema: Solución tecnológica integral desarrollada bajo arquitectura SPA (Single Page Application) orientada al monitoreo de campos petroleros, control georreferenciado de activos críticos (pozos, balancines y tanques) y auditoría operacional de presiones (PSI).