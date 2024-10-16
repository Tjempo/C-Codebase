# C-Codebase
Default package for starting a C-project.
Contains a makefile that compiles all the files in the ```src``` folder.
All the output files (.o | .exe | etc.) get stored in the output folder. 

## Prerequisites
### Linux: 
- Make sure the gcc compiler is installed. 
- Install Makefile support

### Windows:
- Install supported gcc compiler like MinGW. 
- Install Makefile support

### MacOS
No support for MacOS (You may try adding support)

## How to run
- Clone the repository:
  ```bash
  git clone https://github.com/Tjempo/C-Codebase.git
  ```
- Build the repository
    ```bash
    make build
    ```
- Run the program:
    ```bash
    make run.
    ```

### Compiling
The project comes with following compiler flags enabled:
- -Wall
- -Wextra
- -Wconversion
- -pedantic
- Using the [C99 code standard](https://en.wikipedia.org/wiki/C99)

## Adding Libraries:

If you want to add your own libraries follow these steps:

- Open the Makefile
- At the top of the file locate the ```CLIBS``` line: 
    ```Makefile
    CLIBS = 
    ```
- Add your libraries: (for example the [Tesseract OCR library](https://github.com/tesseract-ocr/tesseract))
    ```Makefile
    CLIBS = -ltesseract
    ```
    of course you'll need to have the library compiled or installed for it to work.


- Save and exit the file.

- Rebuild the project with 
    ```bash
    make clean && make build
    ```
- Rerun the program.



## Using and Editing

You are free to use / download / modify this project. If you want to contribute please create a pull request.