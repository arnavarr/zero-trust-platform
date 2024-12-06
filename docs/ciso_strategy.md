## CISO: Estrategia Zero Trust Open Source

**Estrategia**: Impulsar un enfoque Zero Trust con herramientas open source, evitando dependencias propietarias y priorizando la granularidad de control, la interoperabilidad con estándares globales y la escalabilidad en entornos dinámicos.

- **Decisión de Políticas (PDP)**: Elegimos Casbin y Warrant por su enfoque abierto y modular. Nos alejamos de soluciones propietarias para asegurar independencia y adaptabilidad.
- **Administración de Políticas (PA)**: OPA con Rego permite políticas complejas y reutilizables. Optamos por Rego frente a lenguajes menos expresivos, garantizando mayor control y auditoría.
- **Enforcement (PEP)**: Kong Gateway proporciona un plano de control extensible. Preferimos esto frente a gateways menos flexibles para mantener un enforcement homogéneo.
- **ICAM**: Gluu brinda soporte a estándares (OAuth2, OIDC, SAML), garantizando integración con múltiples proveedores sin perder soberanía sobre la identidad corporativa.

Estas elecciones reflejan una postura estratégica que evita el lock-in, incrementa la resiliencia y promueve una adopción escalonada del modelo Zero Trust sin debilitar la postura de seguridad. Se prioriza la robustez técnica, la transparencia del código y la adopción de estándares internacionales. No se opta por lo neutral sino por lo sólido, flexible y transparente.

