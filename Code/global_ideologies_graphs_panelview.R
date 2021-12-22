##### R code to create the panelview graphs visualizing the Global Leader Ideology dataset:
##### Author: Bastian Herre
##### December 17, 2021

library(readstata13)
library(panelView)
library(dplyr)
library(ggplot2)
library(gridExtra)

# Set your working directory here:
setwd("/Users/bastianherre/Dropbox/Data/Global Leader Ideologies")

ideology.ap<-read.dta13("leader_ideologies_ap.dta")
ideology.eeca<-read.dta13("leader_ideologies_eeca.dta")
ideology.lac<-read.dta13("leader_ideologies_lac.dta")
ideology.mena<-read.dta13("leader_ideologies_mena.dta")
ideology.ssa<-read.dta13("leader_ideologies_ssa.dta")
ideology.wena<-read.dta13("leader_ideologies_wena.dta")

ideology.ap <- panelView(D = "leader_ideology_num_full", data = ideology.ap, index = c("country_name","year"), xlab = "", ylab = "", legend.labs = c("rightist", "leftist", "centrist", "no information"), main = "Leader ideology", cex.main = 20, cex.axis = 16, cex.legend = 16, color = c("cornflowerblue","darkorange","darkolivegreen","grey"), axis.lab.gap = c(9,0), background = "white")
ggsave(ideology.ap, file="Graphs/ideology_ap.png")

ideology.eeca <- panelView(D = "leader_ideology_num_full", data = ideology.eeca, index = c("country_name","year"), xlab = "", ylab = "", legend.labs = c("rightist", "leftist", "centrist", "no information"), main = "Leader ideology", cex.main = 20, cex.axis = 16, cex.legend = 16, color = c("cornflowerblue","darkorange","darkolivegreen","grey"), axis.lab.gap = c(9,0), background = "white")
ggsave(ideology.eeca, file="Graphs/ideology_eeca.png")

ideology.lac <- panelView(D = "leader_ideology_num_full", data = ideology.lac, index = c("country_name","year"), xlab = "", ylab = "", legend.labs = c("rightist", "leftist", "centrist", "no ideology","no information"), main = "Leader ideology", cex.main = 20, cex.axis = 16, cex.legend = 16, color = c("cornflowerblue","darkorange","darkolivegreen","black","grey"), axis.lab.gap = c(9,0), background = "white")
ggsave(ideology.lac, file="Graphs/ideology_lac.png")

ideology.mena <- panelView(D = "leader_ideology_num_full", data = ideology.mena, index = c("country_name","year"), xlab = "", ylab = "", legend.labs = c("rightist", "leftist", "centrist", "no information"), main = "Leader ideology", cex.main = 20, cex.axis = 16, cex.legend = 16, color = c("cornflowerblue","darkorange","darkolivegreen","grey"), axis.lab.gap = c(9,0), background = "white")
ggsave(ideology.mena, file="Graphs/ideology_mena.png")

ideology.ssa <- panelView(D = "leader_ideology_num_full", data = ideology.ssa, index = c("country_name","year"), xlab = "", ylab = "", legend.labs = c("rightist", "leftist", "centrist", "no ideology","no information"), main = "Leader ideology", cex.main = 20, cex.axis = 12, cex.legend = 12, color = c("cornflowerblue","darkorange","darkolivegreen","black","grey"), axis.lab.gap = c(9,0), background = "white")
ggsave(ideology.ssa, file="Graphs/ideology_ssa.png")

ideology.wena <- panelView(D = "leader_ideology_num_full", data = ideology.wena, index = c("country_name","year"), xlab = "", ylab = "", legend.labs = c("rightist", "leftist", "centrist", "no information"), main = "Leader ideology", cex.main = 20, cex.axis = 16, cex.legend = 16, color = c("cornflowerblue","darkorange","darkolivegreen","grey"), axis.lab.gap = c(9,0), background = "white")
ggsave(ideology.wena, file="Graphs/ideology_wena.png")


unlink("leader_ideologies_ap.dta")
unlink("leader_ideologies_eeca.dta")
unlink("leader_ideologies_mena.dta")
unlink("leader_ideologies_lac.dta")
unlink("leader_ideologies_ssa.dta")
unlink("leader_ideologies_wena.dta")
