doc: instructions.html README

instructions.html: instructions.pod
	pod2html --infile=instructions.pod --outfile=instructions.html --title='Adzuna Coding Task - Description' --htmlroot=.

README:
	pod2readme instructions.pod README

clean:
	rm -f pod2htmd.tmp *html README
