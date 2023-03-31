# make plant function
plant = function(plant_type){
  
  # check type
  if(!(plant_type %in% c("strawberry", "carrot", "apple"))){
    stop("I only know how to plant 'strawberry', 'carrot', or 'apple'!")
    }
  
  # set plantables, art taken from https://textart.sh
  strawberry = "

                          ████  ████                                      
                        ██░░░░██░░░░████████                              
                        ██░░░░░░░░██▒▒▒▒▒▒  ██                            
                          ██░░░░██▒▒▒▒  ▒▒▒▒▒▒██                          
                        ██░░░░░░░░██▒▒▒▒▒▒▒▒▒▒▒▒██                        
                      ██░░░░██░░░░██▒▒▒▒▒▒▒▒▒▒▒▒██                        
                        ████▒▒████▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒██                      
                        ██  ▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒  ██                      
                        ██▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                      
                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒██                      
                          ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                      
                            ██  ▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒██                        
                              ████▒▒▒▒▒▒▒▒  ▒▒██                          
                                  ████████████                            
"
  
  carrot = "
                                                    ██████                              
                                                  ██▒▒▒▒████                            
                                            ████  ██▒▒██▒▒██                            
                                          ██░░░░██▒▒██▒▒▒▒██                            
                                        ██░░██░░░░██▒▒████                              
                                      ██░░░░░░██░░░░██                                  
                                    ██░░░░░░░░░░░░░░░░██                                
                                  ██░░░░░░░░░░░░░░░░░░██                                
                                  ██░░░░██░░░░░░░░░░██                                  
                                ██░░░░░░░░██░░░░░░██                                    
                                ██░░░░██░░░░██░░██                                      
                              ██░░░░░░░░██░░████                                        
                              ██░░░░░░░░████                                            
                                ████████                                                
  "
  
  apple = "
                                          ▓▓██████████              
                                      ▓▓░░░░░░▒▒▓▓██              
                                ██  ██░░▒▒▒▒▒▒▓▓██                
                                  ████▓▓▒▒▓▓▓▓██                  
                                  ██  ████████                    
                                  ██                              
                        ██████    ██    ██████                    
                      ██▒▒▒▒▒▒██████████▓▓▓▓▓▓██                  
                    ▓▓▒▒▒▒▒▒▒▒▓▓▓▓▒▒▓▓▒▒▒▒▓▓▓▓▓▓██                
                  ██▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓▓██              
                ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██            
                ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓██            
              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒██          
              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒██          
              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓██          
              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓          
              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓          
              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██          
                ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒██            
                ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓██            
                  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓██              
                    ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓██                
                      ██▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒▓▓▒▒██                  
                        ██▒▒▓▓▒▒██████▒▒▓▓▒▒██                    
                          ██████  ██  ██████                      
  "
  
  # get argument
  growing = switch (plant_type,
          strawberry = growing <- strawberry,
          carrot = growing <- carrot,
          apple = growing <- apple
          
  )
  
  # break into lines
  grow_split = strsplit(growing, split = "\\n")[[1]]
  
  # animate the growing
  for(i in 1:length(grow_split)){
    
    cat(grow_split[i], "\n")
    Sys.sleep(.5)
    
  }
  
  # finish message
  cat("\n", "Ready to Harvest!")
  
  # design field
  # stolen from: https://stackoverflow.com/questions/50816295/randomly-fill-columns-of-a-matrix-using-a-vector-in-r
  field <- do.call("cbind", lapply(1:5, function(x) sample(c(1, rep(0, 9)), 10)))
  
  # set class
  class(field) = plant_type
  
  # return
  return(field)
  
}

# set print types
print.strawberry = function(x){cat("\nYou need to harvest me!")}
print.apple = function(x){cat("\nYou need to harvest me!")}
print.carrot = function(x){cat("\nYou need to harvest me!")}












