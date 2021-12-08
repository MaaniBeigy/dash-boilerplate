#!/bin/bash
find . -name 'complexity.txt' -delete
radon cc lib/web/project/ -s -a >>.logs/complexity.txt
export complexity=$(grep 'Average complexity:' .logs/complexity.txt | cut -d\  -f3)
echo "complexity:" $complexity
rm -rf assets/images/complexity.svg
poetry run python3 -m pybadges --left-text="complexity" --right-color="brightgreen" --right-text=${complexity} >>assets/images/complexity.svg
