# find-manual-apa-citations

A pandoc workflow to find manual APA citations based on a supplied `.bib` file. 

# Rationale

Some of our submissions contain hand-written citations. Since manual replacement 
with actual citation objects is error-prone, time-intensive and demotivating work
for authors and editors alike, we wrote a pandoc filter to automatically catch the
manually typed citations.

We expect structured data in terms of a bibliography file and a submission that adheres
to the *Publication Manual of the APA* (7th ed.). The output is a Markdown, LaTeX or HTML file with
active citations (either using bibLaTeX or citeproc).

# Method
We parse the input bibliography and generate the citation patterns we would expect given
APA7. We then parse, very carefully, the submission and replace manually typed occurrences
of the expected citation strings with active citations to the citation keys stored in the
bibliography database.

# Procedure
## HTML
Using the `Makefile`, generate a HTML file by calling
```
make html input-file=submission.docx --bibliography=refs.bib
```

This will output a new file, `submission.docx.html`.

## LaTeX/PDF
Using the `Makefile`, generate a PDF by calling
```
make pdf input-file=submission.docx --bibliography=refs.bib
```

This will generate a new file, `submission.docx.pdf` 
(and produce a lot of console output).

If you want to clean all auxiliary LaTeX files, call:
```
make clean
```

# Functions not yet implemented
 - Multiple citations by same author (e.g., Author (2020; 2022))
 - Disambiguation of ambiguous multi-author works (see APA7, Section 8.18)
 - Works with same author and same date (e.g., Author 2020a; 2020b). 
   This will probably *not* be implemented as we just can't be sure that the author
   of the submission will order the a, b, ... order in the exact way as required by 
   the APA (rules like these can be tricky to follow; one reason why one really shouldn't
   type references manually...)
