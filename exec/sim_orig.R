# Simulate data for software development features

# Simulate the 4 components of a feature where dev and pr are especially long right tailed, and build and release
# times are somewhat less long tailed.
#
# It seems reasonable that in an agile workflow, features should not often take longer than 2 weeks, and should
# average around a few days. Pull requests should likely be proportional to the length of time of development. Build
# and release should also be right skewed, but not to the same degree that dev and PRs are. In general, a build should
# take about the same time for each PR, while a release should not be highly dependent on the code it includes.

# NOTE: The lines below as is are quite unrealistic. It should be the case that dev time is correlated to pr time,
# that build and release times are not correlated to either time.

# We use the log-normal distribution for simulating these feature components because they are all positive real values.
# The most important feature we're trying to recreate is the long right skew, which occurs in software features when
# some features linger for long periods of time due to a number of potential reasons including complexity, bugs, and
# staleness.

# TODO: Get actual values from github to check your assumptions

# Set the number of features
n <- 200

# Generate dev time
dev_mean = 0  # Expected value of the random variable's natural logarithm
dev_sd = 1  # Standard deviation of the random variable natural logarithm
.dev <- function() {
  shape <- rgen(n, rlnorm, meanlog = dev_mean, sdlog = dev_sd)()
  # add a bit of padding
  shape <- shape + rnorm(n, mean = exp(1), 0.25)
  # convert to days
  shape * 24
}

# Generate pr time
pr_mean = hours(2)
pr_sd = hours(2)
.pr <- rgen(n, rlnorm, meanlog = pr_mean, sdlog = pr_sd)

# Generate build time
build_mean = hours(0.25)
build_sd = hours(0.1)
.build <- rgen(n, rlnorm, meanlog = build_mean, sdlog = build_sd)

# Generate release time
release_mean = hours(2, "days")
release_sd = hours(1)
.release <- rgen(n, rlnorm, meanlog = release_mean, sdlog = release_sd)

# Build feature
features <- build_feature_lead_time(.dev(), .pr(), .build(), .release())

# Plot to ensure it looks reasonable
plot_feature_distribution(features)
