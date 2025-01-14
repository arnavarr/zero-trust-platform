## CISO: Estrategia Zero Trust Open Source

**Estrategia**: Impulsar un enfoque Zero Trust con herramientas open source, evitando dependencias propietarias y priorizando la granularidad de control, la interoperabilidad con estándares globales y la escalabilidad en entornos dinámicos.

- **Decisión de Políticas (PDP) y Administración de Políticas (PA)**:  
  - **OPA con Rego** se adopta como núcleo tanto para la definición como para la evaluación de políticas, al ofrecer un lenguaje expresivo y reutilizable.  
  - Este enfoque garantiza independencia frente a soluciones propietarias y proporciona una mayor capacidad de auditoría y adaptación a distintos escenarios.

- **Enforcement (PEP)**:  
  - **Kong Gateway** se elige como plano de control extensible para unificar políticas y autenticaciones a nivel de API.  
  - **OpenZiti** ofrece una capa de microsegmentación real, reduciendo la superficie de ataque y garantizando que el enforcement no dependa únicamente de la configuración de cada aplicación.

- **ICAM**:  
  - **Gluu** brinda soporte para estándares (OAuth2, OIDC, SAML) y garantiza la independencia de proveedores, permitiendo la soberanía sobre la identidad corporativa y facilitando la integración con entornos diversos.

Estas elecciones reflejan una postura estratégica que evita el lock-in, incrementa la resiliencia y promueve una adopción escalonada del modelo Zero Trust sin debilitar la postura de seguridad. Se prioriza la robustez técnica, la transparencia del código y la adopción de estándares internacionales. No se opta por lo “neutral” sino por lo sólido, flexible y transparente.
