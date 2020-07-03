library(mixOmics)

input <- function(inputfile) {
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
  numcomponents <<- as.integer(parameters["numcomponents", 2])
  elements <<- read.table(parameters["files", 2]);
  outcome <<- read.csv(parameters["outcome", 2], header=TRUE)
  rownames(outcome) <<- outcome[,1];
  outcome <<- outcome[,-1];
  outcome <<- as.factor(outcome);
}

run <- function() {
  mydata <<- list(length=nrow(elements));
  keep <<- list(length=nrow(elements));
  for (i in 1:nrow(elements)) {
     csvfile <- elements[i, 1];
     name <- elements[i, 2];
     x <- read.csv(csvfile, header=TRUE);
     rownames(x) <- x[,1];
     x <- x[,-1];
     mydata[[i]] <<- x
     names(mydata)[i] <<- name
     keep[[i]] <<- rep(elements[i, 3], elements[i, 4]);
     names(keep)[i] <<- name 
  }
}

output <- function(outputfile) {
   design = matrix(1, ncol = length(mydata), nrow = length(mydata), dimnames = list(names(mydata), names(mydata)));
   diag(design) = 0

   BC.diablo = block.splsda(X=mydata, Y=outcome, ncomp=numcomponents, keepX=keep, design=design);
   write.csv(BC.diablo$weights, outputfile);
   plotDiablo(BC.diablo, ncomp=1);
}
