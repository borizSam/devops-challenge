# 🚀 DevOps Challenge: Automatización y Despliegue Básico en Docker

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)

## 📌 Descripción

Este proyecto es un desafío de DevOps que consiste en contenedorizar una aplicación simple en Node.js y desplegarla utilizando Docker y Docker Compose. El objetivo principal es automatizar la creación de la imagen, configurar un pipeline básico de CI/CD con GitHub Actions y hacer que la aplicación funcione localmente con una base de datos PostgreSQL.

## 🎯 Objetivos

1. **Configuración y Contenedorización**:
   - Escribir un `Dockerfile` para una aplicación en Node.js.
   - Crear un `docker-compose.yml` para levantar la aplicación junto con PostgreSQL.

2. **Automatización con CI/CD**:
   - Configurar un pipeline con GitHub Actions que:
     - Construya la imagen Docker.
     - Ejecute pruebas básicas.
     - Publique la imagen en Docker Hub.

3. **Prueba y Despliegue Local**:
   - Ejecutar la aplicación localmente con `docker-compose up`.
   - Verificar que la aplicación responde correctamente.

## Configuración del Proyecto

### Estructura del Proyecto

```bash
mkdir devops-challenge && cd devops-challenge
touch Dockerfile docker-compose.yml app.js package.json
mkdir -p .github/workflows
touch .github/workflows/ci-cd.yml

```

# Diagrama Topologico:

                          ┌───────────────────────────────┐
                          │        Desarrollador          │
                          │  (Escribe y sube código)      │
                          └─────────────┬───────────────┘
                                        │
                                        ▼
                          ┌───────────────────────────────┐
                          │        Repositorio Git        │
                          │      (GitHub / GitLab)        │
                          └─────────────┬───────────────┘
                                        │ (Trigger CI/CD)
                                        ▼
                          ┌───────────────────────────────┐
                          │       Pipeline CI/CD          │
                          │ (GitHub Actions ejecuta)      │
                          ├─────────────┬───────────────┤
                          │             │               │
             ┌────────────▼───┐  ┌──────▼──────────┐  ┌─▼────────────────┐
             │ Build & Test   │  │ Docker Build   │  │ Push to Registry  │
             │ (Lint, Test)   │  │  (Imagen .tar) │  │ (DockerHub, ECR)  │
             └───────────────┘  └────────────────┘  └───────────────────┘
                                        │
                                        ▼
                          ┌───────────────────────────────┐
                          │  Docker Compose Deployment   │
                          │  (Levanta App y PostgreSQL)  │
                          ├─────────────┬───────────────┤
                          │             │               │
             ┌────────────▼───┐  ┌──────▼──────────┐  ┌─▼────────────────┐
             │   App Node.js  │  │ PostgreSQL DB  │  │   Expose en 3000  │
             │  (Contenedor)  │  │  (Contenedor)  │  │  (localhost:3000) │
             └───────────────┘  └────────────────┘  └───────────────────┘
                                        │
                                        ▼
                                ┌───────────┐
                                │  Usuarios │
                                │ (Acceden) │
                                └───────────┘

## 🎯 Explicación del Flujo

1. **El desarrollador escribe código y lo sube a GitHub**.
2. **GitHub Actions se activa automáticamente**:
   - Construye la imagen Docker.
   - Ejecuta pruebas.
   - Publica la imagen en Docker Hub.
3. **Docker Compose levanta la aplicación en local con PostgreSQL**.
4. **Los usuarios pueden acceder a la aplicación en `http://localhost:3000`**.