# Common provider
provider = send(danger.scm_provider)

# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
declared_trivial = provider.pr_title.include? "#trivial"

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if provider.pr_title.include? "[WIP]"

# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 500

# Run Swiftlint
swiftlint.lint_files

# Run build and test validation after build
results_path = "output/result.json"
if File.exist?(results_path)
  # Run xcodebuild
  xcodebuild.json_file = results_path
  xcodebuild.parse_warnings
  xcodebuild.parse_errors
  xcodebuild.parse_tests
  xcodebuild.perfect_build

  # Run xcode_summary
  xcode_summary.report results_path
end
