SHELL=/bin/bash

hadolint:
	./scripts/run_hadolint.sh

pylint:
	./scripts/pylint.sh

build_python:
	./python/build.sh

build_r:
	./R/build.sh

tests:
	./tests/run.sh
