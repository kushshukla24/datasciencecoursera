setwd("C:/Users/kush/Downloads/Coursera_Downloads/DataScience_Specialization/datasciencecoursera/datasciencecoursera/Course_R_Programming")
complete<-function(directory, id = 1:332){
        file_to_process<-paste(directory, "/", sprintf("%03d",id[[1]]), ".csv", sep="")
        data <- read.csv(file_to_process)
        
        complete_data<-data[complete.cases(data),]
        complete_df<-data.frame(id=id[[1]],nobs=nrow(complete_data))
        
        for(ids in id[2:length(id)]){
                if(is.na(ids)){
                        break
                }
                file_to_process<-paste(directory, "/", sprintf("%03d",ids), ".csv", sep="")
                data <- read.csv(file_to_process)
                complete_data<-data[complete.cases(data),]
                df<-data.frame(id=ids, nobs = nrow(complete_data))
                complete_df<-rbind(complete_df, df)
        }
        
        complete_df
}
