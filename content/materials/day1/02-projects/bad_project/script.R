## Methos for EOF
#
# cut.eof <- function(eof, n) {
#    var <- attr(eof, "suffix")
#    value.var <- attr(eof, "value.var")
#    return(structure(lapply(as.list(eof), function(x) {
#       x[as.numeric(get(var)) %in% n]
#    }),
#    class = c("eof", "list"),
#    suffix = var,
#    value.var = value.var))
# }

# screeplot.eof <- function(eof, n = "all") {
#    var <- attr(eof, "suffix")
#    r2 <- "r2"
#    if (n[1] == "all") n <- as.numeric(unique(eof$sdev[[var]]))
#    ggplot(eof$sdev[as.numeric(get(var)) %in% seq_along(n)], aes_(as.name(var), as.name(r2))) +
#       geom_point()
# }
#
# autoplot.eof <- function(eof, n = "all") {
#    screeplot(eof, n)
# }
#
# predict.eof <- function(eof, n = NULL) {
#    ` %>% ` <- magrittr::`%>%`
#    if (!inherits(eof, "eof")) {
#       stop("eof must be an EOF object")
#    }
#
#    if(!is.null(n)) eof <- cut(eof, n)
#
#    value.var <- attr(eof, "value.var")
#    pc <- attr(eof, "suffix")
#
#    right.vars <- colnames(eof$right)[!(colnames(eof$right) %in% c(pc, value.var))]
#    right.formula <- as.formula(paste0(pc, " ~ ", paste0(right.vars, collapse = "+")))
#
#    right <- eof$right %>%
#       .[eof$sdev, on = pc] %>%
#       .[, (value.var) := get(value.var)*sd] %>%
#       metR:::.tidy2matrix(right.formula, value.var)
#
#    left.vars <- colnames(eof$left)[!(colnames(eof$left) %in% c(pc, value.var))]
#    left.formula <- as.formula(paste0(pc, " ~ ", paste0(left.vars, collapse = "+")))
#    left <- metR:::.tidy2matrix(eof$left, left.formula, value.var)
#
#    dt <- cbind(.extend.dt(left$coldims, each = nrow(right$coldims)),
#                .extend.dt(right$coldims, n = nrow(left$coldims)),
#                c(t(right$matrix)%*%left$matrix))
#    colnames(dt)[length(colnames(dt))] <- value.var
#    return(dt)
# }


as.data.table.eof <- function(x, keep.rownames = FALSE, n = NULL, ...) {
   if (!inherits(x, "eof")) {
      stop("eof must be an EOF object")
   }

   if(!is.null(n)) x <- cut(x, n)

   value.var <- attr(x, "value.var")
   pc <- attr(x, "suffix")

   right.vars <- colnames(x$right)[!(colnames(x$right) %in% c(pc, value.var))]
   left.vars <- colnames(x$left)[!(colnames(x$left) %in% c(pc, value.var))]

   data.table::setnames(x$right, value.var, "right")
   data.table::setnames(x$left, value.var, "left")

   eof <- x$right %>%
      .[x$sdev, on = pc] %>%
      .[x$left, on = pc, allow.cartesian = TRUE]

   data.table::setcolorder(eof, c(right.vars, left.vars, pc, "left", "sd", "r2", "right"))
   data.table::setattr(eof, "value.var", value.var)
   return(eof)
}

# .extend.dt <- function(dt, n = NULL, each = NULL) {
#    if (!is.null(n)) {
#       r <- as.data.table(lapply(dt, rep, n = n))
#    } else {
#       r <- as.data.table(lapply(dt, rep, each = each))
#    }
#    r
# }

# labeller <- function(...) {
#    UseMethod("labeller")
# }
#
# labeller.default <- function(...) {
#    ggplot2::labeller(...)
# }
#
# labeller.eof <- function(eof, sep = " - ") {
#    var <- attr(eof, "suffix")
#    with(eof$sdev, setNames(paste0(get(var), sep, scales::percent(r2)),
#                            get(var)))
# }

# print.eof <- function(eof) {
#    cat("right:\n")
#    print(eof$right)
#    cat("\nleft:\n")
#    print(eof$left)
#    cat("\nsdev:\n")
#    print(eof$sdev)
# }

# `[.eof` <- function(x, left, right, PC) {
#    if (!missing(PC)) {
#       x <- cut(x, PC)
#    }
#    if (!missing(left)) {
#       left <- substitute(left)
#       x$left <- x$left[eval(left), ]
#    }
#    if (!missing(right)) {
#       right <- substitute(right)
#       x$right <- x$right[eval(right), ]
#    }
#
#    x
# }

