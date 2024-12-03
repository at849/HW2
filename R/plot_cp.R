#' Plot mCPR data and estimates
#'
#' @param dat: tibble which contains mCPR observations. Columns: iso, cpr_year, mCPR
#' @param est: tibble which contains mCPR estimates. Columns: “Country or area”, iso, Year, Median, U95, L95
#' @param iso_code: country iso code
#' @param CI: Confidence intervals to be plotted. Options can be: 80, 95, or NA (no CI plotted)
#'
#' @return: ggplot object with data and estimates
#' @export
#'
#' @examples function(dat, est, iso_code, CI=95)
plot_cp <- function(dat, est, iso_code, CI=95) {

  data<-full_join(est, dat, by= "iso", relationship = "many-to-many")

  mydata <- data%>%
    filter(iso == iso_code)

  p<-mydata%>%
    ggplot(aes(x = Year, y=Median)) +
    geom_point(aes(x = cpr_year, y=mCPR), size=1)+
    geom_line(aes(x = Year, y=Median)) +
    labs(x = "Time", y = "Modern use (%)")

  for (i in seq_along(iso_code))
  {
    plot<-p+ labs(title = mydata$`Country or area`[i])
  }

  if (is.na(CI)) plot
  else if (CI==80)
    plot+geom_smooth(
      stat = "identity",
      aes(ymax = U80, ymin = L80))
  else
    plot+geom_smooth(
      stat = "identity",
      aes(ymax = U95, ymin = L95))

}

