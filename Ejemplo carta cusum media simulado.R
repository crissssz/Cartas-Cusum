library(qcc)
# Simular datos de rendimiento de trigo
set.seed(123)
n_semanas <- 100            
media_estable <- 3          
desviacion <- 0.5           

rendimiento_estable <- rnorm(60, mean = media_estable, sd = desviacion)
media_disminuida <- 2.5      
rendimiento_bajo <- rnorm(40, mean = media_disminuida, sd = desviacion)

rendimiento_datos <- c(rendimiento_estable, rendimiento_bajo)

# Aplicar carta CUSUM
cusum_rendimiento <- cusum(rendimiento_datos,
                           center = media_estable,
                           std.dev = desviacion,
                           decision.interval = 5,
                           se.shift = 0.5,
                           title="CUSUM para el rendimiento de cosechas de trigo")
