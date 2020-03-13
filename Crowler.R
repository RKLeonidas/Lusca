#Aula de Crowler
#Instalar o pacote rvest
install.packages("rvest")
#instalar o pacote xml2
install.packages("xml2")
library(rvest)
library(xml2)
#Colocar o site em um objeto
lego_movie <- read_html("http://www.imdb.com/title/tt1490017/")
#Html nodes é pra vc dizer o nó que vc quer chegar, no nosso caso queremos ir pro nó strong e depois o nó spam
html_nodes(lego_movie, "strong span")
#Estamos colocando a nota do filme em um objeto chamado rating
#O Html_text vai pegar a informação e colocar em texto, o texto no código html sempre fica entre ><
rating<-lego_movie %>% 
  html_nodes("strong span") %>% 
  html_text() %>% 
  as.numeric()

#Colocar o titulo em um objeto chamado Title
title<-lego_movie %>% 
  html_nodes("h1") %>% 
  html_text()
#Criar uma base de dados no R usa o comando data.frame
data.frame(title,rating)
data.frame(Filmes=title,Nota_no_IMDB=rating)

###########Criando a função para adicionar vários filmes##############
crawler_imdb<-function(imdb_url){
  lego_movie<-read_html(imdb_url)
  
  rating<-lego_movie %>% 
    html_nodes("strong span") %>% 
    html_text() %>% 
    as.numeric()
  
  title<-lego_movie %>% 
    html_nodes("h1") %>% 
    html_text()
  data.frame(Filmes=title,Nota_no_IMDB=rating)
}
##Usando a função R  pra botar tudo em uma tabela só
#Primeiro coloca as funções em um objeto
Filme1<-crawler_imdb ("https://www.imdb.com/title/tt0068646/")
Filme2<-crawler_imdb("https://www.imdb.com/title/tt0133093/?ref_=nv_sr_srsg_2")
Filme3<-crawler_imdb("https://www.imdb.com/title/tt6751668/")
#Depois usa a função Rbind q vai colar tudo
rbind(Filme1,Filme2,Filme3)

##Comando concatentar(C) colocar todos em um único objeto
Filmes<-c("x")
Filmes<-c("https://www.imdb.com/title/tt6751668/","https://www.imdb.com/title/tt3794354/","https://www.imdb.com/title/tt7456312/")
data.frame(rating,title)
##Usando o comando For, que é uma estrutura que usa pra fazer repetição
#i é apenas a incognita, o 1:2, sendo respectivamente o inicio e o final 
#Só pode ligar em uma tabela já existente então crie a primeira tabela
#Colocando a função(que já ta em um objeto) em um objeto
tabela<-Parasite
#For
for (i in 1:length(Filmes)) {
  tabela<-tabela %>%
    rbind(crawler_imdb(Filmes[i]))
  
#Colocando em uma tabela em branco
NewTabel<-data.frame()
for (i in 1:length(Filmes)) {
  NewTabel<-NewTabel %>%  
    rbind(crawler_imdb(Filmes[i]))
  }
#Apaguei os objetos pq eu tava confuso, fiz tanta coisa que confundi,chegar em casa organizar esse documento 

