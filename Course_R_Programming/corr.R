setwd("C:/Users/kush/Downloads/Coursera_Downloads/DataScience_Specialization/datasciencecoursera/datasciencecoursera/Course_R_Programming")
source("C:/Users/kush/Downloads/Coursera_Downloads/DataScience_Specialization/datasciencecoursera/datasciencecoursera/Course_R_Programming/Week_2/complete.R")
corr <- function(directory, threshold = 0){
        complete_data <- complete(directory)
        manip_data <- complete_data[which(complete_data$nobs>threshold),]
        
        ret_val <- c();

        for( ids in manip_data$id){
                file_to_process<-paste(directory, "/", sprintf("%03d",ids), ".csv", sep="")
                data <- read.csv(file_to_process)
                
                df<-cbind(data$sulfate, data$nitrate)
                df<-df[complete.cases(df),]
                correlation <- cor(df)
                ret_val<-c(ret_val, correlation[1,2])
        }
        
        ret_val
}
