#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

# read the input file name from command line argument
input_file <- toString(args[1])

# read the gprofiler output file name
gprofiler_output <- toString(args[2])

# read the GO list output file name
go_list <- toString(args[3])

# read the Ensemble ID's of the genes from file
listIDs <- scan(input_file, what="", sep="\n")

library("gprofiler2")
library("dplyr")

# run gost query, use Gene Ontology (GO) as data source
# change significant = TRUE to select only terms with p <= 0.05
gost_output <- gost(query = listIDs, organism = "hsapiens", ordered_query = FALSE,
                    significant = FALSE, sources = "GO")
# get the result dataframe
res <- gost_output$result

# unlist the parents column so that the dataframe can be written to file
for (i in 1:nrow(res)) {
  if (lengths(res$parents[i]) > 1) {
    # separate multiple parents with a blank
    res$parents[i] <- paste(unlist(res$parents[i]), collapse = " ")
  } else {
    res$parents[i] <- paste(unlist(res$parents[i]), collapse = "")
  } 
}

# change the class of the column from list to character
res$parents <- unlist(res$parents)

# write result dataframe of gost query to file
write.table(res, gprofiler_output, sep="\t",
            quote=FALSE, row.names=FALSE)

# select useful columns
gost_res <- res %>% select(p_value, term_id, source, term_name)
# order by p_value
output <- gost_res[order(gost_res$p_value),]

# write final output dataframe with four columns to file
write.table(output, go_list, sep="\t",
            quote=FALSE, row.names=FALSE)
