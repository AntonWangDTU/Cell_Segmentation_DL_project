#!/bin/bash



# Create the main project directory
mkdir -p {data/{raw,processed,annotations},notebooks,src,tests}

# Create essential files
touch {requirements.txt,README.md,LICENSE,.gitignore,config.yaml}

# Create source code files
touch src/{__init__.py,data_preprocessing.py,model.py,train.py,evaluate.py,utils.py}

# Create test files
touch tests/{__init__.py,test_data_preprocessing.py,test_model.py}

echo "Project structure for  created successfully!"