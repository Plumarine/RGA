# Build data.frame for core report
build_ga <- function(data, cols) {
    data_df <- as.data.frame(data, stringsAsFactors = FALSE)
    colnames(data_df) <- cols$name
    return(data_df)
}

# Build data.frame for mcf report
build_mcf <- function(data, cols) {
    if ("MCF_SEQUENCE" %in% cols$dataType) {
        primitive.idx <- grep("MCF_SEQUENCE", cols$dataType, invert = TRUE)
        conversion.idx <- grep("MCF_SEQUENCE", cols$dataType)
        primitive <- lapply(data, function(x) .subset2(x, "primitiveValue")[primitive.idx])
        primitive <- do.call(rbind, primitive)
        colnames(primitive) <- cols$name[primitive.idx]
        conversion <- lapply(data, function(x) .subset2(x, "conversionPathValue")[conversion.idx])
        conversion <- lapply(conversion, function(i) lapply(i, function(x) paste(apply(x, 1, paste, collapse = ":"), collapse = " > ")))
        conversion <- do.call(rbind, lapply(conversion, unlist))
        colnames(conversion) <- cols$name[conversion.idx]
        data_df <- data.frame(primitive, conversion, stringsAsFactors = FALSE)[, cols$name]
    } else {
        data_df <- as.data.frame(do.call(rbind, lapply(data, unlist)), stringsAsFactors = FALSE)
        colnames(data_df) <- cols$name
    }
    return(data_df)
}

# Build data.frame for mgmt
build_mgmt <- function(data, cols) {
    if (data$totalResults > 0 && !is.null(data[["items"]])) {
        data_df <- data[["items"]]
        data_df <- data_df[, names(data_df) %in% cols]
    } else {
        data_df <- data.frame(matrix(NA, nrow = 1L, ncol = length(cols)))
        colnames(data_df) <- cols
    }
    return(data_df)
}

# Build a data.frame for GA report data
build_df <- function(type = c("ga", "mcf", "rt"), data, cols) {
    cols$name <- gsub("^(ga|mcf|rt):", "", cols$name)
    type <- match.arg(type)
    data_df <- switch(type,
                      ga = build_ga(data, cols),
                      rt = build_ga(data, cols),
                      mcf = build_mcf(data, cols))
    return(data_df)
}

# Convert data types
convert_datatypes <- function(data, formats) {
    formats[formats %in% c("INTEGER", "PERCENT", "TIME", "CURRENCY", "FLOAT")] <- "numeric"
    formats[formats == "STRING"] <- "character"
    formats[formats == "MCF_SEQUENCE"] <- "character"
    data[] <- lapply(seq_along(formats), function(i) as(data[[i]], Class = formats[i]))
    if ("date" %in% colnames(data)) {
        data$date <- as.Date(data$date, "%Y%m%d")
    }
    if ("conversionDate" %in% colnames(data)) {
        data$conversionDate <-as.Date(data$conversionDate, "%Y%m%d")
    }
    return(data)
}