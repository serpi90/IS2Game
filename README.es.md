# Ingeniería del Software II - IS2Game

[![Build Status](https://travis-ci.org/uca-is2/IS2Game.svg)](https://travis-ci.org/uca-is2/IS2Game)
[![Coverage Status](https://coveralls.io/repos/github/uca-is2/IS2Game/badge.svg)](https://coveralls.io/github/uca-is2/IS2Game)

Ejercicio de modelado de un juego de mesa con objetivos educativos.

El juego simula un juego de mesa, con múltiples jugadores sobre un tablero circular de casilleros, ganado por el primero que termine de dar un número de vueltas sobre el tablero.

- Los movimientos son determinados por tiraradas de dados.
- Algunos casilleros tienen efecto sobre el jugador/jugadores.
- Algunos casilleros hacen que el jugador obtenga cartas, que pueden tener efecto sobre el jugador/jugadores.

## Versión 1

Es un juego de mesa, con varios jugadores juando en secuencia, estos jugadores tiran dados y avanzan de acuerdo a la suma de los dados.

Gana el primer jugador en cruzar el final del tablero.

El tablero tiene N casilleros en secuencia. La cantidad de dados, las caras de los mismos y la longitud del tablero pueden variar de juego a juego, pero siempre son los mismos durante un mismo juego.

### Requisitos de aprobación para la versión 1

- [x] Dados de N caras.
- [x] Posibilidad de usar M dados, no necesariamente con la misma cantidad de caras.
- [x] El juego puede jugarse con más de un jugador.
- [x] Se respeta el orden de turnos.
- [x] Se puede saber si terminó el juego.
- [x] Se puede sabre quien fue el ganador del juego.
- [x] Se puede saber la posición en el tablero de cualquier jugador durante el juego y cuando haya terminado.
- [x] Se puede saber el puesto (1ro, 2do, 3ro, etc) de cualquier jugador durante el juego y cuando haya terminado.

## Versión 2

El tablero pasa a ser circular, una vez que se llega cruza la meta se vuelve al primer casillero. 
Gana quien da X vueltas al tablero.

Además algunos casilleros tienen efectos.
Cuando un jugador cae sobre un casillero, se aplica el efecto del casillero.
Si un jugador es movido por efecto de un casillero, hacia otro casillero con efecto, esto **NO** causa un nuevo efecto.

El tablero se genera al azar con casilleros con efecto, estos puede variar de juego a juego, pero se mantienen durante un juego.

Los casilleros en promedio tienen la siguiente distibución:

| Casillero          | Efecto                                     | Probabilidad |
| :----------------- | :----------------------------------------- | -----------: |
| Bomba Atómica      | Todos vuelven al principio                 |           2% |
| Vacío              | Ninguno                                    |          55% |
| Moonwalk           | Los demás vuelven hacia atras N casilleros |           5% |
| Speed up           | Avanzar 4 casilleros                       |          15% |
| Máquina del tiempo | Vuelve a la posición del turno anterior    |           8% |
| Agujero de Gusano  | Retrocede 4 casilleros                     |          15% |

- Agujero de Gusano
  - Si el jugador vuelve hacia atrás antes del inicio, se considera que está en una ronda negativa.
- MoonWalk
  - Vuelve a todos los demás jugadores N casilleros hacia atrás.
  - No afecta al que cayó en el casillero.
  - El número de casilleros N varía por cada casillero, es decir puede haber casilleros con distinto N en el mismo tablero, pero el N se mantiene constante para cada casillero.
- Bomba atómica
  - Vuelve a todos al primer casillero del tablero.
  - La cantidad de vueltas que dio el cada jugador se mantiene.
- Máquina del tiempo
  - Vuelve a la posición del turno anterior, no a la inicial del turno actual.
  - Ejemplo:
    1. Posición: 3. Tira: 2, Cae en 5, _Vacío_, no hay efecto.
    2. Posición: 5. Tira: 4, Cae en 9, _Máquina del tiempo_, vuelve a la posición 3.

### Requisitos de aprobación para la versión 2

- [x] Todo lo indicado para la versión 1.
- [x] Implementado el tablero circular de X vueltas, X configurable segun el juego.
- [x] Se puede saber en que vuelta esta cada jugador.
- [x] Implementado Bomba Atómica
- [x] Implementado Vacío
- [x] Implementado Moonwalk
- [x] Implementado Speed up
- [x] Implementado Máquina del tiempo
- [x] Implementado Agujero de Gusano
- [x] Los casilleros se distribuyen en la probabilidad indicada.

## Versión 3

Cada jugador arranca el juego con 2 cartas al azar.
Pueden obtener mas pasando sobre un casillero que otorga una carta al azar al jugador que cae en el casillero.

- El casillero vacío pasa a tener 45% de probabilidad de aparecer.
- El casillero que otorga cartas tiene 10% de probabilidade de aparecer.
- El casillero que otorga cartas otorga cartas con probablidad uniforme.

Hay 2 tipos de cartas, instantaneas y permanentes. Esto afecta cuando pueden utilizarse y cuando aplican efecto.

- **Cartas instantáneas:** Pueden jugarse en cualquier momento (independientemente de si es el turno el jugador o no, pero no cuando el juego haya finalizado). Tienen efecto solo en el momento en que se utilizan.
- **Cartas permanentes:** Pueden jugarse solo durante el turno del jugador. Una vez utilizadas, permanencen en juego haciendo efecto hasta ser removidas.

### Consideraciones

- Las cartas en la mano del jugador no tienen efecto en el juego.
- Una vez jugada una carta, esta deja de estar en la mano del jugador.
  - Si es instantanea, se descarta.
  - Si es permanente, aplica su efecto hasta que sea removida.
- Para poder jugar una carta, tiene que estar en la mano del jugador.
- No hay limite a la cartidad de cartas en la mano, ni a la cartidad de cartas en juego, ni a la cantidad de cartas que pueden obtenerse (el mazo es infinito y genera cartas al azar con distribución uniforme).

### Cartas

| Carta       | Tipo        | Efecto                                           |
| :---------- | ----------: | :----------------------------------------------- |
| Sobrecarga  | Permanente  | Tirada de 1 jugador - 2                          |
| Velocidad   | Permanente  | Tirada de 1 jugador + 1                          |
| Aceleración | Permanente  | Tirada de todos + 1                              |
| Cancelación | Instantánea | Remueve una carta permanente activa              |
| Rehacer     | Mixta       | Mismo efecto que la última carta jugada          |
| Repetir     | Instantánea | Aplica nuevamente el efecto del último casillero |

- Sobrecarga: Carta permanente que reduce en 2 la tirada total de un jugador a elección.
  - Afecta la tirada total, no cada dado individual.
  - Si el resultado es negativo, retrocede.
  - El efecto es acumulativo.

- Velocidad: Carta permanente que incrementa en 1 la tirada total de un jugador a elección.
  - Afecta la tirada total, no cada dado individual.
  - El efecto es acumulativo.

- Aceleración: Carta permanente que incrementa en 1 la tirada total de todos los jugadores.
  - Afecta la tirada total, no cada dado individual.
  - El efecto es acumulativo.

- Cancelación: Carta Instantánea que remueve del juego una carta permanente activa.
  - La carta se elige, no es al azar.
  - No se puede jugar si no hay cartas permanentes en efecto.

- Rehacer: Carta que tiene el mismo efecto que la última carta que se jugó.
  - Si la última carta es instantánea, actúa como carta instantánea.
  - Si la última carta es permanente, actúa como carta permanente.
  - Si la carta indica que hay que elegir un jugador o carta, no tiene por que ser el mismo.

- Repetir: Carta Instantánea reaplica el efecto del último casillero sobre el que cayó un jugador luego de tirar los dados.
  - Si el casillero no tiene efecto, entonces esta carta no tiene efecto.
  - Si nadie tiro los dados, entonces esta carta no puede ser usada.

### Requisitos de aprobación para la versión 3

- [x] Todo lo indicado para las versiones 1 y 2.
- [x] Implementada carta Sobrecarga.
- [x] Implementada carta Velocidad.
- [x] Implementada carta Aceleración.
- [ ] Implementada carta Cancelación.
- [ ] Implementada carta Rehacer.
- [ ] Implementada carta Repetir.
