get_first_profile <- function(token) {
    id <- suppressWarnings(list_profiles(start.index = 1L, max.results = 1L, token = token)$id)
    if (is.null(id))
        stop("No views (profiles) found on this account.", call. = FALSE)
    return(id)
}

# Get the Anaytics reporting data
#' @include query.R
#' @include get-data.R
#' @include profiles.R
get_report <- function(path, query, token, by = NULL) {
    if (is.null(query$profile.id)) {
        query$profile.id <- get_first_profile(token)
        warning(sprintf("'profile.id' was missing. Used first found 'profile.id': %s", paste0("ga:", query$profile.id)), call. = FALSE)
    }
    if (!grepl("^ga:", query$profile.id))
        query$profile.id <- paste0("ga:", query$profile.id)
    if (!is.null(by))
        json_content <- fetch_by(path, query, by, token)
    else
        json_content <- get_data(path, query, token)
    res <- json_content$rows
    # Convert dates to POSIXct with timezone defined in the GA profile
    if (any(grepl("date", names(res), fixed = TRUE))) {
        timezone <- get_profile(json_content$profile.info$account.id,
                                json_content$profile.info$webproperty.id,
                                json_content$profile.info$profile.id, token)$timezone
        if (!is.null(res$date.hour))
            res$date.hour <- lubridate::ymd_h(res$date.hour, tz = timezone)
        if (!is.null(res[["date"]]))
            res[["date"]] <- lubridate::ymd(res[["date"]], tz = timezone)
        if (!is.null(res$conversion.date))
            res$conversion.date <- lubridate::ymd(res$conversion.date, tz = timezone)
    }
    attr(res, "profile.info") <- json_content$profile.info
    attr(res, "query") <- fix_query(json_content$query)
    attr(res, "sampled") <- json_content$contains.sampled.data
    if (!is.null(json_content$contains.sampled.data) && isTRUE(json_content$contains.sampled.data)) {
        attr(res, "sample.size") <- json_content$sample.size
        attr(res, "sample.space") <- json_content$sample.space
        sample_perc <- json_content$sample.size / json_content$sample.space * 100
        if (is.null(by))
            warning(sprintf("Data contains sampled data. Used %d sessions (%1.0f%% of sessions). Try to use the 'fetch.by' param to avoid sampling.", json_content$sample.size, sample_perc), call. = FALSE)
        else
            warning(sprintf("Data contains sampled data. Used %d sessions (%1.0f%% of sessions).", json_content$sample.size, sample_perc), call. = FALSE)
    }
    return(res)
}
