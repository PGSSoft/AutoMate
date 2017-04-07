.PHONY: docs check check-podspec check-carthage

# Create documentation
docs:
	jazzy -c
	rsync -ahvL --delete "assets" "docs"
	rm -r build

# Check CocoaPod
check-podspec:
	pod lib lint --verbose

# Check Carthage
check-carthage:
	carthage build --no-skip-current

# Check CocoaPod and Carthage
check: check-podspec check-carthage
