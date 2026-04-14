#!/bin/bash

set -eo pipefail

templ generate
git diff HEAD --exit-code
