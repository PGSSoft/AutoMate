.PHONY: docs check check-podspec check-carthage

# Create documentation
docs:
	jazzy
	rsync -ahvL --delete "assets" "docs"

# Check CocoaPod
check-podspec:
	pod lib lint --verbose

# Check Carthage
check-carthage:
	carthage build --no-skip-current

# Check CocoaPod and Carthage
check: check-podspec check-carthage