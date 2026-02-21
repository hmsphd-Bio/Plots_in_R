## Let's recreate a plot that was published in the study-> Abouelkhair AA, Seleem MN. 2024. Exploring novel microbial metabolites and drugs for inhibiting Clostridioides difficile. mSphere 9:e00273-24.
#https://doi.org/10.1128/msphere.00273-24,
# via Base R graphics.



# Curate the data (as per the newsletter-> https://shop.riffomonas.org/posts/building-data-visualization-intuition)
set.seed(19760620)
sim_data <- tibble(
  compound = 1:527,
  percent_inhibition = sample(c(rnorm(n=464,mean = 0,sd =30),
                                runif(63,91,100)))
)

sim_data

# Set plot margins
par(mar= c(2,6,3,2))

# create a fresh plot and specify the limits of x and y axes
plot.new()
plot.window(xlim = c(10,520),ylim =c(-100,100))

# configure axes 
axis(2,lwd= 3, font= 2)
axis(1,lwd = 2,xaxt = "n")

# Add two horizontal lines (one solid line at y = 0 and a dashed line at y ~ 88 )
abline(h = c(0,0), lwd = 3)
abline(h= c(0,88),lty= 14,lwd =2,)

# Add & customize points (Subset points that are to be coloured maroon from the rest of the dataset)
points(subset(sim_data,percent_inhibition > 88),col = "maroon",pch = 19,cex = 1.2)
points(subset(sim_data,percent_inhibition <= 88),col = "darkolivegreen",pch =19,cex = 1.2)

# Add the y-axis label
title(ylab = "Inhibition of Bacterial Growth (%)",
      font.lab = 2, cex.lab = 1.1) 

# Finally, Add plot label "A" at the top-left corner.
par(xpd = NA)
mtext("A",3,line= 0.8,font = 2,adj = -0.15,cex=1.5)
par(xpd =FALSE)
