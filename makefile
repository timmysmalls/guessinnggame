SHELL = bash

readme:
	@echo "# Guessing Game" > README.md
	@echo "" >> README.md
	@echo -n "Makefile ran on " >> README.md
	date +"%D at %T" >> README.md
	@echo "" >> README.md
	@echo -n "Number of lines in guessinggame.sh: " >> README.md
	cat guessinggame.sh | wc -l >> README.md

