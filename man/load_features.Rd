% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_features.R
\name{load_features}
\alias{load_features}
\title{Load features}
\usage{
load_features(file = NA)
}
\arguments{
\item{file}{The file containing the features.}
}
\description{
Used to load previously saved features created during \link[featuretoolsR]{dfs}.
}
\examples{
\donttest{
library(magrittr)

# Create mock datasets
set_1 <- data.frame(key = 1:100, value = sample(letters, 100, TRUE), stringsAsFactors = TRUE)
set_2 <- data.frame(key = 1:100, value = sample(LETTERS, 100, TRUE), stringsAsFactors = TRUE)
# Common variable: `key`

# Use dfs to create features
dir <- tempdir()
as_entityset(set_1, index = "key", entity_id = "set_1", id = "demo") \%>\%
  add_entity(entity_id = "set_2", df = set_2, index = "key") \%>\%
  add_relationship(
    parent_set = "set_1",
    child_set = "set_2",
    parent_idx = "key",
    child_idx = "key"
  ) \%>\%
  dfs(target_entity = "set_1", trans_primitives = c("and")) \%>\%
  extract_features() \%>\%
  save_features(filename = "some.features", path = dir)

# Load saves features
features <- load_features(file.path(dir, "some.features"))
}
}
