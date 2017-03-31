.PHONY: docs

# Create documentation
docs:
	jazzy
	rsync -ahvL --delete "assets" "docs"
