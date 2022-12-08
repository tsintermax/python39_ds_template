# refs: https://github.com/cvpaperchallenge/Ascender

.PHONY: black-check
black-check:
	poetry run black --check src tests

.PHONY: black
black:
	poetry run black src tests

.PHONY: flake8
flake8:
	poetry run flake8 src tests

.PHONY: mypy
mypy:
	poetry run mypy src

.PHONY: test
test:
	poetry run pytest tests -sv --cov=src

.PHONY: unittest
test:
	poetry run pytest tests/unittest -sv --cov=src

.PHONY: e2e-test
test:
	poetry run pytest tests/e2e -sv --cov=src

.PHONY: format
format:
	$(MAKE) black

.PHONY: lint
lint:
	$(MAKE) black-check
	$(MAKE) flake8
	$(MAKE) mypy

.PHONY: test-all
test-all:
	$(MAKE) black
	$(MAKE) flake8
	$(MAKE) mypy
	$(MAKE) test

.PHONY: install-pre-commit
install-pre-commit:
	poetry run pre-commit install
