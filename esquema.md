📂 Esquema de Estructura del Proyecto

petrotrack_zulia/
├── backend/
│   ├── config/
│   │   └── conexion.php           # Conexión MySQLi con charset UTF-8
│   ├── activos/
│   │   ├── get_activos.php        # Listado y filtros de pozos, balancines y tanques
│   │   └── save_activo.php        # Registro de nuevos activos petroleros
│   ├── lecturas/
│   │   ├── get_lecturas.php       # Consultar histórico de presiones PSI
│   │   └── save_lectura.php       # Registrar nueva lectura en campo
│   └── reportes/
│       ├── reporte_excel.php      # Exportación a Excel de lecturas e inspecciones
│       └── reporte_pdf.php        # Generador de reportes ejecutivos en PDF
├── src/
│   ├── app/
│   │   ├── componentes/           # Controladores JavaScript (Lógica AJAX)
│   │   │   ├── activos/
│   │   │   │   └── index.js
│   │   │   ├── dashboard/
│   │   │   │   └── index.js
│   │   │   ├── lecturas/
│   │   │   │   ├── form.js
│   │   │   │   └── index.js
│   │   │   └── mapa/
│   │   │       └── index.js       # Integración con GPS / Mapas
│   │   └── vistas/                # Módulos de interfaz HTML
│   │       ├── activos/
│   │       │   └── index.html
│   │       ├── dashboard/
│   │       │   └── index.html
│   │       ├── lecturas/
│   │       │   ├── form.html
│   │       │   └── index.html
│   │       └── mapa/
│   │           └── index.html
│   └── assets/                    # Recursos estáticos
│       ├── css/
│       │   └── estilos.css
│       └── js/
├── app.js                         # Enrutador principal de la SPA
├── db_schema.sql                  # Script SQL de la base de datos relacional
├── index.html                     # Punto de entrada principal con layout Bootstrap 5
└── README.md                      # Especificación y documentación del proyecto