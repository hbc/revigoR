GOs <- c("GO:0009268","GO:0010447","GO:0000027","GO:0042255","GO:0042257","GO:0042273","GO:0030880","GO:0009775","GO:0009853","GO:0030255")
pvals <- rep(0.01, length(GOs))

mycommand=paste('revigo.pl -goterms', paste(GOs,collapse=","), '-gopvals', paste(pvals,collapse=","), sep=" ")

mytempfile <- tempfile()
system2(command='perl', args=mycommand, stdout=mytempfile)
source(mytempfile)
