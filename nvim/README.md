# Configuración de Neovim

Esta es la configuración de mi editor de texto Neovim. He organizado los archivos en una estructura de carpetas para mantenerlos ordenados y fáciles de encontrar.

## Estructura de carpetas

- `init.lua`: Este archivo carga la carpeta `config` y se encarga de configurar Neovim.

- `lua/plugins`: En esta carpeta se encuentran los archivos que definen los plugins que he instalado en Neovim, organizados por categorías:
  - `utility.lua`: Plugins de utilidad.
  - `ide.lua`: Plugins de desarrollo.
  - `ui.lua`: Plugins de interfaz.

- `lua/config`: Esta carpeta contiene archivos que configuran aspectos específicos de Neovim:
  - `init.lua`: Carga individualmente cada archivo de la carpeta `config`.
  - `set.lua`: Define las opciones activadas para Neovim.
  - `map.lua`: Define los mapeos de teclado.
  - `lazy.lua`: Contiene la configuración de Lazy, que es un cargador de plugins perezoso.

- `snippets/tex.lua`: Este archivo contiene snippets de LaTeX para usar con el plugin LuaSnip.

## Funcionamiento

Al iniciar Neovim, el archivo `init.lua` carga la carpeta `config` y los archivos dentro de ella. De esta manera, se cargan las opciones, los mapeos de teclado y los plugins de forma organizada.

Los plugins están divididos en tres archivos dentro de la carpeta `plugins`, cada uno correspondiente a una categoría específica. Los archivos de configuración de Neovim se encuentran en la carpeta `config`, organizados por función.

Además, he utilizado el plugin LuaSnip para mejorar la eficiencia al escribir en LaTeX. Los snippets de LaTeX se encuentran en el archivo `snippets/tex.lua`.
