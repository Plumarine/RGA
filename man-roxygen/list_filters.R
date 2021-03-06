#' @title Filters
#' @description Lists all filters for an account
#' @param account.id character. Account ID to retrieve filters for.
#' @param max.results integer. The maximum number of filters to include in this response.
#' @param start.index integer. An index of the first entity to retrieve. Use this parameter as a pagination mechanism along with the max-results parameter.
#' @param token \code{\link[httr]{Token2.0}} class object with a valid authorization data.
#' @return The Filters collection is a set of Filter resources, each of which describes a filter which can be applied to a View (profile).
#' \item{id}{Filter ID.}
#' \item{kind}{Resource type for Analytics filter.}
#' \item{account.id}{Account ID to which this filter belongs.}
#' \item{name}{Name of this filter.}
#' \item{type}{Type of this filter. Possible values are INCLUDE, EXCLUDE, LOWERCASE, UPPERCASE, SEARCH_AND_REPLACE and ADVANCED.}
#' \item{created}{Time this filter was created.}
#' \item{updated}{Time this filter was last modified.}
#' \item{include.details}{Details for the filter of the type INCLUDE.}
#' \item{exclude.details}{Details for the filter of the type EXCLUDE.}
#' \item{lowercase.details}{Details for the filter of the type LOWER.}
#' \item{uppercase.details}{Details for the filter of the type UPPER.}
#' \item{search.and.replace.details}{Details for the filter of the type SEARCH_AND_REPLACE.}
#' \item{advanced.details}{Details for the filter of the type ADVANCED.}
#' \item{include.details.kind}{Kind value for filter expression}
#' \item{include.details.field}{Field to filter. Possible values:    Content and Traffic  PAGE_REQUEST_URI, PAGE_HOSTNAME, PAGE_TITLE, REFERRAL, COST_DATA_URI (Campaign target URL), HIT_TYPE, INTERNAL_SEARCH_TERM, INTERNAL_SEARCH_TYPE, SOURCE_PROPERTY_TRACKING_ID,     Campaign or AdGroup  CAMPAIGN_SOURCE, CAMPAIGN_MEDIUM, CAMPAIGN_NAME, CAMPAIGN_AD_GROUP, CAMPAIGN_TERM, CAMPAIGN_CONTENT, CAMPAIGN_CODE, CAMPAIGN_REFERRAL_PATH,     E-Commerce  TRANSACTION_COUNTRY, TRANSACTION_REGION, TRANSACTION_CITY, TRANSACTION_AFFILIATION (Store or order location), ITEM_NAME, ITEM_CODE, ITEM_VARIATION, TRANSACTION_ID, TRANSACTION_CURRENCY_CODE, PRODUCT_ACTION_TYPE,     Audience/Users  BROWSER, BROWSER_VERSION, BROWSER_SIZE, PLATFORM, PLATFORM_VERSION, LANGUAGE, SCREEN_RESOLUTION, SCREEN_COLORS, JAVA_ENABLED (Boolean Field), FLASH_VERSION, GEO_SPEED (Connection speed), VISITOR_TYPE, GEO_ORGANIZATION (ISP organization), GEO_DOMAIN, GEO_IP_ADDRESS, GEO_IP_VERSION,     Location  GEO_COUNTRY, GEO_REGION, GEO_CITY,     Event  EVENT_CATEGORY, EVENT_ACTION, EVENT_LABEL,     Other  CUSTOM_FIELD_1, CUSTOM_FIELD_2, USER_DEFINED_VALUE,     Application  APP_ID, APP_INSTALLER_ID, APP_NAME, APP_VERSION, SCREEN, IS_APP (Boolean Field), IS_FATAL_EXCEPTION (Boolean Field), EXCEPTION_DESCRIPTION,     Mobile device  IS_MOBILE (Boolean Field, Deprecated. Use DEVICE_CATEGORY=mobile), IS_TABLET (Boolean Field, Deprecated. Use DEVICE_CATEGORY=tablet), DEVICE_CATEGORY, MOBILE_HAS_QWERTY_KEYBOARD (Boolean Field), MOBILE_HAS_NFC_SUPPORT (Boolean Field), MOBILE_HAS_CELLULAR_RADIO (Boolean Field), MOBILE_HAS_WIFI_SUPPORT (Boolean Field), MOBILE_BRAND_NAME, MOBILE_MODEL_NAME, MOBILE_MARKETING_NAME, MOBILE_POINTING_METHOD,     Social  SOCIAL_NETWORK, SOCIAL_ACTION, SOCIAL_ACTION_TARGET,}
#' \item{include.details.match.type}{Match type for this filter. Possible values are BEGINS_WITH, EQUAL, ENDS_WITH, CONTAINS, or MATCHES. GEO_DOMAIN, GEO_IP_ADDRESS, PAGE_REQUEST_URI, or PAGE_HOSTNAME filters can use any match type; all other filters must use MATCHES.}
#' \item{include.details.expression.value}{Filter expression value}
#' \item{include.details.case.sensitive}{Determines if the filter is case sensitive.}
#' \item{include.details.field.index}{The Index of the custom dimension. Set only if the field is a is CUSTOM_DIMENSION.}
#' \item{exclude.details.kind}{Kind value for filter expression}
#' \item{exclude.details.field}{Field to filter. Possible values:    Content and Traffic  PAGE_REQUEST_URI, PAGE_HOSTNAME, PAGE_TITLE, REFERRAL, COST_DATA_URI (Campaign target URL), HIT_TYPE, INTERNAL_SEARCH_TERM, INTERNAL_SEARCH_TYPE, SOURCE_PROPERTY_TRACKING_ID,     Campaign or AdGroup  CAMPAIGN_SOURCE, CAMPAIGN_MEDIUM, CAMPAIGN_NAME, CAMPAIGN_AD_GROUP, CAMPAIGN_TERM, CAMPAIGN_CONTENT, CAMPAIGN_CODE, CAMPAIGN_REFERRAL_PATH,     E-Commerce  TRANSACTION_COUNTRY, TRANSACTION_REGION, TRANSACTION_CITY, TRANSACTION_AFFILIATION (Store or order location), ITEM_NAME, ITEM_CODE, ITEM_VARIATION, TRANSACTION_ID, TRANSACTION_CURRENCY_CODE, PRODUCT_ACTION_TYPE,     Audience/Users  BROWSER, BROWSER_VERSION, BROWSER_SIZE, PLATFORM, PLATFORM_VERSION, LANGUAGE, SCREEN_RESOLUTION, SCREEN_COLORS, JAVA_ENABLED (Boolean Field), FLASH_VERSION, GEO_SPEED (Connection speed), VISITOR_TYPE, GEO_ORGANIZATION (ISP organization), GEO_DOMAIN, GEO_IP_ADDRESS, GEO_IP_VERSION,     Location  GEO_COUNTRY, GEO_REGION, GEO_CITY,     Event  EVENT_CATEGORY, EVENT_ACTION, EVENT_LABEL,     Other  CUSTOM_FIELD_1, CUSTOM_FIELD_2, USER_DEFINED_VALUE,     Application  APP_ID, APP_INSTALLER_ID, APP_NAME, APP_VERSION, SCREEN, IS_APP (Boolean Field), IS_FATAL_EXCEPTION (Boolean Field), EXCEPTION_DESCRIPTION,     Mobile device  IS_MOBILE (Boolean Field, Deprecated. Use DEVICE_CATEGORY=mobile), IS_TABLET (Boolean Field, Deprecated. Use DEVICE_CATEGORY=tablet), DEVICE_CATEGORY, MOBILE_HAS_QWERTY_KEYBOARD (Boolean Field), MOBILE_HAS_NFC_SUPPORT (Boolean Field), MOBILE_HAS_CELLULAR_RADIO (Boolean Field), MOBILE_HAS_WIFI_SUPPORT (Boolean Field), MOBILE_BRAND_NAME, MOBILE_MODEL_NAME, MOBILE_MARKETING_NAME, MOBILE_POINTING_METHOD,     Social  SOCIAL_NETWORK, SOCIAL_ACTION, SOCIAL_ACTION_TARGET,}
#' \item{exclude.details.match.type}{Match type for this filter. Possible values are BEGINS_WITH, EQUAL, ENDS_WITH, CONTAINS, or MATCHES. GEO_DOMAIN, GEO_IP_ADDRESS, PAGE_REQUEST_URI, or PAGE_HOSTNAME filters can use any match type; all other filters must use MATCHES.}
#' \item{exclude.details.expression.value}{Filter expression value}
#' \item{exclude.details.case.sensitive}{Determines if the filter is case sensitive.}
#' \item{exclude.details.field.index}{The Index of the custom dimension. Set only if the field is a is CUSTOM_DIMENSION.}
#' \item{lowercase.details.field}{Field to use in the filter.}
#' \item{lowercase.details.field.index}{The Index of the custom dimension. Required if field is a CUSTOM_DIMENSION.}
#' \item{uppercase.details.field}{Field to use in the filter.}
#' \item{uppercase.details.field.index}{The Index of the custom dimension. Required if field is a CUSTOM_DIMENSION.}
#' \item{search.and.replace.details.field}{Field to use in the filter.}
#' \item{search.and.replace.details.field.index}{The Index of the custom dimension. Required if field is a CUSTOM_DIMENSION.}
#' \item{search.and.replace.details.search.string}{Term to search.}
#' \item{search.and.replace.details.replace.string}{Term to replace the search term with.}
#' \item{search.and.replace.details.case.sensitive}{Determines if the filter is case sensitive.}
#' \item{advanced.details.field.a}{Field A.}
#' \item{advanced.details.field.a.index}{The Index of the custom dimension. Required if field is a CUSTOM_DIMENSION.}
#' \item{advanced.details.extract.a}{Expression to extract from field A.}
#' \item{advanced.details.field.b}{Field B.}
#' \item{advanced.details.field.b.index}{The Index of the custom dimension. Required if field is a CUSTOM_DIMENSION.}
#' \item{advanced.details.extract.b}{Expression to extract from field B.}
#' \item{advanced.details.output.to.field}{Output field.}
#' \item{advanced.details.output.to.field.index}{The Index of the custom dimension. Required if field is a CUSTOM_DIMENSION.}
#' \item{advanced.details.output.constructor}{Expression used to construct the output value.}
#' \item{advanced.details.field.a.required}{Indicates if field A is required to match.}
#' \item{advanced.details.field.b.required}{Indicates if field B is required to match.}
#' \item{advanced.details.override.output.field}{Indicates if the existing value of the output field, if any, should be overridden by the output expression.}
#' \item{advanced.details.case.sensitive}{Indicates if the filter expressions are case sensitive.}
#' @references \href{https://developers.google.com/analytics/devguides/config/mgmt/v3/mgmtReference/management/filters}{Management API - Filters Overview}
#' @family Management API
