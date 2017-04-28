#Example data (real data could be retreived by gProfileR)
GOs <- c("GO:0009268", "GO:0010447", "GO:0000027", "GO:0042255", "GO:0042257", "GO:0042273", "GO:0030880", "GO:0009775", "GO:0009853", "GO:0030255", "GO:0015797", "GO:0045158", "GO:0000786", "GO:0006334", "GO:0034728", "GO:0009539", "GO:0000785", "GO:0009635", "GO:0008097", "GO:0051262")
pvals <- c(1e-14, 1e-14, 1e-297, 1e-297, 1e-297, 1e-297, 1e-17, 1e-13, 1e-11, 1e-18, 1e-11, 1e-27, 1e-31, 1e-31, 1e-31, 1e-12, 1e-30, 1e-31, 1e-155, 1e-84)

#Parameters to change
cutoff <- "0.4" #Allowed values: "0.90" "0.70" "0.50" "0.40" 
organism <- "whole UniProt" #Allowed values: See organism.list below
isPValue <- "yes" #Allowed values: "yes"  "no"
whatIsBetter <- "higher" #Allowed values: "higher" "lower" "absolute" "abs_log"
measure <- "SIMREL" #Allowed values: "RESNIK" "LIN" "SIMREL" "JIANG"
domain <- "BP" #Allowed values: "BP" "CC" "MF"

#Do not change below
organism.list <- list(
	"whole UniProt"=0, 
	"Homo sapiens"=9606,
	"Mus musculus"=10090,
	"Rattus norvegicus"=10116,
	"Bos taurus"=9913,
	"Gallus gallus"=9031,
	"Danio rerio"=7955,
	"Takifugu rubripes"=31033,
	"Xenopus laevis"=8355,
	"Drosophila melanogaster"=7227,
	"Caenorhabditis elegans"=6239,
	"Arabidopsis thaliana"=3702,
	"Oryza sativa"=39947,
	"Zea mays"=4577,
	"Saccharomyces cerevisiae"=4932,
	"Schizosaccharomyces pombe"=4896,
	"Dictyostelium discoideum"=44689,
	"Plasmodium falciparum"=5833,
	"Chlamydomonas reinhardtii"=3055,
	"Escherichia coli"=83333,
	"Bacillus subtilis"=1423,
	"Pseudomonas aeruginosa"=287,
	"Mycobacterium tuberculosis"=1773,
	"Mycoplasma genitalium"=2097,
	"Synechocystis sp."=1148
	)
organism.db <- as.character(organism.list[organism])

mycommand=paste('revigo.pl -goterms', paste(GOs,collapse=","), '-gopvals', paste(pvals,collapse=","), '-cutoff', cutoff,  '-organism', organism.db, '-ispvalue', isPValue, '-whatisbetter', whatIsBetter, '-measure', measure, sep=" ")

mytempfile <- tempfile()
system2(command='perl', args=mycommand, stdout=mytempfile)
source(mytempfile)
