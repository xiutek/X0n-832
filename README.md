# Proyecto X0n-832



Codificación de la teoría musical


  Objetivo:
  - Sistema que identifique las propiedades acústicas que determinan la teoría musical para modificar las variables
  - Entender la forma en la que se construyen las escalas para identificar sistemas de escalas y armonías
  - Se utilizara la teoría física de Wolfram como marco de referencia teórico y software de investigación y visualización
  - Se utilziará C# y SuperCollider
  - Utilizar herramientas digitales para crear interfases amigables con los músicos

  Conocimiento previo:
  - Escala es la forma en la que se arreglan discretamente los sonidos audibles
  - El sonido audible ocurre a frecuencias entre los 20 y 20,000 Hz y amplitudes simbólicas entre 0 y 1
  - La octava es el doble de una frecuencia y corresponde a la división estandar primaria del espectro audible (escala)
  - La octava corresponde al segundo armónico de un sonido
  - En el temepramento actual los intervalos dentro de una octava se obtiene en dividiendo en doce intervalos iguales (semitonos) la misma
  - Estos doce semitonos corresponden al círculo de quintas es decir corresponden también a construir todos los intervalos posibles a partir del tercer armónico
  - Forma de los intervalos dentro de una octava dentro del temperamento actual
    O = (F*F)/G [O= Octava, F= Fundamental, G=Grados]
  - Se pueden considerar tanto escalas logarítmicas como lineales para determinar la posición de los sonidos
  - La sintaxis que se utiliza en este documento es pseudocódigo libre
  

  1. Variables y estructura lógica de la teoría musical
  
    Glosario:
    
    fromato: información | explicación
    
    {} = contenedor de información | {1} se trata de un contenedor con el valor 1 | {1,2,3} se trata de un contenedor de un valor que puede ser 1, 2 o 3
    
    [] = elemento de una lista | {[1],[2],[3]} se trata de un contenedor con 3 valores | {[1],[{1,2}]} se trata de un contenedor de dos valores: 1 y 1 o 2
    
    () = agrupador visual: se utilzia para facilitar la lectura de datos
    
    + - * / ^ ! = Suma, resta, multiplicación, división, potencia, raíz
    
    varible: se trata del nombre de un contenedor de información
    
    argumento:  se trata de la información contenida por un contenedor
    
    || = El valor default de una variable
    
    "..." Abreviatura para una serie se valores
    
    // comentario
    
    PE: Por ejemeplo



    Ejemplos:
    { [ ( [1], [1], [3], ) / 2 ], [1], [{x}] } se trata de un contenedor con tres valores: El primer valor es a su vez un contenedor de tres valores: 0.5, 0.5, 1.5.  El segundo valor es simplemente 1. El tercer valor es un contenedor con valor "x", que puede referirse a otro contenedor.
    {[1], ... ,[5]} se trata de un contenedor con 5 valores: 1, 2, 3, 4 y 5. Los tres puntos resumen los elementos intermedios en la serie


  2. Variables y Argumentos
    
    formato: variable = {argumento 1, argumento 2} || valor default de las variables | ejemplo

    // Espectro audible
    eau = {[min],[max]}
    || def: eau{[20],[20000]}

    // Frecuencia fundamental
    fnd = {eau[min]}
    || def: fnd = {20}

    // Definición de ciclo ("octava")
    cyc = {{fnd}*2}
    | multiplicar la fundamental por dos es la definición de una octava

    // Subfundamentales ("índices")
    sfn = {[0={fnd}],[1={[0]*2}], ... ,[9={[8]*2}]}
    || sfn{3}=(((fund*2)*2)*2)
    | fnd=20, sfn{4}=320 (ya que ((((20*2)*2)*2)*2)=320)

    // Estructura interna del ciclo (temperamento)
    cye = {[sym],[ord]}

      // Simetría de las divisiones
      sym={0,1,2, ... ,9}
      | (reglas con las que se obtienen los grados de la escala)

        * sym{1} = {[a=sfn{x}*1.5],[b=a*0.5],[c=b*1.5],[d=c*0.75],[e=d*1.5],[f=e*0.75],[g=f*0.75],[h=g*1.5],[i=h*0.75],[j=i*1.5],[k=j*0.75]}
        | Modelo: (((sfn{x}/3)/3)...) → ajustar los datos al rango del ciclo
        | PE: sym{1}={[a=130*1.5],[b=195*0.75],[c=146.25*1.5],[d=219.375*0.75],[e=164.53125*1.5],[f=246.796875*0.75],[g=185.09765625*0.75],[h=138.823242188*1.5],[i=208.234863282*0.75],[j=156.176147461*1.5],[k=234.264221191*0.75])
        |     sym{1}={[195],[146.25],[219.375],[164.53125],[246.796875],[185.09765625],[138.823242188],[208.234863282],[156.176147461],[234.264221191],[175.698165893]}
        | Este sistema corresponde a las 11 notas (sol, re, la, mi, si, fa#, do#, sol#, re#, la#, fa) del  temperamento pitagórico para una subfundamental de 130hz

        * sym{2} =  {[a=sfn{x}+(1/12 de sfn{x})], ... , [k=sfn{x}+(11/12 de sfn{x})]}
        | Este sistema corresponde a una división de 12 pasos iguales sobre una escala, es por lo tanto una escala lineal proyectada sobre una escala logaritmica
        | esta propiedad causa que los sonidos graves tengan intervalos más amplios entre ellos que los agudos
        
    // Orden de las divisiones
    ord= {[x],...,[x]}


  3. Lógica
