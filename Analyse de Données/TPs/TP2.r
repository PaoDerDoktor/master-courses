# TP 2 - 12/01/2021 - Justine MARTIN [21909920] & Benjamin CASTEL [21700197]
# EXERCICE 1

    # Question 1
a <- matrix(
    c(1, -3, 3,
      3, -5, 3,
      6, -6, 4),
    nrow = 3
)

p <- matrix(
    c(1,  1, 1,
      1,  0, 1,
      0, -1, 2),
    nrow = 3
)

    # Question 2
h <- scale(a, center = TRUE, scale = TRUE)
g <- scale(a, center = TRUE, scale = FALSE)

    # Question 3
p_det <- det(p)
    # det(P) != 0 => P est inversible

    # Question 4
p_inv <- solve(p)

    # Question 5
d <- p_inv %*% a
d <- d %*% p

# EXERCICE 2

    # Question 1
a <- matrix(
    c(6, 3,
      1, 4),
    nrow = 2
)

a_eigen <- eigen(a)

    # Question 2
a <- matrix(
    c(-1, -2,
       1,  1),
    nrow = 2
)

b <- matrix(
    c( 1,  2, # nolint
      -1, -1),
    nrow = 2
)

d <- matrix(
    c(-5, 0,
       0, 2),
    nrow = 2
)

        # a.
ab <- a %*% b
c_m  <- a %*% d %*% b

        # b.
c_eigen <- eigen(c_m)

# Exercice 3
base <- read.csv("data/base.csv", sep = ";", dec = ",")

    # Question 1
library("lubridate")

    # Question 2
base$date <- ymd(base$date)

    # Question 3
base_year <- year(base$date)

    # Question 4
each_year <- levels(factor(base_year))
print(each_year)

# TODO : Continuer le TP