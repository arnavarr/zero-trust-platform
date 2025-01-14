# Arquitectura Zero Trust Basada en OpenZiti y Open Source

## Justificación
Se adopta una arquitectura Zero Trust con herramientas open source por su capacidad de integración sin lock-in propietario, su flexibilidad para aplicar políticas complejas (Rego) y su escalabilidad en entornos multinube o híbridos. La inclusión de OpenZiti como capa de overlay habilita la microsegmentación real y elimina la dependencia de configuraciones monolíticas en la aplicación, al abstraer la conectividad segura con su SDK y un IdP centralizado. Además, se aprovecha Kubernetes junto con Kong Gateway como punto de entrada (Ingress) para gestionar el tráfico y reforzar la aplicación de políticas.

---

## Componentes Clave

### Policy Decision Point (PDP) y Policy Administrator (PA)
- **OPA + Rego**: 
  - Actúa como motor central de autorización (PDP) y, además, permite definir y gestionar (PA) las políticas de manera expresiva.  
  - Su integración nativa con Kubernetes facilita la aplicación de políticas tanto a nivel de infraestructura como en aplicaciones.

- **Spinnaker**: 
  - Gestiona despliegues continuos y facilita pipelines con control de acceso integrado.
  - Permite asegurar que cada nueva versión cumpla con las políticas de seguridad definidas en OPA + Rego.

### Policy Enforcement Point (PEP)
- **OpenZiti (con su SDK)**:
  - Proporciona microsegmentación y un canal seguro para los servicios y terminales.
  - Permite que las políticas definidas en OPA + Rego se apliquen de forma unificada sin requerir frameworks adicionales en la aplicación.
  
- **Kong Gateway (Ingress en Kubernetes)**:
  - Punto de entrada para las solicitudes externas, manejando autenticación y aplicación de políticas en el nivel de API.
  - Soporta múltiples protocolos y ofrece un amplio ecosistema de plugins para funcionalidades adicionales (rate limiting, logging, etc.).

### Identity, Credential, and Access Management (ICAM)
- **Gluu Server**:
  - Fuente central de identidad, permite federar SAML/OIDC y cumplir con directrices IAM.
  - Aporta neutralidad frente a proveedores y facilita la interoperabilidad con los diferentes componentes.

---

## Flujos Recomendados

1. **Autenticación Centralizada**  
   Gluu Server asume el rol de IdP, gestionando la autenticación centralizada y las federaciones necesarias para usuarios y servicios.

2. **Autorización por Políticas**  
   OPA + Rego centraliza y distribuye las políticas de forma coherente para todos los servicios y terminales. Cada solicitud se evalúa según las reglas definidas en Rego.

3. **Enforcement Estandarizado**  
   - **OpenZiti** garantiza la microsegmentación y asegura el tráfico desde terminales y servicios, impidiendo accesos no autorizados.  
   - **Kong Gateway** actúa como Ingress en Kubernetes, aplicando las políticas definidas en OPA + Rego a todas las API y servicios expuestos.

4. **Delivery Integrado**  
   **Spinnaker** orquesta el despliegue continuo e integra validaciones de políticas, asegurando que cada cambio en la infraestructura o aplicación cumpla el enfoque Zero Trust.

---

## Preferencias y Razones

- **OPA + Rego**: Provee un lenguaje expresivo para definir y evaluar políticas de seguridad, facilitando la adopción de un modelo Zero Trust en entornos distribuidos.  
- **OpenZiti**: Permite la microsegmentación y reduce la complejidad de seguridad en la capa de aplicación, ya que abstrae la conectividad de manera transparente.  
- **Kong (Ingress en Kubernetes)**: Unifica la aplicación de políticas y la gestión de tráfico, ofreciendo un ecosistema de plugins para extender la funcionalidad según necesidades empresariales.  
- **Gluu**: Asegura la neutralidad con respecto a los proveedores de identidad y cumple con los estándares de autenticación federada.  
- **Spinnaker**: Controla el pipeline de despliegue continuo e incorpora la verificación de políticas para garantizar que cada nueva versión mantenga los principios Zero Trust.
