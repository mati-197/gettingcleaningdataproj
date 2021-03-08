---
title: "CodeBook"
author: "Mati-197"
date: "07-03-2021"
output: html_document
---


## run_analysis.R CodeBook

This is a codebook explaining the different file names, variables and transformations.

---

File Names
---
- data_path: parent folder containing the data files
- train_data: training data
- test_data: test data
- train_label: train label data
- test_label: test label data
- features: features names
- activity_label: activity text labels
- train_subject: subject numbers for training observations
- test_subject: subject numbers for test observations

Variables
---
- featurestable: table containing features data
- traintable: table containing training data
- testtable: table containing test data
- total_data: table containing both training and test data
- trainlbltable: table containing train labels data
- testlbltable: table containing test labels data
- total_labels: table containing both training and test labels data
- trainsubtable: table containing train subject data
- testsubtable: table containing test subject data
- total_subjects: table containing both training and test subjects data
- activity_labels: tabel mapping between activity code and text label
- col_nums: a vector containing the column numbers to be used
- col_names: a character vector containing the column names to be used
- final_data: table containing the total set of observations combined with activity labels and subject numbers
- averages: table containing the final result grouped by activity and subject with average value of all features for each group

Transformations
---
total_data is filtered considering only the columns with the mean or standard deviation. In order to do so, the function grep was used
final_data is a table with columns added. It was done with column bind of observations, activity labels and subject numbers
The names of columns in final_data are replaced with the ones in col_names
averages was done using dplyr functions groupby and summarize_each

