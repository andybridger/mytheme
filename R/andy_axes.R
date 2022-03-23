#' Ensure your y- and x-axis are aig style guide-consistent and doesn't hang
#' off the edge of the chart.
#'
#' @param expand_bottom default is 0. This will ensure that your x-axis is at
#'   the bottom value of your plotted data. Increase to add some buffer between
#'   the lowest point in your data and the x-axis. Note that the value is
#'   interpreted as a fraction of the total plotting space - a value of 1 will
#'   add white space equal to the whole area of your data.
#' @param expand_top default is 0.015. This will ensure that a small amount of
#'   white space is added to the top of your chart. Increase to add more white
#'   space.
#' @param expand_left default is 0. This will ensure your y-axis is at the
#'   lowest value of your plotted value.
#' @param expand_right default is 0.015. This will ensure that a small amount of
#'   white space is added to the right of your chart.
#' @param ... arguments passed to scale_y_continuous or scale_x_continuous
#' @examples
#'
#' # Here's a basic chart in the andy style:
#' library(ggplot2)
#'
#' p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
#'     geom_point() +
#'     andy_style(
#' p
#'
#' # In the example above, the top label on the y-axis is hanging off the top.
#' # To fix:
#'
#' p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
#'      geom_point() +
#'      andy_y_continuous() +
#'      andy_style()
#'
#' p
#'
#' # Now the top of the chart looks fine, but the bottom has two points
#' # (at the lower right) that are partially obscured.
#' # We could fix this by doing:
#'
#' p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
#'      geom_point() +
#'      andy_y_continuous(expand_bottom = 0.015) +
#'      andy_style()
#'
#' p
#'
#' # Alternatively, set the limits of the chart (in this example we'll set
#' # the lower limit to 0, but you could use some other value
#' # like 10 in this case).Note that by setting the second value of limits
#' # to NA, we're telling ggplot2 to calculate theupper limit as usual based
#' # on the data. All the usual arguments of `scale_y_continuous()`
#' # (limits, breaks, labels, etc.) can be used.
#'
#' p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
#'      geom_point() +
#'      andy_y_continuous(limits = c(0, NA)) +
#'      andy_style()
#'
#' p
#'
#' @name andy_axes
#' @aliases NULL
NULL

#' @rdname andy_axes
#' @export

andy_y_continuous <- function(expand_bottom = 0, expand_top = 0.15, ...) {
  scale_y_continuous(expand = ggplot2::expansion(mult = c(expand_bottom,
                                                          expand_top)),
                     ...)
}


#' @rdname andy_axes
#' @export

scale_y_continuous_andy <- function(expand_bottom = 0,
                                    expand_top = 0.15,
                                    ...) {
  
  andy_y_continuous(expand_bottom = expand_bottom,
                    expand_top = expand_top,
                    ...)
}

#' @rdname andy_axes
#' @importFrom ggplot2 scale_y_continuous expand_scale
#' @export

andy_x_continuous <- function(expand_left = 0,
                              expand_right = 0.07,
                              ...) {
  
  scale_x_continuous(expand = ggplot2::expansion(mult = c(expand_left,
                                                          expand_right)),
                     ...)
  
}

#' @rdname andy_axes
#' @export

scale_x_continuous_andy <- function(expand_left = 0,
                                    expand_right = 0.07,
                                    ...) {
  
  andy_x_continuous(expand_left = expand_left,
                    expand_right = expand_right,
                    ...)
}
