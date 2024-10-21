
library(nortest)
library(qcc)
vino<-read.csv(file.choose()) #Cargar archivo llamado:"Datos Cusum.csv"
attach(vino)
variable_ph<-vino$pH

# Calcular la media y desviación estándar del pH
media_ph <- mean(variable_ph)
desv_ph <- sd(variable_ph)

# Estandarización de los datos
estandar <- (variable_ph - media_ph) / desv_ph

# Transformación para el CUSUM de variabilidad
v <- (sqrt(abs(estandar)) - 0.822) / 0.349

# Aplicar la carta CUSUM para la variabilidad
c_var <- cusum(v, center = 0, std.dev = 1, decision.interval = 5, 
               se.shift = 1, title = "Cusum de variabilidad para pH de vino con uvas rojas")