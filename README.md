# GnW por julenvitoria
Game & Watch Super Mario 35th aniversary y Zelda - menus utilidades para backup, restauracion y flasheo de CFW y Retro-Go.

ATENCION: ESTOS MENUS ESTAN AUN SIN TERMINAR.

ACTUALIZACIÓN: 

08/03/2022: LANZAMIENTO DE LOS MENÚS

25/05/2022: CAMBIO DE REPO DE RETROGO AL DE OLDERZEUS

01/01/2023: CAMBIO DE REPO DE RETROGO AL DE SYLVERB

14/02/2023: SE AÑADE OPCIÓN CARATULAS

21/02/2023: OPCIÓN SOLO RETROGO PARA TODAS LAS MEMORIAS

22/02/2023: SE ELIMINA OPCIÓN EN UN PASO EN TODOS LOS MENÚS PORQUÉ PROVOCA MUCHOS ERRORES ENTRE LOS USUARIOS

07/03/2023: OPCION CARÁTULAS, MENÚS SAVE STATES TANTO EN MARIO CON EN ZELDA Y PARA TODAS LAS MEMORIAS, MENÚ HERRAMIENTAS (ACTUALIZADOR STLINK, MAKE RESET Y FLASH TEST)

11/04/2023: SE AÑADE OPCION DE HERRAMIENTAS FLASH TEST, MAKE RESET Y ACTUALIZADOR DEL STLINK DENTRO DEL MENU SCENE

08/06/2023: CREACION DE ENTORNO VIRTUAL DE PYTHON PARA LA INSTALACION DE MODULOS MEDIANTE PIP3 Y SU EJECUCION DURANTE EL PROCESO EN UBUNTU 23.04 O POSTERIOR

02/09/2023: SE AÑADE REPOSITORIO UNIVERSE PARA LA INSTALACION DE CIERTOS PAQUETES QUE DEJAN DE INSTALARSE CON LA NIEVA VERSIÓN DE UBUNTU 

10/02/2024: SE AÑADEN CAMBIOS DURANTE LA PREPARACIÓN DEL SISTEMA PARA LA INSTALACIÓN DE LOS REQUERIMIENTOS DE LOS PORTS DE SNES SÚPER MARIO WORLD Y ZELDA

22/02/2024: SE ACTUALIZA LA PREPARACIÓN DEL SISTEMA PARA LA INSTALACIÓN DE UNA VERSIÓN DEL GCC MÁS MODERNA

08/05/2024: SE REALIZAN CAMBIOS EN LA PREPARACIÓN DEL SISTEMA PARA QUE SE INSTALE LO NECESARIO PARA EL CORRECTO FUNCIONAMIENTO DURANTE EL FLASHEO DEL CFW PORQUÉ AHORA FUNCIONA CON GNWMAMAGER. RETROGO SIGUE FUNCIINANDO COMO HASTA AHORA HASTA QUE SYLVERB MERGEE SU RAMA FILESYSTEM Y LO HAGA OFICIAL. TAMBIÉN SE DA SOPORTE PARA 128MB Y 256MB EN EL MENÚ PARA FLASHEAR  “SOLO RETROGO”.

Necesitaras introducir los siguientes comandos en una ventana de terminal:


    cd ~
    
    git clone https://github.com/julenvitoria/GnW


Una vez realizado solo tendras que acceder al directorio con:


    cd GnW


y ejecutar el menu con:


    ./menu.sh

Una vez lanzado el menu es TOTALMENTE NECESARIO ejecutar las opciones 1 y 2 (cambio usuario y cambio de modelo de consola) del menu principal.

Cabe destacar que los menus instalan todo el software en:

/home/$usuario/gameandwatch 

donde $usuario es el usuario que hay que indicarle en la opcion 1 del menu de instalacion.
Por ejemplo, si el usuario que introducimos es pepito el directorio de instalacion seria:

/home/pepito/gameandwatch

;)

*****************************

Conexiones de las placas de Mario 35 aniversario y Zelda:

MARIO 35th ANIVERSARY
![5C31E0BB-8494-49D9-A9AF-945A3DA73A72](https://user-images.githubusercontent.com/36037023/173341010-8073b4a8-d50a-42ad-a823-e50416db6ccb.jpeg)

ZELDA
![D9157435-C2FA-4AD2-B7B0-4BEC4ACFF332](https://user-images.githubusercontent.com/36037023/173341112-570a597f-d710-46e1-8262-b1b939d9caf8.jpeg)

*****************************

Pequeños ejemplos orientativos de errores y situaciones que se pueden dar durante el proceso:

Ejemplo de chip recien soldado y funcionando correctamente. Esto sale porque aun no hemos flasheado nada en el y su contenido esta en raw (sin formato) por lo que es logico que salga una imagen corrupta, pero repito, si sale esto es que esta funcionando correctamente:
![0A7A7CE2-4AC0-4E3D-90C6-FC481F899658](https://user-images.githubusercontent.com/36037023/168867528-cf122aef-fff6-4f58-8379-62b71c8d2a22.jpeg)

Ejemplo de chip mal soldado: esto sale al ir a flashear retrogo, al intentar entrar a través del cfw también
![3998F26D-D8AD-43AD-9E16-06285DE3CBEB](https://user-images.githubusercontent.com/36037023/168866279-80ecc928-498b-49ed-9673-3542de4bcf1a.jpeg)

Ejemplo de chip abombado causado por haber venido mal o por haberle dado mucho calor con el soldador durante tiempo excesivo. Cuando  ocurre eso también suele salir la imagen de chip mal soldado.
![9ABD9809-48DB-4AF2-8708-69B69FB41B7F](https://user-images.githubusercontent.com/36037023/168869468-7d28cb5f-89c4-41b4-844c-4b18e9b6e523.jpeg)

Problemas generados con los stlink:
1-problemas con el firmware: es conveniente actualizar el firm siempre para evitarnos posibles errores.
2-problemas con las soldaduras: en ocasiones creemos que el problema es de las soldaduras del chip de memoria porque no logramos conectar pero el problema también puede venir por el propio stlink y sus soldaduras chinescas. Las soldaduras que habría que repasar son las de siguiente foto y las mismas pero del otro lado
![image](https://github.com/user-attachments/assets/45657b91-c149-4db7-aa4c-06303f9c3a06)

*****************************

Materiales necesarios: (si no funcionará el link buscar por el nombre a través de la descripción o por foto
1-[ST link V2](https://a.aliexpress.com/_u7VS8M)
![95E94529-7184-46CC-A800-C0FCBC8CAA69](https://user-images.githubusercontent.com/36037023/168863464-2a07307e-3636-4d4b-be12-6343ee28cf5e.jpeg)

2-Chips y sus tipos:
[Chip de 16MB MX25U12835FM2I-10G] (https://a.aliexpress.com/_uWIOQL)
![EAE5FA90-E5FD-4A41-8AE6-6170AB160C26](https://user-images.githubusercontent.com/36037023/168864970-43b40a37-1a20-45d3-9065-5e06a3754d1c.jpeg)

[Chip de 64MB MX25U51245GZ4I00] (https://a.aliexpress.com/_vEvapZ)
(https://a.aliexpress.com/_EwP5SL9)
![13DFCC5B-DB22-4210-8C69-BE9A819BE259](https://user-images.githubusercontent.com/36037023/168864375-0fe08d17-7bf0-4f68-b122-3f673a20441c.jpeg)

*****************************

Principales fuentes para backup, desbloqueo, patch (CFW) y emulador (Retro-Go):

[Repo de ghidraninja: Backup, restauracion y flasheo](https://github.com/ghidraninja/game-and-watch-backup)
    
[Repo de kbeckmann: emulador Retro-Go](https://github.com/kbeckmann/game-and-watch-retro-go)

[Repo de sylverb: emulador retro-go modificado para emular MSX, MegaDrive, etc, con mejoras de código](https://github.com/sylverb/game-and-watch-retro-go)
    
[Repo de Brian Pugh: Parche para tener custom firmware](https://github.com/BrianPugh/game-and-watch-patch)

[Canal Discord en ingles](https://discord.gg/vVcwrrHTNJ)

[Canal Discord en español](https://discord.com/invite/rvRHEeVEKR)

[Guia para novatos en ingles (mensaje fijado de Discord)](https://docs.google.com/document/d/1-x6tibLxtOPf6ZbQL0ZM48XGe1-LLEfl8HpBg8gBu_M/edit)
    
[Hardware](https://github.com/Upcycle-Electronics/game-and-watch-hardware)
    
