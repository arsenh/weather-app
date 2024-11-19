APP_NAME := weather-app
BUILD_DIR := build
SOURCES := ./cmd
GO_FILES := $(shell find . -name '*.go')


# Default Target
.PHONY: all
all: build

# Build Target
.PHONY: build
build: $(BUILD_DIR)/$(APP_NAME)

$(BUILD_DIR)/$(APP_NAME): $(GO_FILES)
	@echo "Building $(APP_NAME)..."
	@mkdir -p $(BUILD_DIR)
	@go build -o $(BUILD_DIR)/$(APP_NAME) $(SOURCES)


# Clean Target
.PHONY: clean
clean:
	@echo "Cleaning up..."
	@rm -rf $(BUILD_DIR)


# Run Target
.PHONY: run
run: build
	@echo "Running $(APP_NAME)..."
	@$(BUILD_DIR)/$(APP_NAME)


# Test Target
.PHONY: test
test:
	@echo "Running tests..."
	@go test ./...


# Lint Target
.PHONY: lint
lint:
	@echo "Running linter..."
	@golangci-lint run

# Help Target
.PHONY: help
help:
	@echo "Makefile for $(APP_NAME)"
	@echo "Available targets:"
	@echo "  build    - Build the application"
	@echo "  clean    - Clean up build artifacts"
	@echo "  run      - Build and run the application"
	@echo "  test     - Run tests"
	@echo "  lint     - Run linter"
