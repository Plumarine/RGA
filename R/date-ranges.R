date_ranges <- function(start, end, by) {
    start <- as.Date(start)
    end <- as.Date(end)
    by <- match.arg(by, c("day", "week", "month", "quarter", "year"))
    dates <- seq.Date(start, end, by = by)
    res <- data.frame(start = as.character(dates),
                      end = as.character(c(dates[-1] - 1, end)),
                      stringsAsFactors = FALSE)
    return(res)
}

parse_date <- function(x) {
    stopifnot(is.character(x))
    if (grepl("daysAgo", x, fixed = TRUE))
        x <- Sys.Date() - as.numeric(sub("^([0-9]+).*", "\\1", x))
    else if (x == "today")
        x <- Sys.Date()
    else if (x == "yesterday")
        x <- Sys.Date() - 1
    return(as.character(x))
}

#' @include get-data.R
fetch_by <- function(path, query, by, token) {
    query$start.date <- parse_date(query$start.date)
    query$end.date <- parse_date(query$end.date)
    dates <- date_ranges(query$start.date, query$end.date, by)
    n <- nrow(dates)
    message("Batch processing mode enabled.\n",
            sprintf("Fetch data by %s: from %s to %s.", by, query$start.date, query$end.date))
    pages <- vector(mode = "list", length = n)
    pb <- utils::txtProgressBar(min = 0, max = n, initial = 0, style = 3)
    for (i in 1:n) {
        query$start.date <- dates$start[i]
        query$end.date <- dates$end[i]
        capture.output(
            pages[[i]] <- get_data(path, query, token)
        )
        utils::setTxtProgressBar(pb, i)
    }
    res <- pages[[1]]
    res$rows <- plyr::rbind.fill(lapply(pages, .subset2, "rows"))
    res$query$start.date <- pages[[1]]$query$start.date
    res$query$end.date <- pages[[n]]$query$end.date
    res$total.results <- sum(unlist(lapply(pages, .subset2, "total.results")))
    res$contains.sampled.data <- any(unlist(lapply(pages, .subset2, "contains.sampled.data")))
    if (isTRUE(res$contains.sampled.data)) {
        res$sample.size <- sum(unlist(lapply(pages, .subset2, "sample.size")))
        res$sample.space <- sum(unlist(lapply(pages, .subset2, "sample.space")))
    }
    if (is.null(query$dimensions))
        res$rows <- as.data.frame(as.list(colSums(res$rows)))
    else if (!is.null(query$dimensions) && !any(grepl("date", query$dimensions))) {
        mets <- parse_params(query$metrics)
        dims <- parse_params(query$dimensions)
        res$rows <- stats::aggregate.data.frame(res$rows[mets], res$rows[dims], sum)
    }
    close(pb)
    if (grepl("ga:users|ga:[0-9]+dayUsers", query$metrics))
        warning("The 'ga:users' or 'ga:NdayUsers' total value for several days is not the sum of values for each single day.", call. = FALSE)
    return(res)
}
