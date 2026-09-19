.PHONY: install test build run docker-build docker-up

install:
	@echo "No external dependencies required for this static HTML/CSS/JS project."
	@test -f index.html
	@test -d css
	@test -d js
	@echo "Installation check passed."

test:
	@echo "Running project tests..."
	@bash scripts/test.sh
	@echo "All tests passed."

build:
	@echo "Building static project..."
	@mkdir -p build
	@cp -r *.html css js images build/
	@echo "Build completed successfully."

run:
	@echo "Open index.html in a browser to run the application."

docker-build:
	docker build -t releaf-book .

docker-up:
	docker compose up --build