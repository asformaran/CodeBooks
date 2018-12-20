Book - [title], number of pages, proglang
Pages - !create a path with booktitle as foldername, try except for text, video, image, code files (depending on proglang)

Working title - PIPA (programmable, interactive, presentation app)

description: a programmable presentation app that caters to all ages and a multitude of use cases. Pipa combines programming with presentation tools to give the audience a customizable and interactable experience. It resembles Jupyter notebooks, a very popular tool used by data scientists, which combines documentation and code.

functions: 
1) add text, video, or audio using drag n drop spaces. Store them in S3.
2) able to add an editor console (integrate with cloud9). Editor can be used to program the contents of the presentation.
3) flexibility to choose your programming language.
4) able to save your file, and open it for later use.

Phase 1- web app
publish it as a web app that can be accessed by anyone.

Phase 2- containerization (portability)
use containers (such as docker) to encapsulate your book and compiler, so that you can still present it without needing internet connection.

use cases
for children - a tool to teach them programming early on. interactive storybooks. brain exercises

for young - a customizable story that engages readers to make decisions that affect future scenarios. learning advanced programming. presentation tool for their projects. teachers can use this app to give out programming exams and exercises.

for business - a presentation tool for meetings, for things such as pitching a new product or showcasing a new feature or providing a customizable report. scenario where software dev team can check out new code anytime they want and fiddle around it. bug hunting that can be done by users.

for elderly - a fun and interactive reader like kindle, but with more. can be a new hobby of designing their own storybooks.