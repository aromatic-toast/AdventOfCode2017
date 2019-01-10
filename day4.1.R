#need to look row by row and see if there are duplicate "words" in the row
#subset each each row first
#compare element 1 to all its neighbors downstream. 
#loop, then start at cell 2 and compare to all its neighbors downstream etc. 
#if a row produces a true, then move on to next row
# subset the rows (passphrases) that have no duplicates and store in a separate vector 
# at the end, sum the vector containing valid phrases 

setwd("/Users/lesley/Google Drive/UBC/My Science/Advent.of.Code/Day 4/")

md <- scan("day4.data.txt", what = "", sep = "\n")
md <- strsplit(md, split = " ")

not.valid <- c()
for(i in 1:length(md)){
      characters <- unlist(md[i]) #subset 1 item in motherlist at a time
      for(j in 1:length(characters)){
            character.j <- characters[j]
            charac.notj <- characters[-j]
            if(character.j%in%charac.notj){
                  not.valid <- c(not.valid, md[i])
            }
      }
}

no.duplicate <- unique(not.valid)
total.invalid <- length(no.duplicate)
print(total.invalid)

total.valid <- length(md) - total.invalid
print(total.valid)
