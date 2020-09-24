-README FILE-----------------------------------------------------------------------------------------------------------------------------------------------
Introduction to Computer Vision (ICV) - Queen Mary University of London
Mini Project: Implementing a Local Binary Pattern (LBP) Classifier from scratch
Author: Harrishan Sureshkumar

For this project I have organized my code in the form of MatLab code sections.
The code can be found in the file main.m

I have made a total of 12 matlab functions which are used in the file main.m.
Please make sure all the functions used are in the same directory as main.m before
running the code. All code and functions have been annotated and documented appropriately 
in the code after the "%" symbol.


Instructions:
Each code section can be run by clicking it and pressing CTRL+Enter once the code 
section is highlighted in yellow.Each Code section is named and these names will be referred to 
when referencing each code section. Each name is written at the start of each code 
section after the the "%%" symbol. 
Please be aware that all code sections must be run in order starting from top to bottom for code 
to be run properly. Note: Dataset A provided on the QMplus website for this module must be present in the
/code folder for the code to work.

Run the cell named "Clear Workspace" if the workspace is not already clear.

Task:
a) -Run the code section named "Task a Split Image into LBP windows and get normalized histograms" to
     get windows, LBP windows and histograms for the image.
	-Change variable windowSize to chosen window in annotation to test different window sizes.

     -Run the code section named "Task a Show each window and its histogram side by side per second" to
      see each window, each lbp window and its histogram.
     -Run the code section named "Task a Show normalised histogram for chosen window at hand" after setting 
      'chosenWindow' variable to see the window at hand.

b) -Run the code section named "Task b Global descriptor by combining local descriptors" to see global 
     descriptor(global histogram) - Concatonated normalised histograms for each LBP window

c) -Run the code section named "Task c Classifier 1 - Train 2 Classify 4 (Setting1)" to test the classifier
     which uses 2 train images to classify 4 test images.
		-Uses ICV_ClassifierNN.m(Nearest Neighbour Approach)
    -Run the code section named "Task c Classifier 2 - Train 4 Classify 2 (Setting2)" to test the classifier 
     which uses 4 train images to classify 2 test images.
		-Uses ICV_ClassifierNN.m(Nearest Neighbour Approach)

    -Test and train images can be swapped around for testing purposes. 
     Follow annotation in the code to comply with the structure of the code.


-THE END----------------------------------------------------------------------------------------------------------------------------------------------------