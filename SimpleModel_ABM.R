#Simple Model-TiAnna Olivas

#herbivores present
K = 500                   #carrying capacity
maxsize    = 10           #maximum herbivore size, min is 1
maxsearch  = 10           #max number of actions an individual can take, summed across searching actions
searchnum  = 7

#food resources
lowsuccess.V  = c(0.9, 1 )         #how likely an individual is in finding low quality food 
highsuccess.V = c(0.1, 0.2)        #how likely an individual is in finding high quality food

runvars = Replicates(lowsuccess.V, highsuccess.V)

#summarizing and output
nreps   = 150
towrite = c("r","rep","K","maxsize","mazsearch","searchnum","lowsuccess","highsuccess",
            "meansize","meansearch","meanfood","size_food_slope", "size_food_R2")                 #list of headers for everything that you will include
write.table(t(towrite), paste(outdir,"outputsummary.csv", sep=""), append=F, sep=",", row.names=F, col.names=F)

#run model iterating over parameters in Replicates
for(r in 1:nrow(runvars)){
  #set parameter values
  lowsuccess = runvars$lowsuccess[r]
  highsuccess = runvars$highsuccess[r]
  
  for(reps in 1:nreps){
    #initialize population of herbivores
    herbs = data.frame(id = seq(1,K,1), size = rep(seq(1,maxsize,1),(K/maxsize)))
    herbs$search = herbs$size + rnorm(K,0,1)
    
    #poor fix for a complicated problem - too small/large search times
    herbs$search[herbs$search < 0]  = 0
    herbs$search[herbs$search > 10] = 10
    
    #set up column to store food outcome
    herbs$food = rep(NA, nrow(herbs))
    
    #iterate over individuals in herbs
    for(i in 1:nrow(herbs)){
      #search for food (relationship between time searching and finding food, larger value is higher quality food)
      searchresults = rnorm(searchnum, mean=(herbs$search[i]/10), sd=1/10)
      searchresults[searchresults < 0] = 0
      
      #success or not in each search (uniform decrease from lowest food qual to highest food quality)
      searchsuccess = NULL
      for(rr in 1:searchnum){
        temp = rbinom(1, 1, prob = (1-(lowsuccess-highsuccess)*searchresults[rr]))
        searchsuccess = c(searchsuccess, temp)
      }
      
      #record food collected 
      foodobtained = searchsuccess * searchresults
      foodobtained = sum(foodobtained)
      herbs$food[i] = foodobtained
    }
    
    #determine size and food relationship
    lm.out = lm(food~size, data=herbs)
    size_food_slope = summary(lm.out)$coeff[2,1]
    size_food_R2 = summary(lm.out)$r.squared
    
    #calculated some summaries
    meansize   = mean(herbs$size, na.rm=T)
    meansearch = mean(herbs$search, na.rm=T)
    meanfood   = mean(herbs$food, na.rm=T)
    
    #record data to file
    towrite = c(r,reps,K,maxsize,maxsearch,searchnum,lowsuccess,highsuccess,
                meansize,meansearch,meanfood,size_food_slope, size_food_R2)
    
    #write data, append = F
    write.table(t(towrite), paste(outdir,"outputsummary.csv", sep=""), append=T, sep=",", row.names=F, col.names=F)
    
  }
}

#create a folder with date and time so it is unique to new folder names
folder = gsub(" ", "", paste("../Output/output_", Sys.time(), ""), fixed = TRUE)
dir.create(folder)

#copy output into folder to use later
data = read.table("../Output/outputsummary.csv", header=T, sep=",")
write.table(data, paste("../Output/", folder, "/outputsummary.csv", sep=""), row.names=F, col.names=T, sep=",")  

#tianna is stinky

#end