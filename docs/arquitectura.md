## Arquitectura Zero Trust Basada en Open Source

**Justificación**: Se adopta una arquitectura Zero Trust con herramientas open source por su capacidad para integrarse sin lock-in propietario, su flexibilidad para políticas complejas (Rego), y su escalabilidad en entornos multinube o híbridos.

### Componentes Clave

- **Policy Decision Point (PDP)**:
  - *Warrant*: Enfoque moderno, ABAC/RBAC ligero. Preferible para entornos ágiles.
  - *Casbin*: Modelo flexible y maduro. Recomendado para entornos con múltiples aplicaciones.

- **Policy Administrator (PA)**:
  - *OPA + Rego*: Centralización y expresividad. Se favorece frente a otras herramientas por su integración natural con Kubernetes.
  - *Spinnaker*: Control de despliegues y delivery continuo, facilita pipelines con control de acceso integrado.

- **Policy Enforcement Point (PEP)**:
  - *Kong Gateway*: Soporta múltiples protocolos y plugins. Recomendado por su extensibilidad.
  - *Spring Security*: Autenticación robusta en entornos Java, con integración OAuth2.

- **Identity, Credential, and Access Management (ICAM)**:
  - *Gluu Server*: Federaciones SAML/OIDC, sin dependencia de proveedores propietarios, maximizando interoperabilidad.

### Flujos recomendados

1. **Autenticación Centralizada**: Gluu Server como fuente de identidad, federación y normativas IAM.
2. **Autorización por Políticas**: OPA + Rego distribuye políticas. Casbin/Warrant para decisiones ágiles según ABAC/RBAC.
3. **Enforcement Estandarizado**: Kong Gateway aplica políticas a nivel de API. Spring Security refuerza seguridad en aplicaciones Java.
4. **Delivery Integrado**: Spinnaker gestiona actualizaciones sin perder control sobre políticas y accesos, manteniendo Zero Trust dinámico.

Estas decisiones no son neutrales: preferimos la combinación OPA + Rego y Casbin por su mayor robustez conceptual y flexibilidad técnica, adoptamos Kong por su ecosistema de plugins y escalabilidad, y Gluu por su neutralidad frente a proveedores y cumplimiento de estándares.

