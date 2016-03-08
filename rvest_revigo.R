library(rvest)
library(httr)
baseurl <- "http://revigo.irb.hr/"

goList = "GO:0009268 1e-14
GO:0010447 1e-14
GO:0000027 1e-297
GO:0042255 1e-297
GO:0042257 1e-297
GO:0042273 1e-297"

revigo_session <- html_session("http://revigo.irb.hr/")
revigo_form <- html_form(revigo_session)[[1]]  
filled_form <- set_values(revigo_form,'goList' = goList, 'cutoff'=0.4, 'isPValue'="yes")
result_page <- submit_form(revigo_session, filled_form, submit='startRevigo')

results_table <- html_table(result_page)[[1]]
names(results_table) <- results_table[2,]
results_table <- results_table[3:nrow(results_table),]


# how to get the representative category?
temp <- html_nodes(result_page, "#fragment-1c")

xml_text(temp)
strsplit(xml_text(temp), "\\[|\\]")[[1]]


# how to extract the source html from the rvest session?

