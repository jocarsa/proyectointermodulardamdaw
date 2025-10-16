¡Buenísima pregunta! Te dejo un “mapa de departamentos” para 1) **clientes potenciales (pymes valencianas)** y 2) **empresas de la competencia (proveedores de IA)**. La idea es que veas **quién decide**, **quién usa**, **quién bloquea** y **dónde duele**—para orientar oferta, discurso y roadmap.

# Departamentos típicos en CLIENTES (pymes/medianas)

| Departamento                     | Rol típico en pyme               | Decisor / Influenciador                        | Dolores comunes                          | Dónde encaja la IA                                                     | KPIs que miran                         |
| -------------------------------- | -------------------------------- | ---------------------------------------------- | ---------------------------------------- | ---------------------------------------------------------------------- | -------------------------------------- |
| Dirección (CEO/Gerencia)         | Define estrategia y presupuestos | **Económico** (firma), Influenciador           | ROI incierto, priorización, riesgo       | Casos de negocio rápidos (PoC), dashboards ejecutivos                  | Margen, crecimiento, ROI, payback      |
| Operaciones / Producción         | Eficiencia, tiempos, calidad     | **Campeón** si ve ahorro                       | Paradas, merma, plazos                   | Mantenimiento predictivo, optimización de procesos, control de calidad | OEE, scrap, lead time                  |
| Comercial / Ventas               | Captación y conversión           | Influenciador fuerte                           | Leads de baja calidad, forecasting pobre | Scoring de leads, next-best-offer, pricing dinámico                    | Tasa de cierre, ACV, forecast accuracy |
| Marketing                        | Generación de demanda            | Influenciador                                  | CAC alto, tracking difuso                | Segmentación, atribución, contenido asistido, RFM                      | CAC, MQL→SQL, LTV                      |
| Atención al cliente / Soporte    | Incidencias y fidelización       | Influenciador / Usuario                        | Tiempos de respuesta, repetitivas        | Chatbots, resumen de tickets, clasificación automática                 | FCR, CSAT, TTR                         |
| Logística / Cadena de suministro | Compras, inventario, rutas       | Influenciador                                  | Roturas de stock, exceso de stock        | Predicción de demanda, optimización de inventario y rutas              | Rotación stock, OTIF, coste/km         |
| Calidad                          | Norma y auditoría                | **Bloqueador/guardia** si no hay trazabilidad  | No conformidades                         | Detección de defectos, trazabilidad explicable                         | NCR, ppm, costes calidad               |
| Finanzas / Controlling           | Presupuestos, riesgos            | **Co-decisor** (presupuesto)                   | Evaluar ROI, control gastos              | Forecasting financiero, detección fraude                               | EBITDA, cashflow, desviaciones         |
| RR. HH. / Prevención             | Personas, formación              | Influenciador                                  | Rotación, formación lenta                | Matching de perfiles, formación asistida                               | Time-to-hire, churn, horas formación   |
| IT / Sistemas                    | Infra y seguridad                | **Aprobador técnico** / posible **bloqueador** | Integración, seguridad, mantenimiento    | MLOps, integración con ERPs/CRMs, SSO                                  | Uptime, MTTR, incidencias              |
| Datos / BI (si existe)           | Informes, modelos                | **Campeón técnico**                            | Fuentes dispersas, calidad datos         | Lakes, pipelines, modelos, dashboards                                  | Freshness, integridad, adopción BI     |
| Legal / Compliance / DPO         | Protección de datos              | **Bloqueador legítimo**                        | Privacidad, contratos, IA ética          | Evaluaciones de impacto, trazabilidad                                  | Incidencias, cumplimiento              |

> **Compradores reales** por sector (atajos):
>
> * **Industria**: Operaciones/Producción + IT; firma Dirección.
> * **Retail/hostelería**: Marketing/Comercial + Dirección.
> * **Salud/regulado**: Dirección + Calidad/Compliance + IT/Datos.
> * **Logística**: Operaciones + IT + Dirección.

# Departamentos típicos en COMPETIDORES (empresas de IA)

| Departamento                  | Misión                   | Señales externas (lo que verás) | Fortalezas                 | Puntos débiles (para competir)          |
| ----------------------------- | ------------------------ | ------------------------------- | -------------------------- | --------------------------------------- |
| Dirección (CEO/COO)           | Estrategia, partners     | Notas de prensa, eventos        | Relación institucional     | A veces lejos del “dolor” local         |
| Producto (CPO/PM)             | Roadmap, UX              | Jobs, changelogs                | Repite features escalables | Gap en personalización local            |
| I+D / ML Research             | Modelos, papers          | GitHub, arXiv, blogs            | Innovación, benchmarks     | Coste alto, poco “factory floor”        |
| Data Science                  | Modelado aplicado        | Cases/whitepapers               | KPIs claros                | Dependencia de datos del cliente        |
| Data Eng / MLOps              | Pipelines, despliegue    | Vagas de MLOps, Terraform       | Robustez, CI/CD            | Integración lenta en legados            |
| Ingeniería SW / Integraciones | Conectar con ERP/CRM/IoT | Conectores públicos             | Velocidad                  | ERPs locales/verticales poco soportados |
| Ventas (AE/SDR)               | Cierre y prospección     | SDR en LinkedIn, outreach       | Pitch afilado              | Desconexión de casuística local         |
| Customer Success              | Adopción, renovación     | Testimonios                     | Retención                  | Overbooking si crecen rápido            |
| Marketing / Growth            | Demanda, marca           | Webinars, ebooks                | Presencia                  | Mensaje genérico, poco nicho            |
| Seguridad / Compliance        | Certs, DPA               | ISO, SOC, DPO                   | Confianza                  | Burocracia puede ralentizar             |
| Finance / Legal               | Pricing, contratos       | Términos web                    | Escalabilidad              | Menos flex en pymes pequeñas            |
| People / Talent               | Hiring                   | Ofertas técnicas                | Equipo fuerte              | Rotación, salarios altos                |

> **Cómo atacarles**: especialízate en **vertical local** (ERP regional, procesos de un polígono concreto, normativas autonómicas), ofrece **implementaciones rápidas** (4–8 semanas) y **trazabilidad** (auditoría de decisiones). Ahí los grandes sufren.

# Versiones “por tamaño” en CLIENTES

* **Micro (1–9)**: Dirección hace de todo; IT externalizado; compra “plug-and-play”.
* **Pequeña (10–49)**: Operaciones y Comercial existen; IT incipiente; presupuesto contenido; quieren quick wins.
* **Mediana (50–249)**: Ya hay **IT/BI** y **Controlling**; decisiones colegiadas; integraciones serias (ERP, MES, CRM).
* **Grande (250+)**: **Compliance/DPO** muy presentes; RFPs; certificaciones.

# Mapa de compra (rápido)

* **Campeones**: Operaciones/Producción, BI/Datos, a veces Marketing.
* **Económico**: Dirección/Finanzas.
* **Aprobador técnico**: IT/Seguridad.
* **Usuarios**: Operadores, comerciales, agentes de soporte.
* **Bloqueadores**: IT (seguridad/legado), Legal/DPO, Calidad.

# Pistas tácticas por vertical (muy resumidas)

* **Industria**: habla con **Jefe de Producción** y **Responsable de Mantenimiento**; vende “menos paradas y menos merma”.
* **Retail/hostelería**: **Marketing/Comercial**; vende “más ticket medio y menos rotura de stock”.
* **Salud/regulado**: **Calidad/Compliance** + **Dirección**; vende “trazabilidad y reducción de error”.
* **Logística**: **Operaciones**; vende “menos km y mejor puntualidad”.

---

Si te va bien, en el siguiente paso te preparo **listas de cargos concretos** (títulos en español habituales) y **scripts de acercamiento** por departamento (email/LinkedIn) + una **checklist de adopción** para entrar a pyme valenciana en 30 días. ¿Lo hago?

