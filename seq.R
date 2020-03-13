#Testando Crowler com o Top100
library(rvest)
library(xml2)
top_rated<-read_html("https://www.imdb.com/chart/top/?ref_=nv_mv_250")
html_nodes(top_rated,"tr a")
Titulo<-top_rated %>% 
  html_nodes("tr a") %>% 
  html_text()
titulo.frame<-data.frame(Titulo)
titulo.f


linhas_impar <- seq(2, nrow(titulo.frame), 2)

Movies<-titulo.frame[-linhas_impar, ]
data.frame(Movies)

rate<-read_html("https://www.imdb.com/chart/top/?ref_=nv_mv_250")

Notas<-rate %>% 
  html_nodes("tr strong") %>% 
  html_text() %>% 
  as.numeric()
Filmes_Mais_Bem_Avaliados_IMDB<-data.frame(Movies,Notas)

#alo