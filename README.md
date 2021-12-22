# The Global Leader Ideology dataset

To get an overview of the data, read the brief variable descriptions below.
To explore the data, use `global_leader_ideologies.dta` for Stata and `global_leader_ideologies.csv` otherwise.
To learn more about the coding, take a look at my working paper `Identifying_Ideologues` and `Identifying_Ideologues_Supplementary_Materials`.
To see the data visualized, check out the graphs and supplement.
To replicate the graphs or refine them, take a look at my code.
To learn more about a specific country or leader, check out the country profiles.

When using the data, please cite the working paper:
Herre, Bastian. 2021. Identifying Ideologues: A Global Dataset on Political Leaders, 1945-2020. Working Paper.

I thank Sophia Barkoff, Aaron Casella, Austin Christhilf, Amisha Kapur, Russell Legate-Yang, Julia Lodoen, Lysimachos Mavridis, Mariana Paez, Ivanna Shevel, Alexander Shura, Benjamin Silvian, Wen Li Teng, Sean Uribe, Joshua Zakharov, and Hsin Min Zee for their outstanding research assistance.



## General identifiers

`country_name`: name of the country.

`country_code_cow`: numeric code of the country; taken from the Correlates of War project.

`year`: year during which information is coded for December 31.


## Variables on heads of government

`hog`: name of the head of government; own coding mostly taken from Varieties of Democracy project (Coppedge et al. 2021), with supplementary information from Cahoon (2021), Schemmel (2021), and Lentz (1994).

`hog_ideology`: economic ideology of the head of government; we primarily distinguish between “leftist”, “centrist”, and “rightist” heads of government; leftist heads of government are those that believe that the state should intervene into the economy to increase social equality, while rightist heads of government believe that the state should rarely intervene into the economy to increase the freedoms of their citizens; centrist heads of government hold middling beliefs on these questions; “no information” means that we were unable to identify the head of governments’ ideology; “none” means that our sources stated that the head of government had no economic ideology; “not applicable” means that we do not code a head of government for that country or year; own coding based on many sources, especially Armingeon et al. (2019), Brambor et al. (2017, version 1.6), Cahoon (2021), the Database of Political Institutions (Cruz et al. 2021), the Global Party Survey (Norris 2020), Huber and Stephens (2012), Lansford (2019), Manzano (2017), the Perspective Monde project (2021), Schemmel (2021), and V-Party (Lührmann et al. 2020); for more details, read my working paper or the country profiles.

`hog_ideology_num`: numeric and reduced version of the head of government’s ideology; 0 = rightist, 1 = leftist, 2 = centrist, 3 = missing ideology; “missing ideology” combines heads of government with “no information” or “no(ne)” economic ideology.

`hog_right`: 1 = head of government is rightist; 0 = otherwise.

`hog_left`: 1 = head of government is leftist; 0 = otherwise.

`hog_center`: 1 = head of government is centrist; 0 = otherwise.

`hog_noideo`: 1 = head of government is non-ideological; 0 = otherwise.

`hog_noinfo`: 1 = no information on head of government’s ideology; 0 = otherwise.

`hog_ideomiss`: 1 = head of government is non-ideological or no information on their ideology; 0 = otherwise.

`hog_party`: name of head of government’s party; own coding based on numerous sources, especially Mattes et al. (2016), Cahoon (2021), and Schemmel (2021); “none” if head of government is not affiliated with any party; specific names almost all taken from PartyFacts (Döring and Regel 2019).

`hog_party_abbr`: name of head of government’s party, abbreviated; taken from PartyFacts (Döring and Regel 2019).

`hog_party_eng`: name of head of government’s party, in English; taken from PartyFacts (Döring and Regel 2019).

`hog_party_id`: identifying number of head of government’s party; taken from PartyFacts (Döring and Regel 2019).

`hog_title`: head of government’s title; own coding most of the time taken from Varieties of Democracy project (Coppedge et al. 2021), with supplementary information from Cahoon (2021) and Schemmel (2021).


## Variables on leaders

`leader`: name of the leader; taken from Goemans et al. (2009, version 4.1) for years 1945 to 2015, and from Bell et al. (2021) for years 2016-2020.

`leader_ideology`: economic ideology of the leader; I primarily distinguish between “leftist”, “centrist”, and “rightist” leaders; leftist leaders are those that believe that the state should intervene into the economy to increase social equality, while rightist leaders believe that the state should rarely intervene into the economy to increase the freedoms of their citizens; centrist leaders hold middling beliefs on these questions; “no information” means that we were unable to identify the leader’s ideology; “none” means that our sources stated that the leader had no economic ideology; “not applicable” means that we do not code a leader for that country or year; own coding based on many sources, especially Armingeon et al. (2019), Brambor et al. (2017, version 1.6), Cahoon (2021), the Database of Political Institutions (Cruz et al. 2021), the Global Party Survey (Norris 2020), Huber and Stephens (2012), Manzano (2017), the Perspective Monde project (2021), Schemmel (2021), and V-Party (Lührmann et al. 2020); for more details, read my working paper or the country profiles.

`leader_ideology_num`: numeric and reduced version of the leader’s ideology; 0 = rightist, 1 = leftist, 2 = centrist, 3 = missing ideology; “missing ideology” combines leaders with “no information” or “no(ne)” economic ideology.

`leader_right`: 1 = leader is rightist; 0 = otherwise.

`leader_left`: 1 = leader is leftist; 0 = otherwise.

`leader_center`: 1 = leader is centrist; 0 = otherwise.

`leader_noideo`: 1 = leader is non-ideological; 0 = otherwise.

`leader_noinfo`: 1 = no information on leader’s ideology; 0 = otherwise.

`leader_ideomiss`: 1 = leader is non-ideological or no information on their ideology; 0 = otherwise.

`leader_party`: name of leader’s party; own coding based on numerous sources, especially Mattes et al. (2016), Cahoon (2021), and Schemmel (2021); “none” if leader is not affiliated with any party; specific names almost all taken from PartyFacts (Döring and Regel 2019).

`leader_party_abbr`: name of leader’s party, abbreviated; taken from PartyFacts (Döring and Regel 2019).

`leader_party_eng`: name of leader’s party, in English; taken from PartyFacts (Döring and Regel 2019).

`leader_party_id`: identifying number of leader’s party; taken from PartyFacts (Döring and Regel 2019).

`leader_position`: leader’s title; taken from Mattes et al. (2016, version 5.0).


## Supplementary variables

`match_hog_leader`: “yes” if head of government matches leader, “no” if not, “n/a” if either head of government or leader not coded for that country-year.

`match_hog_hog_bls`: “yes” if head of government matches head of government in Brambor et al. (2017, version 1.6), “no” if not, “n/a” if either or both heads of government not coded for that country-year.

`match_leader_hog_bls`: “yes” if leader matches head of government in Brambor et al. (2017, version 1.6), “no” if not, “n/a” if either leader or head of government not coded for that country-year.

`match_hog_leader_m`: “yes” if head of government matches leader in Manzano (2017), “no” if not, “n/a” if either head of government or leader not coded for that country-year.

`match_leader_leader_m`: “yes” if leader matches leader in Manzano (2017), “no” if not, “n/a” if either or both leaders not coded for that country-year.

`match_hog_leader_chi`: “yes” if head of government matches leader in Mattes et al. (2016), “no” if not, “n/a” if either head of government or leader not coded for that country-year.

`match_leader_leader_chi`: “yes” if leader matches leader in Mattes et al. (2016), “no” if not, “n/a” if either or both leaders not coded for that country-year.

`hog_ideology_bls`: economic ideology of the head of government in Brambor et al. (2017, version 1.6); taken from Brambor et al. (2017, version 1.6).

`leader_ideology_m`: economic ideology of the head of government in Manzano (2017); taken from Manzano (2017).

`execrlc_dpi`: economic ideology of the chief executive; taken from the Database of Political Institutions (Cruz et al. 2021).

`hog_party_lr_ord_vdem`: economic ideology of the head of government’s party; own coding based on `hog_party` and `v2pariglef_ord` in Lührmann et al. (2020).

`region`: world region in which the country is located.


## References:
- Armingeon, Klaus, Virigina Wenger, Fiona Wiedemeier, Christian Isler, Laura Knöpfel, David Weisstanner and Sarah Engler. 2019. Supplement to the Comparative Political Data Set – Government Composition 1960-2017. Bern: Institute of Political Science, University of Berne.
- Bell, Curtis, Clayton Besaw, and Matthew Frank. 2021. The Rulers, Elections, and Irregular Governance (REIGN) Dataset. Broomfield, CO: One Earth Future.
- Brambor, Thomas, Lindvall, Johannes, and Annika Stjernquist. 2017. The Ideology of Heads of Government, 1870-2012. Department of Political Science, Lund University.
- Cahoon, Ben. 2021. World Statesmen. https://www.worldstatesmen.org (last checked December 14, 2021).
- Coppedge, Michael, John Gerring, Carl Knutsen, Staffan Lindberg, Jan Teorell, et al. 2021. V-Dem [Country–Year/Country–Date] Dataset v11.1. Varieties of Democracy (V-Dem) Project.
- Cruz, Cesi, Keefer, Philip, and Carlos Scartascini. 2021. The Database of Political Institutions 2020. Inter-American Development Bank.
- Döring, Holger, and Sven Regel. 2019. Party Facts: A database of political parties worldwide. Party Politics. 25(2): 97-109.
- Goemans, Henk, Kristian Gleditsch, and Giacomo Chiozza. 2009. Introducing Archigos: A dataset of political leaders. Journal of Peace Research 46(2): 269-283.
- Huber, Evelyne, and John Stephens. 2012. Latin America and the Caribbean Political Dataset, 1945-2012. University of North Carolina.
- Lansford, Tom (ed.). 2019. Political Handbook of the World 2018-2019. Thousand Oaks.
- Lentz, Harris. 1994. Heads of States and Governments. London.
- Lührmann, Anna, Nils Düpont, Masaaki Higashijima, Yaman Kavasoglu, Kyle Marquardt, et al. 2020. Varieties of Party Identity and Organization (V-Party) Dataset V1. Varieties of Democracy (V-Dem) Project.
- Manzano, Dulce. 2017. Bringing Down the Educational Wall: Political Regimes, Ideology, and the Expansion of Education. Cambridge.
- Mattes, Michaela, Brett Leeds, and Naoko Matsumura. 2016. Measuring change in source of leader support: The CHISOLS dataset. Journal of Peace Research 53(2): 259-267.
- Norris, Pippa. 2020. Measuring populism worldwide. Party Politics 26(6): 697-717.
- Perspective Monde. 2021. http://perspective.usherbrooke.ca (last checked December 14, 2021).
- Schemmel, B. 2021. Rulers. http://rulers.org/ (last checked December 14, 2021).