# Arquitectura Zero Trust Basada en OpenZiti y Open Source

## Justificación
Se adopta una arquitectura Zero Trust con herramientas open source por su capacidad de integración sin lock-in propietario, su flexibilidad para aplicar políticas complejas (p. ej. Rego) y su escalabilidad en entornos multinube o híbridos.  
La inclusión de OpenZiti como capa de overlay habilita la microsegmentación real y elimina la dependencia de configuraciones monolíticas en la aplicación (p. ej. Spring Security), al permitir la abstracción de la conectividad segura a través de su SDK y la asociación directa con un IdP.

## Componentes Clave

### Policy Decision Point (PDP)
- **Warrant**: Ideal para entornos ágiles por su modelo ABAC/RBAC ligero.  
- **Casbin**: Recomendada si necesitas un modelo maduro y flexible que dé soporte a múltiples aplicaciones.

### Policy Administrator (PA)
- **OPA + Rego**: Centraliza la definición de políticas y proporciona alta expresividad, especialmente útil en Kubernetes.  
- **Spinnaker**: Gestiona despliegues continuos y facilita pipelines con control de acceso integrado.

### Policy Enforcement Point (PEP)
- **OpenZiti (con su SDK)**: Ofrece un método de microsegmentación nativa y un canal seguro, de modo que las políticas de seguridad pueden aplicarse sin depender de frameworks específicos como Spring.  
- **Kong Gateway**: Soporta múltiples protocolos y plugins, ideal para unificación de políticas de API.  

### Identity, Credential, and Access Management (ICAM)
- **Gluu Server**: Permite federaciones SAML/OIDC y evita la dependencia de proveedores propietarios, maximizando la interoperabilidad.

## Flujos Recomendados
1. **Autenticación Centralizada**  
   Gluu Server como fuente de identidad central, unificando federaciones y directrices IAM.  

2. **Autorización por Políticas**  
   OPA + Rego distribuye las políticas de alto nivel. Casbin o Warrant permiten decisiones rápidas y flexibles según ABAC/RBAC.  

3. **Enforcement Estandarizado**  
   - OpenZiti como overlay para la microsegmentación y control a nivel de red.  
   - Kong Gateway aplica las políticas a nivel de API.  

4. **Delivery Integrado**  
   Spinnaker gestiona actualizaciones continuas y mantiene la coherencia con las políticas, reforzando el enfoque Zero Trust.

## Preferencias y Razones
- **OPA + Rego y Casbin/Warrant**: Ofrecen mayor robustez conceptual y versatilidad para múltiples entornos.  
- **OpenZiti**: Permite microsegmentación real y reduce la necesidad de dependencias en la capa de aplicación, garantizando un modelo Zero Trust integral.  
- **Kong**: Ecosistema de plugins amplio y fácil escalabilidad.  
- **Gluu**: Neutralidad frente a proveedores y total cumplimiento de estándares.

