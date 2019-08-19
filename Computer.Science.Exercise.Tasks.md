**Задача 1.** (*ЛАБИРИНТ*) Дадена е правоъгълна символна матрица <img src="https://latex.codecogs.com/svg.latex?\Large&space;A"> с размери <img src="https://latex.codecogs.com/svg.latex?\Large&space;N">x<img src="https://latex.codecogs.com/svg.latex?\Large&space;M">, която представлява „лабиринт“. Лабиринта се състои единствено от символите <img src="https://latex.codecogs.com/svg.latex?\Large&space;*">,$ и празната клетка.
- <img src="https://latex.codecogs.com/svg.latex?\Large&space;*"> е лава, през която не може да се преминава и върху която не може да се стъпва;
- $ е съкровище;
- празната клетка е проходим път.
В лабиринта можем да се движим само на север, на изток, на юг и на запад (забранено е диагонално движение като например североизток). Да се напише функция, която:

а) проверява дали от дадена стартова позиция в лабиринта с координати <img src="https://latex.codecogs.com/svg.latex?\Large&space;(x,y)">, може да се достигне до съкровище;

б) намира броя на всички съкровища, до които може да се достигне от дадена позиция с координати <img src="https://latex.codecogs.com/svg.latex?\Large&space;(x,y)">.
 
Пример: На фигурата по-долу съществува път до съкровище от позиция с координати **(4,1)**, но не и от позиция с координати **(0,0)**. Също така, броя на съкровищата, до които може да се достигне от позиция с координати **(4,1)** е **3**, а от позиция с координати **(2,0)** е **1**.

<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">|$|<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">|<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">| |
---- | ---- | ---- | ---- | ---- |
<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">| |**$**| | |
**$**|<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">|<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">|<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">| |
<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">| | | | |
| | |<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">|<img src="https://latex.codecogs.com/svg.latex?\Large&space;*">|**$**|
