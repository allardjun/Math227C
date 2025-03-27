# Setting Up R in Jupyter Notebooks

This guide provides instructions for setting up and working with R in Jupyter notebooks for our graduate course. You have several options for your working environment, and this document will walk you through each approach step-by-step.

## Table of Contents
- [Option 1: Local Installation with VS Code](#option-1-local-installation-with-vs-code)
- [Option 2: Local Installation with Anaconda](#option-2-local-installation-with-anaconda)
- [Option 3: Using Google Colab](#option-3-using-google-colab)
- [Option 4: Using RStudio Cloud (Posit Cloud)](#option-4-using-rstudio-cloud-posit-cloud)
- [Repository Management](#repository-management)
- [Data Management](#data-management)

## Option 1: Local Installation with VS Code

VS Code provides an excellent environment for working with Jupyter notebooks and R.

### Prerequisites
1. [Install R](https://cran.r-project.org/) (latest version)
2. [Install VS Code](https://code.visualstudio.com/)

### Setup Steps

1. **Install VS Code Extensions**
   - Open VS Code and navigate to the Extensions view (Ctrl+Shift+X or Cmd+Shift+X)
   - Search for and install:
     - "Jupyter" by Microsoft
     - "R" by REditorSupport
     - "R Debugger" by RDebugger

2. **Install Required R Packages**
   - Open R console or RStudio and install these packages:
   ```r
   install.packages(c("IRkernel", "tidyverse", "devtools"))
   ```
   - Register the R kernel with Jupyter:
   ```r
   IRkernel::installspec()
   ```

3. **Fork and Clone the Course Repository**
   - Go to the course GitHub repository at `github.com/allardjun/Math227C`
   - Click the "Fork" button in the top right to create your own copy
   - In VS Code, press Ctrl+Shift+P (or Cmd+Shift+P on Mac) and type "Git: Clone"
   - Enter the URL of your forked repository and choose a local folder

4. **Open Notebooks in VS Code**
   - Navigate to your cloned repository folder
   - Open any `.ipynb` file
   - When prompted, select the R kernel
   - You can now run and edit the notebook cells

## Option 2: UCI HPC3 BioJHub

UCI provides a high-performance computing facility with a Jupyter notebook server called BioJHub

* Instructions `https://rcic.uci.edu/slurm/examples.html#jupyterhub-portal`
* Access `https://hpc3.rcic.uci.edu/biojhub4/hub/login`


## Option 3: Local Installation with Anaconda

Anaconda provides a comprehensive data science platform with Jupyter built-in

### Setup Steps

1. **Install Anaconda**
   - Download and install [Anaconda Individual Edition](https://www.anaconda.com/products/individual)
   - During installation, ensure "Add Anaconda to my PATH" is checked (Windows)

2. **Create an R Environment**
   - Open Anaconda Navigator
   - Go to "Environments" tab
   - Click "Create" and name your environment (e.g., "r_math227c")
   - Select Python 3.9+ as the base
   - Click "Create"

3. **Install R and R Kernel**
   - With your new environment selected, switch to "All" packages view
   - Search for and install:
     - "r-base"
     - "r-essentials"
     - "r-irkernel"
     - "r-tidyverse"

4. **Launch Jupyter Notebook**
   - Switch to the "Home" tab
   - Select your R environment in the dropdown
   - Launch Jupyter Notebook

5. **Fork and Clone the Repository**
   - Go to the course GitHub repository at `[REPO URL]`
   - Click the "Fork" button
   - Clone your fork locally:
   ```bash
   git clone https://github.com/[YOUR-USERNAME]/[REPO-NAME].git
   cd [REPO-NAME]
   ```

6. **Navigate and Open Notebooks**
   - In Jupyter, navigate to your cloned repository folder
   - Open any `.ipynb` file
   - Select the R kernel when creating new notebooks

## Option 4: Using Google Colab

Google Colab provides a free, cloud-based Jupyter notebook environment with GPU support.

### Setup Steps

1. **Sign in to Google Account**
   - Visit [Google Colab](https://colab.research.google.com/)
   - Sign in with your Google account

2. **Fork the Repository**
   - Go to the course GitHub repository at `github.com/allardjun/Math227C`
   - Click the "Fork" button to create your own copy

3. **Access Notebooks in Colab**
   - In Colab, click File > Open Notebook
   - Select the "GitHub" tab
   - Enter your GitHub username and find your forked repository
   - Select the notebook you want to open

4. **Set Up R Runtime**
   - After opening a notebook, change the runtime:
     - Click Runtime > Change runtime type
     - Select "R" from the dropdown menu
     - Click "Save"

5. **Working with Notebooks**
   - Install additional R packages as needed using:
   ```r
   install.packages("package_name")
   ```
   - Save your work to Google Drive using File > Save a copy in Drive

## Repository Management

### Keeping Your Fork Updated

1. **Add the Original Repository as "Upstream"**
   ```bash
   git remote add upstream https://github.com/allardjun/Math227C.git
   ```

2. **Fetch and Merge Updates**
   ```bash
   git fetch upstream
   git checkout main
   git merge upstream/main
   ```

3. **Push Updates to Your Fork**
   ```bash
   git push origin main
   ```

#

## Data Management

### Local Data Storage

- Store data in the `/data` directory of the repository
- Use relative paths in your notebooks: `read.csv("../data/filename.csv")`
- For large files, consider using `.gitignore` to exclude them from commits

### Google Drive Integration

For Colab users, you can mount your Google Drive:

```r
# Install googledrive package if needed
install.packages("googledrive")

# Mount Google Drive
library(googledrive)
drive_auth()

# List files
drive_find(n_max = 10)

# Read a file directly
my_data <- read.csv(drive_get("my_dataset.csv")$id)
```


## Links


- [Git and GitHub Learning Resources](https://docs.github.com/en/get-started/quickstart/git-and-github-learning-resources)

