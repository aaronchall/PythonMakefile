CFLAGS = -Wall
LINT = splint

.PHONY: all
all: pycoverage pylint

.PHONY: pycoverage
pycoverage: pycov2 pycov3

.PHONY: pycov2
pycov2:
	python -m coverage run -m unittest discover
	python -m coverage report

.PHONY: pycov3
pycov3:
	python3 -m coverage run -m unittest discover
	python3 -m coverage report

.PHONY: pylint
pylint:
	python -m flake8 .

.PHONY: publish
publish:
	python -m coverage html
	firefox htmlcov/index.html
