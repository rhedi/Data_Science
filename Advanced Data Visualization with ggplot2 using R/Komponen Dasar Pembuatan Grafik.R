library(ggplot2)

#Memakai qplot
#qplot(x= carat, y = price, colour = clarity, data = diamonds)

#Memakai ggplot
#ggplot(data = diamonds, aes(x = carat, y = price, color = clarity)) + geom_point()

diamonds_c1 <- ggplot(data = diamonds, mapping = aes(x = carat, y = price, color = clarity)) + 
  geom_point()

summary(diamonds_c1)

diamonds_c2 <- ggplot(data = diamonds) + geom_point(mapping = aes(x = cara, y = price, color = clarity))

summary(diamonds_c2)

diamonds_c3 <- ggplot() + geom_point(data = diamonds,  mapping = aes(x = carat, y = price, color =  clarity))

summary(diamonds_c3)