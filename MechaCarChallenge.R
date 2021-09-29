library(dplyr)

# linear regression to predict mpg

mechacar_table <- read.csv('MechaCar_mpg.csv', check.names=F, stringsAsFactors=F)

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle
   + ground_clearance + AWD,data=mechacar_table))

# trip analysis

suspension_table <- read.csv('Suspension_Coil.csv', check.names=F, stringsAsFactors=F)

total_summary <- suspension_table %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

lot_summary <- suspension_table %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups='keep')

# t-tests on suspension coils

t.test(suspension_table$PSI, mu=1500)

t.test(subset(suspension_table$PSI,suspension_table$Manufacturing_Lot=='Lot1'), mu=1500)

t.test(subset(suspension_table$PSI,suspension_table$Manufacturing_Lot=='Lot2'), mu=1500)

t.test(subset(suspension_table$PSI,suspension_table$Manufacturing_Lot=='Lot3'), mu=1500)