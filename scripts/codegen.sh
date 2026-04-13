#!/bin/bash

set -eo pipefail

templ generate
git diff HEAD~1 --exit-code
