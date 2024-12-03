# Plot mCPR data and estimates

## Description

Plot mCPR data and estimates

## Usage

```r
plot_cp(dat, est, iso_code, CI = 95)
```

## Arguments

* `dat:`: tibble which contains mCPR observations. Columns: iso, cpr_year, mCPR
* `est:`: tibble which contains mCPR estimates. Columns: “Country or area”, iso, Year, Median, U95, L95
* `iso_code:`: country iso code
* `CI:`: Confidence intervals to be plotted. Options can be: 80, 95, or NA (no CI plotted)

## Value

: ggplot object with data and estimates

## Examples

```r
function(dat, est, iso_code, CI=95)
```

