% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Main.R
\name{execute}
\alias{execute}
\title{Execute the Study}
\usage{
execute(
  connectionDetails,
  cdmDatabaseSchema,
  cdmDatabaseName = "friendly database name",
  cohortDatabaseSchema = cdmDatabaseSchema,
  cohortTable = "cohort",
  oracleTempSchema = cohortDatabaseSchema,
  sampleSize = NULL,
  studyStartDate = "",
  studyEndDate = "",
  endDay = -1,
  outputFolder,
  createCohorts = T,
  useFluCohort = F,
  extractData = T,
  packageResults = T,
  minCellCount = 10,
  verbosity = "INFO",
  cdmVersion = 5
)
}
\arguments{
\item{connectionDetails}{An object of type \code{connectionDetails} as created using the
\code{\link[DatabaseConnector]{createConnectionDetails}} function in the
DatabaseConnector package.}

\item{cdmDatabaseSchema}{Schema name where your patient-level data in OMOP CDM format resides.
Note that for SQL Server, this should include both the database and
schema name, for example 'cdm_data.dbo'.}

\item{cdmDatabaseName}{Shareable name of the database}

\item{cohortDatabaseSchema}{Schema name where the cohorts and covariates are created. You will need to have
write priviliges in this schema. Note that for SQL Server, this should
include both the database and schema name, for example 'cdm_data.dbo'.}

\item{cohortTable}{The name of the table that will be created in the work database schema.
This table will hold the target, outcome and variable cohorts used in this study.}

\item{oracleTempSchema}{Should be used in Oracle to specify a schema where the user has write
priviliges for storing temporary tables.}

\item{sampleSize}{How many patients to sample from the target population}

\item{studyStartDate}{Restrict to certain time period}

\item{studyEndDate}{Restrict to certain time period}

\item{endDay}{The end day relative to index for the custom covariates (default is -1)}

\item{outputFolder}{Name of local folder to place results; make sure to use forward slashes
(/). Do not use a folder on a network drive since this greatly impacts
performance.}

\item{createCohorts}{Create the cohortTable table with the cohorts}

\item{useFluCohort}{use to the test the package in flu data}

\item{extractData}{Extract the data and create the components for the DLLM}

\item{packageResults}{Should results be packaged for later sharing?}

\item{minCellCount}{The minimum number of subjects contributing to a count before it can be included
in packaged results.}

\item{verbosity}{Sets the level of the verbosity. If the log level is at or higher in priority than the logger threshold, a message will print. The levels are:
\itemize{
\item{DEBUG}{Highest verbosity showing all debug statements}
\item{TRACE}{Showing information about start and end of steps}
\item{INFO}{Show informative information (Default)}
\item{WARN}{Show warning messages}
\item{ERROR}{Show error messages}
\item{FATAL}{Be silent except for fatal errors}
}}

\item{cdmVersion}{The version of the common data model}
}
\description{
Execute the Study
}
\details{
This function executes the DLMM Study.
}
\examples{
\dontrun{
connectionDetails <- createConnectionDetails(dbms = "postgresql",
                                             user = "joe",
                                             password = "secret",
                                             server = "myserver")

execute(connectionDetails,
        cdmDatabaseSchema = "cdm_data",
        cdmDatabaseName = 'shareable name of the database'
        cohortDatabaseSchema = "study_results",
        cohortTable = "cohort",
        oracleTempSchema = NULL,
        sampleSize = NULL
        studyStartDate,
        studyEndDate,
        endDay = -1,
        outputFolder = "c:/temp/study_results",
        createCohorts = T,
        useFluCohort = F,
        extractData = T,
        packageResults = T,
        minCellCount = 10,
        verbosity = "INFO",
        cdmVersion = 5)
}

}
