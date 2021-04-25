export PERCENT=$(pytest --cov=lib | grep TOTAL | awk '{print $NF}' | grep -Eo '[0-9]+')
printf "TOTAL_AASAAM_COVERAGE=%0.2f\n" $PERCENT
