# DIABLO
# Language: R
# Input: TXT
# Output: CSV
# Tested with: PluMA 1.1, R 4.0.0
# Dependency: mixOmics_6.12.1


PluMA plugin to take multiple datasets and generate a DIABLO (Singh et al, 2019) plot.

The plugin accepts an input TXT file of keyword-value pairs, tab-delimited:
files: TXT file containing the list of input data CSV files, one per line
outcome: CSV file containing an outcome for each sample (rows are samples, one column for outcome)
numcomponents: The number of principle components to include in the analysis

Each line of the CSV file for "files" should have the following content, tab-delimited:
<filename> <name for data in plots> <number of variables to select per component> <number of variables to use for this dataset>

The plugin will output a CSV file for weights.  DIABLO plots will be sent to "Rplots.pdf".

The included example uses the same dataset from the R documentation for DIABLO, which has been included as CSV files.
