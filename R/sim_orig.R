# Simulate data for software development features

# Simulate the 4 components of a feature where dev and pr are especially long right tailed, and build and release
# times are somewhat less long tailed.
#
# It seems reasonable that in an agile workflow, features should not often take longer than 2 weeks, and should
# average around a few days. Pull requests should likely be proportional to the length of time of development. Build
# and release should also be right skewed, but not to the same degree that dev and PRs are. In general, a build should
# take about the same time for each PR, while a release should not be highly dependent on the code it includes.

# Set the number of features
n <- 100

# NOTE: The lines below as is are quite unrealistic. It should be the case that dev time is correlated to pr time,
# that build and release times are not correlated to either time.

# Generate dev time
.dev <- rgen(n, rgamma, shape = hours(5, "days"))

# Generate pr time
.pr <- rgen(n, rgamma, shape = hours(6))

# Generate build time
.build <- rgen(n, rgamma, shape = hours(0.5))

# Generate release time
.release <- rgen(n, rgamma, shape = hours(2, "days"))

# Build feature
features <- build_feature_lead_time(.dev(), .pr(), .build(), .release())

# Plot to ensure it looks reasonable
