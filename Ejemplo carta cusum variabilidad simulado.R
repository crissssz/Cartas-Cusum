# Cargar librería
library(qcc)

# Fijar semilla para la reproducibilidad
set.seed(123)

# Simular datos
# Primeros 30 datos con desviación estándar de 2 ohmios
resistencias_1 <- rnorm(30, mean = 100, sd = 2)

# Últimos 20 datos con desviación estándar de 4 ohmios
resistencias_2 <- rnorm(20, mean = 100, sd = 4)

# Combinar las dos series
resistencias_totales <- c(resistencias_1, resistencias_2)

resistencia_estandarizada<-(resistencias_totales-(mean(resistencias_totales)))/sd(resistencias_totales)

resistencia_varia<-(abs(resistencia_estandarizada)-0.822)/0.349
# Crear grupos de tamaño 1 para análisis de variabilidad
grupo_resistencias <- matrix(resistencia_varia, ncol = 1)

# Generar la carta de control CUSUM de variabilidad (monitorizando la desviación estándar)
# Supongamos que el valor de referencia de la desviación estándar es 2 ohmios
cusum_variabilidad <- cusum(grupo_resistencias,
                            sizes = 1, target = 100,
                            std.dev = 2, decision.interval = 5,
                            se.shift = 1,title="CUSUM de Variabilidad para la Producción de Resistencias")

# Mostrar el gráfico CUSUM de variabilidad
plot(cusum_variabilidad,title="CUSUM de Variabilidad para la Producción de Resistencias")