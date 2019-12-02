# Simulate data for software development features

# Simulate the 4 components of a feature where dev and pr are especially long right tailed, and build and release
# times are somewhat less long tailed.
#
# It seems reasonable that in an agile system, features should not often be taking longer than 2 weeks, and should
# average around a few days. Pull requests should likely be proportional to the length of time of development. Build
# and release should also be right skewed, but not to the same degree that dev and PRs are. In general, a build should
# take about the same time for each PR, while a release should not be highly dependent on the code it includes.

# Set the number of features
n <- 100

# Generate dev time
.rgamma_dev <- rgen(n, rgamma, shape = 2)

# Generate pr time

# Generate build time

# Generate release time

# Build feature

# Plot to ensure it looks reasonable
