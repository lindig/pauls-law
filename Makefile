#
#
#

power.png paul.png: pauls-law.r pairs.csv
	./pauls-law.r

# theme(1) is part of discount, a markdown implementation

README.html: paul.png page.theme
	theme README.md

clean:
	rm -f README.html


