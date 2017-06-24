library(startingDataScience)
library(data.table)

qc <- fread("qclistrpt26.04.17.csv")
head(qc)
str(qc)
View(qc)

qc <- select(qc, 8:12)
head(qc)
colnames(qc) <- c("Assay", "QC", "Unit", "Target", "SD")

summary(qc)
class(qc)

dt.qc_gaz <- select(qc, 1:3)
head(dt.qc_gaz)
View(dt.qc_gaz)
write.csv(dt.qc_gaz, "QC_by_assay.csv")

dt.qc_by_material <- arrange(dt.qc_gaz, QC)
head(dt.qc_by_material, n=20)
dt.qc_by_material <- select(dt.qc_by_material, 2, 1, 3)

str(dt.qc_by_material)
glimpse(dt.qc_by_material)

summary(dt.qc_by_material)
write.csv(dt.qc_by_material, "QC_by_material.csv")






