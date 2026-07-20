# 📊 Sales BI Project

## Descripción

Este proyecto implementa un pipeline moderno de analítica de datos utilizando Snowflake, dbt y Power BI.

El objetivo es transformar datos de ventas en bruto en un modelo dimensional optimizado para análisis, aplicando buenas prácticas de ingeniería de datos como la arquitectura Medallion, validaciones de calidad, cargas incrementales e historificación de dimensiones mediante Slowly Changing Dimensions (SCD Tipo 2).

---

# Tecnologías utilizadas

* Snowflake – Data Warehouse en la nube.
* dbt Core – Transformación y modelado de datos.
* Power BI – Visualización y análisis (pendiente).
* Git y GitHub – Control de versiones.

---

# Arquitectura del proyecto

```text
CSV
 │
 ▼
RAW
 │
 ▼
BRONZE
 │
 ▼
SILVER
 │
 ▼
GOLD (Modelo Estrella)
 │
 ▼
Power BI
```

### Capas del proyecto

* RAW: Datos originales cargados desde un archivo CSV.
* Bronze: Ingesta inicial de datos con metadatos técnicos.
* Silver: Limpieza, validación y estandarización de los datos.
* Gold: Modelo dimensional preparado para consumo analítico.

---

# Estructura del proyecto

```text
sales-bi-project/
│
├── transformations/
│   ├── models/
│   │   ├── 01_bronze/
│   │   ├── 02_silver/
│   │   └── 03_gold/
│   ├── snapshots/
│   ├── tests/
│   ├── macros/
│   └── dbt_project.yml
│
└── README.md
```

---

# Modelo de datos

La capa Gold sigue una arquitectura de **Modelo Estrella (Star Schema)**.

### Tabla de hechos

* fact_sales

### Dimensiones

* dim_customer (histórica mediante SCD Tipo 2)
* dim_product
* dim_date

---

# Funcionalidades implementadas

* Cargas incrementales.
* Estrategia **MERGE** para actualizaciones.
* Modelo dimensional (Star Schema).
* Snapshots SCD Tipo 2 para mantener histórico de clientes.
* Tests automáticos de calidad de datos.
* Validación de integridad referencial.
* Generación automática de documentación con dbt.
* Gestión del código mediante Git.

---

# Calidad de datos

El proyecto incorpora pruebas automáticas para garantizar la calidad de la información:

* Unicidad de claves.
* Valores no nulos.
* Valores permitidos.
* Validación de cantidades positivas.
* Integridad entre tablas de hechos y dimensiones.

---

# Histórico de dimensiones

La dimensión de clientes mantiene histórico mediante **Snapshots de dbt (Slowly Changing Dimension Tipo 2)**.

Se almacenan distintas versiones de un cliente cuando cambian sus atributos, manteniendo los siguientes campos técnicos:

* `valid_from`
* `valid_to`

---

# Documentación del proyecto

La documentación puede generarse mediante:

```bash
dbt docs generate
dbt docs serve
```

Esto permite visualizar:

* Lineage del proyecto.
* Dependencias entre modelos.
* Tests.
* Sources.
* Snapshots.
* Descripción de tablas y columnas.

---

# Ejecución del proyecto

Generar modelos:

```bash
dbt run
```

Ejecutar snapshots:

```bash
dbt snapshot
```

Lanzar los tests:

```bash
dbt test
```

Generar documentación:

```bash
dbt docs generate
dbt docs serve
```

---

# Próximas mejoras

* Desarrollo del dashboard en Power BI.
* Automatización mediante GitHub Actions.
* Monitorización de frescura de datos (Source Freshness).
* Incorporación de capturas de dbt Docs.
* Incorporación del dashboard final.

---

# Autor

Pablo Pamies Pérez
