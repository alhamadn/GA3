# GA3 answers - Mohammed Alhamadn

------------------------------------------------------------------------

## Part A: Your README, data, and Git repo

### 1: Create subdirs and copy files

<!-- No command/output needed -- you can make dirs however you want, and the copy commands are provided. -->

### 2: Initialize a Git repository, and commit the README and `.gitignore`

<!-- No command/output needed here -- we check the repo directly. -->

### 3: Commit throughout the assignment

<!-- No command/output needed here -- we check your commit history directly. -->

------------------------------------------------------------------------

## Part B: Basic shell scripts

### 4: Predict the output of `echo.sh`

<!-- No need to paste the script: we'll look at scripts/echo.sh directly. -->

*Answer* (prediction and reasoning for `bash scripts/echo.sh Oct07 Oct08`): I think it will print Oct07 and Oct08 only because we assigned these two to the numbers

*Answer* (prediction and reasoning for `bash scripts/echo.sh Oct07 Oct08 Oct09 Oct10`): i think it will print oct7-oct9 but ignore oct10 because its not assigned

*Answer* (prediction and reasoning for `bash scripts/echo.sh Oct07 Oct08 "Oct09 Oct10"`): it will print oct07 for 1, oct09 for 2, and both Oct9-10 for 3.

*Answer* (prediction and reasoning for `bash scripts/echo.sh results/fastqc/*.html`): i am unsure, possibly run files that has names 1-2-3?

### 5: Run `echo.sh` and compare with your predictions

``` bash
bash scripts/echo.sh Oct07 Oct08
```

The output of the command was:

```         
(base) [alhamadn@p0220 GA3]$ bash scripts/echo.sh Oct07 Oct08
Oct07
Oct08
scripts/echo.sh: line 6: $3: unbound variable
```

``` bash
bash scripts/echo.sh Oct07 Oct08 Oct09 Oct10
```

The output of the command was:

```         
(base) [alhamadn@p0220 GA3]$ bash scripts/echo.sh Oct07 Oct08 Oct09 Oct10
Oct07
Oct08
Oct09
Finished
```

``` bash
bash scripts/echo.sh Oct07 Oct08 "Oct09 Oct10"
```

The output of the command was:

```         
(base) [alhamadn@p0220 GA3]$ bash scripts/echo.sh Oct07 Oct08 "Oct09 Oct10"
Oct07
Oct08
Oct09 Oct10
Finished
```

``` bash
bash scripts/echo.sh results/fastqc/*.html
```

The output of the command was:

```         
(base) [alhamadn@p0220 GA3]$ bash scripts/echo.sh results/fastqc/*.html
results/fastqc/S63_R1_fastqc.html
results/fastqc/S63_R2_fastqc.html
results/fastqc/S64_R1_fastqc.html
Finished
```

*Answer*: Which output (if any) differed from your prediction, and why?

My first three predictions were correct. However, the fourth prediction was wrong for me. I forgot that assigning variables will be in order, so it went to the file and assigned the files to the variables that end with html in order. Which started with S63 forward and reverse, and only forward for 64.

### 6: Write the `printline.sh` script

<!-- No need to paste the script: we'll look at scripts/printline.sh directly. -->

### 7: Test `printline.sh` twice

Test 1:

``` bash
# Your command: to print line 6 of metadata 
bash scripts/printline.sh data/metadata.tsv 6
```

The output of the command was:

```         
S78     10dpi   control
```

Test 2 (with redirection), and checking the contents of the output file:

``` bash
# Your command: to print line 12 in metadata and like we did in first few weeks (cant remember which class), is to use `>` to echo results there 
bash scripts/printline.sh data/metadata.tsv 12 > results/line12.txt 
```

The output of the command that checks the file contents was:

```         
No output happened in terminal since we redirected the results to that file. However I opened that file and saw this results:

S85 10dpi   relictum
```

------------------------------------------------------------------------

## Part C: A script to run MultiQC

### 8: Get a MultiQC container link

*Answer*: The container link (URI) is: [oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20](oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20)

### 9: MultiQC's help info, and the MultiQC command

Code to run `multiqc --help` with the container:

``` bash
# Your command: Like we did in class w6b, we follow the steps to get a link container for the latest multiqc, which we found its v1.35
apptainer exec oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20 \multiqc --help
```

<!-- You don't need to paste the MultiQC help output -->

The MultiQC command to run MultiQC on `results/fastqc` with output in `results/multiqc`:

``` bash
# Your command: Similar to the class exmple, here the tool stating we can do multiqc with option and analysis directory. Main options like --outdir or short -o to create report in the specified output dir as text. 
apptainer exec oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20 \multiqc results/fastqc -o results/multiqc
```

### 10: Write the `multiqc.sh` script

<!-- No need to paste the script: we'll look at scripts/multiqc.sh directly. -->

### 11: Run `multiqc.sh`

Code to run the script:

``` bash
# Your command: like we did before 
bash scripts/multiqc.sh
```

<!-- You don't need to paste the MultiQC logging output -->

*Answer*: Number of FastQC reports MultiQC found: 44

*Answer*: Does that match what you expected? Why/why not? I am unsure if I had expectations before this point. However, I did ran it by accident in Q9 and it matched that exact number, of 44 reports. So in a bias way I would say yes!

### 12: Make `multiqc.sh` accept arguments, and rerun it

<!-- No need to paste the script: we'll look at scripts/multiqc.sh and its Git history directly. -->

Code to rerun the script:

``` bash
# Your command: like we did before, the order matter so first input will be the results/gastqc and output results/multiqc
bash scripts/multiqc.sh results/fastqc results/multiqc
```

<!-- No need to paste any output -->

### 13: Differences between the two MultiQC runs

*Answer*:

I am not seeing difference in the overall output. It is basically the same. I loved the option were the code was more open by using variables "\$1" because I can re-use the code for many other projects without the need to fix it. But in regards for the names, I noticed there is added numbers to the reports. I think since we did it before, it done it again with a new name to avoid over writing the older draft.

------------------------------------------------------------------------

## Part D: Pandoc to render Markdown

### 14: The structure of the Pandoc command

*Answer* (options and arguments, and what each does): I think the first to to call for the tool `panddoc` and then, the first is argument is the option to output what we wanted or what kind of version ..so we are saying in `-o` `README.pdf` so i think that what the output or needed file is. On the other hand, the last argument is the from argument that point out from which file, or simply it is the input `README.md`

*Answer* (how does Pandoc know which output format to produce?): We can specify I think based on the argument of what comes after the dot in the first argument `-o` `README.extension`. So I think there is a help button to list this and explain it too.

### 15: Render your README to PDF and HTML

``` bash
pandoc -o README.pdf README.md
```

-   Command to render to HTML:

``` bash
# Your command: 
pandoc -o README.html README.md
```

### 16: Should the rendered files be committed?

*Answer*: Should the rendered files be committed to your Git repo? Why/why not?

I think based on the question you stated in our GA3, we do not commit them because we want to share pdf and html to collaborators who do not have markdown. But in github, we are trying to make our directory reproducible, and lots of times we need to update `README.me` anyway. Meaning the pdf version wont be updated and need to be taken care of. So to me I think i will want my git page to be clean and simple. No pdf of html unless someone asked for it.

### 17: Install the PDF Viewer extension and view the PDF

*Answer*: One observation about the rendered PDF file: I really like how the pdf file loos like now. It colored the script part, and the notes are in green like how i am used to them in R. The sections are separated and the headers still carried the same format of size to the pdf file. Overall, it is presented well, in order and numbered pages, which would be easy to follow in a pdf format.

## Part E: Publish your repo on GitHub

### 18: Create a GitHub repository

<!-- No command/output needed here -- we check your GitHub repo directly. -->

### 19: Connect your local repo to GitHub, and push

<!-- No command/output needed here -- we check your GitHub repo directly. -->

### 20: Create an Issue to tag the instructors

<!-- No command/output needed here -- we check your GitHub repo directly. -->

------------------------------------------------------------------------

## Bonus

### 21: Explore the MultiQC report

*Answer* (one insight you gained):

*Answer* (one thing you're confused about):

### 22: Pandoc versions

``` bash
# Your command:
```

The output of the command(s) was:

```         
```

*Answer*: Is the Pandoc version available by default the most recent one?

*Answer*: Which Pandoc version are you using after loading the module?