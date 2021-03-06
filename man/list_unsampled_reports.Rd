% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/unsampled.R
\name{list_unsampled_reports}
\alias{list_unsampled_reports}
\title{Unsampled Reports}
\usage{
list_unsampled_reports(account.id, webproperty.id, profile.id,
  start.index = NULL, max.results = NULL, token)
}
\arguments{
\item{account.id}{character. Account ID to retrieve unsampled reports for. Must be a specific account ID, ~all is not supported.}

\item{webproperty.id}{character. Web property ID to retrieve unsampled reports for. Must be a specific web property ID, ~all is not supported.}

\item{profile.id}{character. View (Profile) ID to retrieve unsampled reports for. Must be a specific view (profile) ID, ~all is not supported.}

\item{start.index}{integer. An index of the first unsampled report to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.}

\item{max.results}{integer. The maximum number of unsampled reports to include in this response.}

\item{token}{\code{\link[httr]{Token2.0}} class object with a valid authorization data.}
}
\value{
\item{id}{Unsampled report ID.}
\item{kind}{Resource type for an Analytics unsampled report.}
\item{title}{Title of the unsampled report.}
\item{account.id}{Account ID to which this unsampled report belongs.}
\item{webproperty.id}{Web property ID to which this unsampled report belongs. The web property ID is of the form UA-XXXXX-YY.}
\item{profile.id}{View (Profile) ID to which this unsampled report belongs.}
\item{start.date}{The start date for the unsampled report.}
\item{end.date}{The end date for the unsampled report.}
\item{metrics}{The metrics for the unsampled report.}
\item{dimensions}{The dimensions for the unsampled report.}
\item{filters}{The filters for the unsampled report.}
\item{segment}{The segment for the unsampled report.}
\item{status}{Status of this unsampled report.  Possible values are PENDING, COMPLETED, or FAILED.}
\item{download.type}{The type of download you need to use for the report data file.}
\item{drive.download.details}{Download details for a file stored in Google Drive.}
\item{cloud.storage.download.details}{Download details for a file stored in Google Cloud Storage.}
\item{created}{Time this unsampled report was created.}
\item{updated}{Time this unsampled report was last modified.}
\item{drive.download.details.document.id}{Id of the document/file containing the report data.}
\item{cloud.storage.download.details.bucket.id}{Id of the bucket the file object is stored in.}
\item{cloud.storage.download.details.object.id}{Id of the file object containing the report data.}
}
\description{
Lists unsampled reports to which the user has access.
}
\references{
\href{https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/unsampledReports}{Management API - Unsampled Reports Overview}
}
\seealso{
Other Management API: \code{\link{get_custom_dimension}},
  \code{\link{get_custom_metric}},
  \code{\link{get_experiment}}, \code{\link{get_filter}},
  \code{\link{get_goal}}, \code{\link{get_profile}},
  \code{\link{get_unsampled_report}},
  \code{\link{get_upload}}, \code{\link{get_webproperty}},
  \code{\link{list_accounts}},
  \code{\link{list_custom_data_sources}},
  \code{\link{list_custom_dimensions}},
  \code{\link{list_custom_metrics}},
  \code{\link{list_experiments}},
  \code{\link{list_filters}}, \code{\link{list_goals}},
  \code{\link{list_profiles}}, \code{\link{list_segments}},
  \code{\link{list_uploads}},
  \code{\link{list_webproperties}}
}

