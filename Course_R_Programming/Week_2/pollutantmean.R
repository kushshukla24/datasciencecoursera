setwd("C:/Users/kush/Downloads/Coursera_Downloads/DataScience_Specialization/datasciencecoursera/datasciencecoursera/Course_R_Programming")
pollutantmean<-function(directory, pollutant, id = 1:332){
        file_to_process<-paste(directory, "/", sprintf("%03d",id[[1]]), ".csv", sep="")
        data <- read.csv(file_to_process)
        
        for(ids in id[2:length(id)]){
                if(is.na(ids)){
                        break
                }
                file_to_process<-paste(directory, "/", sprintf("%03d",ids), ".csv", sep="")
                data<-rbind(data, read.csv(file_to_process))
        }
        mean(data[[pollutant]],na.rm=TRUE)
}
