#!/usr/bin/env python2.7 

"""

Script that loads the hic pickle file

"""

import sys, csv, os, pickle, cPickle

pickledFileName = str(sys.argv[1])
originalFile = pickledFileName.replace('_hiccups.pkl', '.hiccups')

originalRowNumbers = (sum(1 for line in open(originalFile)))
#originalRowNumbers=34367

#originalRowNumbers = (sum(1 for line in open(originalInputFileRowNumber)))
#print("originalRowNumbers =" + str(int(originalRowNumbers)) + "\n")
#sys.exit()

# # # # # # # # # READING THE PICKLED FILE # # # # # # # # # 


thisPointerAtPickledFileName = open(pickledFileName, "r") 

for i in range(0,originalRowNumbers):
  object = list(pickle.load(thisPointerAtPickledFileName))
  #print("i=" + str(int(i)) + "\t" + str(object))
  
  lun = len(object) # fields of each row
  for j in range(0, lun):
    sys.stdout.write(object[j].strip('"\'')+"\t")
  
  if i < originalRowNumbers:
    sys.stdout.write("\n")
    
thisPointerAtPickledFileName.close()