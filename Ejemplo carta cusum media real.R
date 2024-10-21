library(nortest)
library(qcc)
vino<-read.csv(file.choose()) #Cargar archivo llamado:"Datos Cusum.csv"
attach(vino)
variable_ph<-vino$pH

prueba_ad<-ad.test(variable_ph)
cat("Al aplicar el test de Anderson Darling entrega un valor p igual a",
    prueba_ad$p.value,
    "\n por lo que los datos siguen una distribucion normal")


cusum_media<-cusum(variable_ph, decision.interval = 5,
                   se.shift = 1,
                   title="CUSUM para pH de vino con uvas rojas")
# Mostrar el gráfico CUSUM de variabilidad
plot(cusum_media,title="CUSUM para pH de vino con uvas rojas")