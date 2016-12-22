//understanding ggplot2:
  
?mpg


library(ggplot2)

head(mpg)

str(mpg)

summary(mpg)

qplot(displ,hwy,colour = class,data = mpg)

qplot(displ, hwy, data = mpg) + facet_grid(. ~ cyl)

qplot(displ, hwy, data = mpg) + facet_grid(drv ~ cyl)

qplot(displ, hwy, data = mpg) + facet_wrap(~ class)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg)


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))


# Left
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Right
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class, stroke = 1),colour = "blue")


?geom_point

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

library(ggplot2)

?stat_bin

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, colour = cut))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut))


ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point() +
  geom_jitter()

?geom_jitter



