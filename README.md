# DDRT projektas

# Apie projektą
Projekto tikslas yra automatizuoti paskolų išdavimo sprendimo pagrindimo procesą, nustatant rizikingus klientus, kuriems neturėtų būti suteiktos paskolos.

Proejkto metu sukurtas modelis, kuris išmokinamas prognozuoti klientų kreditingumą naudojant jau turimus duomenis. 

# Duomenys naudoti modeliui apmokyti
Duomenų rinkinys, kuris buvo naudotas apmokyti modelį turėjo 1 milijoną stebinių. Pateikiama informacija apie vartotojo turimą kreditą, kredito įmokas, kredito terminą (ilgalaikis/trumpalaikis), kreditingumą, paskolos paskirtį, metines pajamas, bankrotų skaičų, darbo stažą, kreditingumo istoriją, tesitumo istoriją, turimų sąskaitų kiekį, kredito problemas, kredito balansą, bei kredito limitą. Duomenų aprašymas pateiktas žemiau.

![image](https://user-images.githubusercontent.com/119167556/208523007-d409a597-bb06-4da5-808d-e17f84492682.png)

![image](https://user-images.githubusercontent.com/119167556/208523077-b5941d96-b00f-4e46-97bd-4535c69fbec0.png)

Kaip galima matyti, duomenų, ant kurių mokėsi modelis, turi duomenis apie gan įvairius vartotojus. Kaip galima matyti, metinės pajamos svyravo nuo 76 tūkstančių iki 165 milijonų. 

Paskolos paskirtis taip pat skrėsi, įtraukiant paskolas verslui, namams, mašinai, medicininėms išlaidos, skolos restruktūrizacijai, bei kitoms priežastims. Įdomu, kad daugiausia stebėgų atvejų žmonės norėjo imti paskolą skolos restruktūrizacijai. Mažiausia dalis - atsinaujinančiai energijai. Visos paskolų paskirtys ir jų dažumas matomas žemiau: 

![image](https://user-images.githubusercontent.com/119167556/208526752-b0f67d52-2501-49e1-bc89-9e6f07ec2cee.png)

Daugumos stebinių kreditingumas buvo geras, tačiau daugiau nei trečdaliui stebinių kreditingumo reikšmių trūko. Daugiau informacijoas pateikta žemiau:
![image](https://user-images.githubusercontent.com/119167556/208527749-c9be20f0-cb7b-4dfe-93d5-51f3f6e28e19.png)

Dėl gan didelio trūkstamų reikšmių kiekio buvo nuspręsta jas palikti ir su jomis tvarkytis pagal bazinius h2o nustatymus.

# Apie modelį
Modelis mokytas naudojant GBM metodą, nes šis metodas pasirodė tiksliausias iš visų bandytų metodų. 

Svarbūs naudoti parametrai:
max_depth = c(20)
sample_rate = c(0.8, 1.0)
ntrees = 100
seed = 1

# Priklausomybės
* R kernel
* R paketai:
  - install.packages("h2o")
  - install.packages("shiny")
  - install.packages("tidyverse")

# Projekto struktūra
    ├───1-data
    ├───2-report
    ├───3-R
    ├───4-model
    ├───5-predictions
    └───app

# Rezultatai
Geriausiai pasirodė gbm modelis pasiekęs AUC = 0.8147 ištestuotas ant bandomųjų duomenų rinkinio.

Modelio tikslumo iliustracija matoma žemiau:

![image](https://user-images.githubusercontent.com/119167556/208521097-b4ad568d-9dc6-4b41-b43f-d2254da3cece.png)

# Aplikacija
Projekto metu taip pat sukūrėme aplikaciją, kuri leidžia turint klilentų duomenis greitu ir lengvu būdu patikrtinti kaip tikėtina ar lientams bus išduota paskola ar ne.

Aplikacija pirma prašo įkelti turimus duomenis:

![image](https://user-images.githubusercontent.com/119167556/208529356-ad6794ad-f56d-49de-af4f-3f7f133b0778.png)

Įkėlus duomenis aplikacija pateikia prognozę ar klientas galės grąžinti paskolą ir susitvarkyti su įsipareigojimais (programėlė rašo "gera paskola"), ar vis dėl to tikėtina, kad finansiniai įsipareigojimai klientui bus per dideli ir jis paskolos grąžinti nesugebės (programėlė rašo "bloga paskola"). Pavyzdys pateikiamas žemiau:

![image](https://user-images.githubusercontent.com/119167556/208529976-de1deae7-b900-4b32-87c4-2376d4e21c7e.png)

