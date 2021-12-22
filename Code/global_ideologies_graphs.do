*****  Stata code to create the graphs visualizing the Global Leader Ideology dataset:
*****  Author: Bastian Herre
*****  December 17, 2021


version 14

clear all
set more off
set varabbrev off

* Set your working directory here:
cd "/Users/bastianherre/Dropbox/Data/Global Leader Ideologies"
global project "/Users/bastianherre/Dropbox/Data/Global Leader Ideologies"

clear all
set more off

use global_leader_ideologies.dta, clear


** Create spine plot of leader ideologies across regime types:

generate leader_ideology_num_new = leader_ideology_num_redux
recode leader_ideology_num_new (0=2) (1=0) (2=1)
label variable leader_ideology_num_new "Ideology of head of government"
label define leader_ideology_num_new 0 "leftist" 1 "centrist" 2 "rightist" 3 "missing"
label values leader_ideology_num_new leader_ideology_num_new

by democracy leader_ideology_num_new, sort: gen N=_N
spineplot democracy leader_ideology_num_new, text(N, mlabcolor(white)) legend(off) xlabel("", noticks) ylabel(0.325 "dictatorship" 0.825 "democracy", noticks axis(2)) ytitle("") xtitle("") bar1(color(orange)) bar2(color(midblue))
drop N
graph export "Graphs/ideology_tiles.png", replace


** Create map of leader ideologies, 1945-2020:

preserve

* Summarize ideology per country:
collapse (sum) leader_left leader_center leader_right leader_noideo leader_noinfo, by(country_name)
generate total=leader_left+leader_center+leader_right+leader_noideo+leader_noinfo
generate leader_left_share=leader_left/total*100
generate leader_right_share=leader_right/total*100
save map.dta, replace

* Load and format world map data:
shp2dta using "Supplement/ne_110m_admin_0_countries.shp", database(worldmap19.dta) coordinates(worldcoord19.dta) genid(id) replace
use worldmap19.dta, clear
rename ADMIN country_name
replace country_name="Burma/Myanmar" if country_name=="Myanmar"
replace country_name="Czech Republic" if country_name=="Czechia"
replace country_name="Serbia" if country_name=="Republic of Serbia"
replace country_name="Eswatini" if country_name=="eSwatini"
replace country_name="North Macedonia" if country_name=="Macedonia"
replace country_name="Tanzania" if country_name=="United Republic of Tanzania"
replace country_name="Timor-Leste" if country_name=="East Timor"

* Merge summarized ideology per country with world map data:
merge 1:1 country_name using map.dta

* Graph summarized left heads of governments per country:
spmap leader_left_share using worldcoord19.dta if _merge==3 & leader_left_share!=., id(id) fcolor(Oranges) ocolor(white ..) osize(thin ..) clmethod(custom) clbreaks(0 25 50 75 100) legend(symy(*2) symx(*2) size(*2)) legorder(lohi) title("% of years with leftist leader, 1945-2020" "")
graph save ideology_map_1.gph

* Graph summarized right heads of governments per country:
spmap leader_right_share using worldcoord19.dta if _merge==3 & leader_right_share!=., id(id) fcolor(Blues) ocolor(white ..) osize(thin ..) clmethod(custom) clbreaks(0 25 50 75 100) legend(symy(*2) symx(*2) size(*2)) legorder(lohi) title("% of years with rightist leader, 1945-2020" "")
graph save ideology_map_2.gph

* Combine graphs:
graph combine ideology_map_1.gph ideology_map_2.gph, cols(1) imargin(2 5 0) iscale(*0.75)
graph export "Graphs/ideology_map.png", width(4000) replace

erase map.dta
erase worldmap19.dta
erase worldcoord19.dta
erase ideology_map_1.gph
erase ideology_map_2.gph

restore


** Create line graphs of leader ideologies in different regimes, 1945-2020:

* Summarize ideology per year across regimes:
preserve
collapse (sum) leader_left leader_center leader_right leader_noideo leader_noinfo, by(year)
generate total=leader_left+leader_center+leader_right+leader_noideo+leader_noinfo
generate leader_left_share=leader_left/total*100
generate leader_center_share=leader_center/total*100
generate leader_right_share=leader_right/total*100
generate leader_no_share=(leader_noideo+leader_noinfo)/total*100
line leader_left_share leader_center_share leader_right_share leader_no_share year, legend(label(1 "leftist") label(2 "centrist") label(3 "rightist") label(4 "no ideology or no information") rows(1) pos(12) bmargin(zero)) xtitle("") xlabel(1950(10)2020) title("% of all regimes", size(medium)) lcolor(orange green midblue black) fysize(37) bgcolor(none)
graph save ideology_time.gph, replace
restore

* Summarize ideology per year across democracies:
preserve
keep if democracy==1
collapse (sum) leader_left leader_center leader_right leader_noideo leader_noinfo, by(year)
generate total=leader_left+leader_center+leader_right+leader_noideo+leader_noinfo
generate leader_left_share=leader_left/total*100
generate leader_center_share=leader_center/total*100
generate leader_right_share=leader_right/total*100
generate leader_no_share=(leader_noideo+leader_noinfo)/total*100
line leader_left_share leader_center_share leader_right_share leader_no_share year, legend(off) xtitle("") xlabel(1950(10)2020) ylabel(0(20)60) title("% of democracies", size(medium)) lcolor(orange green midblue black) fysize(31.5) bgcolor(none)
graph save ideology_time_dem.gph, replace

restore

* Summarize ideology per year across dictatorships:
preserve
keep if democracy==0
collapse (sum) leader_left leader_center leader_right leader_noideo leader_noinfo, by(year)
generate total=leader_left+leader_center+leader_right+leader_noideo+leader_noinfo
generate leader_left_share=leader_left/total*100
generate leader_center_share=leader_center/total*100
generate leader_right_share=leader_right/total*100
generate leader_no_share=(leader_noideo+leader_noinfo)/total*100
line leader_left_share leader_center_share leader_right_share leader_no_share year, legend(off) xtitle("") xlabel(1950(10)2020) title("% of dictatorships", size(medium)) lcolor(orange green midblue black) fysize(31.5) bgcolor(none)
graph save ideology_time_aut.gph, replace
restore

* Combine graphs of ideology over time and regimes:
graph combine ideology_time.gph ideology_time_dem.gph ideology_time_aut.gph, cols(1) imargin(2 2 2 0)
graph export "Graphs/ideology_time.png", width(4000) replace

erase ideology_time.gph
erase ideology_time_dem.gph
erase ideology_time_aut.gph


** Export regional dataset files for creating panelview graphs in R:
preserve
keep if region == "Asia and Pacific"
save leader_ideologies_ap.dta, replace
restore

preserve
keep if region == "Eastern Europe and Central Asia"
save leader_ideologies_eeca.dta, replace
restore

preserve
keep if region == "Latin America and Caribbean"
save leader_ideologies_lac.dta, replace
restore

preserve
keep if region == "Middle East and North Africa"
save leader_ideologies_mena.dta, replace
restore

preserve
keep if region == "Sub-Saharan Africa"
save leader_ideologies_ssa.dta, replace
restore

preserve
keep if region == "Western Europe and North America"
save leader_ideologies_wena.dta, replace
restore


exit
