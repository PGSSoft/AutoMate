.PHONY: docs push_github check check-podspec check-carthage

# Create documentation
docs:
	jazzy -c
	rsync -ahvL --delete "assets" "docs"
	rm -r build

push_github:
	git push github develop
	git push github master
	git push github --tags

# Check CocoaPod
check-podspec:
	pod lib lint

# Check Carthage
check-carthage:
	carthage build --no-skip-current

# Check CocoaPod and Carthage
check: check-podspec check-carthage
