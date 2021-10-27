# Matlab-Utils
Some useful simple utilites for Matlab to use without thinking

* barLabelled draw bar diagram and added labels to bars.
* brokenStick is slightly modified copy of John L. Weatherwax function to define number of informative principal components.
* countOfItems calculates the number of occurrences of each unique value of elements in array arr into arr.
* divideClassRand splits data set with number of elements equal N = length(labels) into three set training with about trainRatio * N elements, validationset with about valRatio * N elements, and test set with remainder of elements. Records of each class are split separately. This means that proportions of all classes are (almost) the same in all three sets.
* draw3D serves to draw 3D data with specified set of classes (labels) of points. It is possibe to draw the part of classes only.
* prop_test implements a simple Chi-square test to compare two proportions. It is a 2 sided test with alpha=0.05. Needs chi2cdf from the Statistics toolbox. Inspired by prop.test() in "R" but much more basic. 
saveFigures is simple function which save figure in file format defined by file extension. tested for jpeg, png, eps, pdf. Really nothing very specific but simple reduce number of work.
