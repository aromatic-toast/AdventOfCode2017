#find the number of valid passphrases 
# valid passphrases contain no 2 words that are "anagrams" of each other
#no 2 words can contain the same letters. 
# a passphrase is invalid if any word's letters can be rearranged to form any other word in the passphrase.

# For example:

# abcde fghij is a valid passphrase.
# abcde xyz ecdab is not valid - the letters from the third word can be rearranged to form the first word.
# a ab abc abd abf abj is a valid passphrase, because all letters need to be used when forming another word.
# iiii oiii ooii oooi oooo is valid.
# oiii ioii iioi iiio is not valid - any of these words can be rearranged to form any other word.
# Under this new system policy, how many passphrases are valid?

#make pairwise comparisons between every member of a row/passphrase
#use a counter to keep track of the passphrases that have a match; these are the invalid passphrases
#subtract the # of invalid passphrases from the total # of passphrases in dataset 

setwd("/Users/lesley/Google Drive/UBC/My Science/Advent.of.Code/Day 4/")

md <- scan("day4.data.txt", what = "", sep = "\n")
md <- strsplit(md, split = " ")


match.strings <- function(string1,string2){
      string1 <- sort(unlist(strsplit(string1, split = "")))
      string1 <- paste(string1, collapse = "")
      string2 <- sort(unlist(strsplit(string2, split = "")))
      string2 <- paste(string2, collapse = "")
      if(string1==string2){
            return(TRUE)
      } else{
            return(FALSE)
      }
}





invalid <- c()
for(i in 1:length(md)){
      passphrase <- unlist(md[i])
      for(j in 1:(length(passphrase)-1)){
            string.j <- passphrase[j]
            for(k in (j+1):length(passphrase)){
                  string.k <- passphrase[k]
                  check.match <- match.strings(string.j, string.k)
                  if(check.match==TRUE){
                        invalid <- c(invalid, md[i])
                  } 
            }
            
      }
}
invalid <- length(unique(invalid))
print(invalid)

total.valid <- length(md) - invalid
print(total.valid)
