# Obligatorio 2 Taller de Programación

Integrantes:

- Esteban Moroy
- Bruno Riera
- Ignacio Martínez

Problema Elegido: Nro. 28

[Link al repositorio](https://github.com/estebanmoroy/obligatorio-1-taller)

### Cosas que faltan

- [ ] Sección ¿Qué es GitHub?
- [ ] Sección ¿Qué es un GitHub Issue? ¿Para que sirven?

- [ ] Template para Documentación
- [ ] Template para Mejoras
- [ ] Template para Bugs
- [ ] Generar 2 reportes para cada tipo de template

## Contenido

Se genera a lo último

## Presentación

### Presentación del problema

28. Problema:
    La empresa necesita de un mejor seguimiento acerca del reporte de problemas y
    mejoras en la documentación y el código, así como los bugs en su código.

Solución:
En un repositorio en GitHub, implementar “templates” de GitHub Issues para al
menos los siguientes diferentes tipos de reportes:

- Documentación
- Mejoras
- Pedido de nueva funcionalidad (Feature request)
- Bugs

Debe investigar buenas prácticas y elementos a incluir para cada tipo de reporte, así
como ejemplificar con al menos 2 reportes cada categoría. Para el código, puede
servirse de su entrega del Obligatorio 1, a la cual puede realizarle modificaciones.

### ¿Qué es GitHub?

### ¿Qué es un GitHub Issue? ¿Para que sirven?

## Generar un repositorio de git local y subir a GitHub

1. Crear un repositorio de git local en la carpeta del proyecto

```bash
git init
```

![Captura 1](capturas/1.png)

2. Agregar los archivos al repositorio

```bash
git add .
```

3. Agregar .gitignore para los archivos que se generan durante la ejecución

```bash
touch .gitignore
echo "usuarios.txt" >> .gitignore
echo "informe.txt" >> .gitignore
```

![Captura 2](capturas/2.png)

4. Crear un commit

```bash
git commit -m "Primer Commit"
```

![Captura 3](capturas/3.png)

### 5. Crear un repositorio en GitHub

5.1 En la página principal de GitHub, una vez logueados, clickear en "New"
![](capturas/github-1/1.jpeg)

5.2 Darle un nombre al repositorio
![](capturas/github-1/2.jpeg)

5.3 Darle una descripción al repositorio
![](capturas/github-1/3.jpeg)

5.4 Clickear en "Crear Nuevo Repositorio"
![](capturas/github-1/4.jpeg)

5.5 En la sección de "Quick setup" seleccionar la opción SSH
![](capturas/github-1/5.jpeg)

5.6 Copiar la dirección SSH
![](capturas/github-1/6.jpeg)

5.7 Agregar la dirección SSH del repositorio remoto copiada

```bash
git remote add origin
```

### 6. Opcional - Configurar clave SSH

En caso de que no se tenga configurada una clave de autenticación remota SSH, se muestran los pasos para configurar una.
Se realizó siguiendo instructivo publicado en GitHub:

[Generación de una nueva clave SSH y adición al agente SSH](https://docs.github.com/es/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

6.1 Generar llave SSH con el correo electrónico registrado en GitHub

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

6.2 Cuando se pida, escribir una frase segura como contraseña
![](capturas/4.png)

6.3 Verificar si la clave se generó correctamente

```bash
$ eval "$(ssh-agent -s)"
```

![](capturas/5.png)

6.4 Agregar la llave al ssh-agent

```bash
ssh-add ~/.ssh/id_ed25519
```

![](capturas/6.png)

6.5 En la sección de usuario de GitHub, dirigirse a Settings
![](capturas/github-2/2.jpeg)

6.6 Seleccionar "Llaves SSH y GPG"
![](capturas/github-2/3.jpeg)

6.7 Seleccionar "Nueva llave SSH"
![](capturas/github-2/4.jpeg)

6.8 Agregar un nombre a la llave
![](capturas/github-2/5.jpeg)

6.9 En consola usar el comando debajo y pegar el resultado en el campo "Llave"

```bash
cat ~/.ssh/id_ed25519.pub
```

![](capturas/github-2/6.jpeg)

6.10 Seleccionar "Agregar llave SSH"
![](capturas/github-2/7.jpeg)

6.11 Subir los archivos al repositorio remoto

```bash
git push -u origin master
```

![](capturas/7.png)

6.12 Verificar que se agregaron los archivos correctamente
![](capturas/8.png)

## Crear un template de GitHub Issue en formato MarkDown (.md)

1. En la página del repositorio dirigirse a la pestaña Settings
   ![](capturas/issues-md/1.jpeg)

2. En la sección de Issues, seleccionar Configurar Templates
   ![](capturas/issues-md/2.jpeg)

3. Seleccionar el tipo de template a configurar
   ![](capturas/issues-md/3.jpeg)
   ![](capturas/issues-md/4.jpeg)

4. Seleccionar Preview y Editar
   ![](capturas/issues-md/5.jpeg)

5. Clickear en el ícono del lápiz para editar el template
   ![](capturas/issues-md/6.jpeg)

6. Agregar el contenido del template deseado
   ![](capturas/issues-md/7.jpeg)

7. También se pueden agregar títulos por defecto y etiquetas
   ![](capturas/issues-md/8.jpeg)

8. Se puede seleccionar alguna de las etiquetas predeterminadas
   ![](capturas/issues-md/9.jpeg)
   ![](capturas/issues-md/10.jpeg)

9. O agregar una nueva customizada
   ![](capturas/issues-md/11.jpeg)

10. Luego de finalizado clickear en Proponer cambios
    ![](capturas/issues-md/12.jpeg)

11. Esto genera un commit con el template generado en formato MarkDown
    ![](capturas/issues-md/13.jpeg)

![](capturas/issues-md/14.jpeg)

## Crear un template de GitHub Issue en formato Yaml (.yml)

En caso de que se desee un mayor nivel de personalización, se pueden configurar los templates de Issues en formato Yaml, los cuales permiten generar campos específicos, listas desplegables, checkboxes, entre otros.

Pasos a seguir:

1. Actualizar el repositorio para traer los últimos cambios del servidor

```bash
git pull
```

2. Luego dirigirse a la carpeta .github/ISSUE_TEMPLATE/
   ![](capturas/issues-yaml/1.png)

3. Generar un archivo para el template, en este caso se llama "feature_request.yml"

```bash
touch feature_request.yml
```

4. Escribir en el archivo siguiendo la conveción para formularios de GitHub:
   [Syntax for GitHub's form schema](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/syntax-for-githubs-form-schema)

![](capturas/issues-yaml/2.png)

5. Eliminar el archivo .md anteriormente generado

```bash
git rm feature_request.md
```

6. Y agregar el nuevo archivo .yml generado

```bash
git add feature_request.yml
```

7. Crear un commit para confirmar los cambios y pushearlos al repositorio

```bash
git commit -m "Se agrega archivo .yml para las Feature Requests
git push origin master
```

![](capturas/issues-yaml/4.png)

8. Verificar cambios generando un nuevo Issue
   ![](capturas/issues-yaml/5.png)

Ahora el formulario cuenta con varios campos de texto para cada sección solicitada
![](capturas/issues-yaml/6.jpeg)

## Fuentes

[YouTube - Github Issue Templates: A Look at the New Issue Templates](https://www.youtube.com/watch?v=o3E3LwzhLcc)

[GitHub - Configuring issue templates for your repository](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/configuring-issue-templates-for-your-repository)

[GitHub - Syntax for GitHub's form schema](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/syntax-for-githubs-form-schema)
