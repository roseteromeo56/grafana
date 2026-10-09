#!/bin/bash

# shellcheck source=./scripts/helpers/exit-if-fail.sh
source "$(dirname "$0")/helpers/exit-if-fail.sh"

export GRAFANA_TEST_DB=postgres

mapfile -t packages < <(go list ./pkg/...)

time for d in "${packages[@]}"; do
 exit_if_fail go test -tags=integration "$d"
done
