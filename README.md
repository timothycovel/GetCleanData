# GetCleanData

The script run_analysis.R, performs the following:
* If not present, download the UCI dataset and unzip it in the current directory
* Read in the feature and activity name data, and only the Standard Deviation and Mean values from the testing and training sets.
* Merge the data into a single data set
* Create a tidy data set containing the Mean of each observation type for X,Y,Z (where available)
* Output the tidy data set to "my_tidydata.txt"
* use View() to display the tidy data set

If you have the tidy data set that has been submitted, you can view it in Rstudio using the following command:
* View("my_tidydata.txt")

Additional details about the Data involved in run_analysis.R and the output data can be found in the codebook.md file.


