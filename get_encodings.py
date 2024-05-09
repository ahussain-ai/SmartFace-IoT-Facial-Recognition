#! /usr/bin/python

from imutils import paths
import face_recognition
#import argparse
import pickle
import cv2
import os

print("Computing encoding")
imagePaths = list(paths.list_images("dataset"))

knownEncodings = []
knownNames = []


for (i, imagePath) in enumerate(imagePaths):
	# extract the person name from the image path
	print("Image {}/{}".format(i + 1,
		len(imagePaths)))
	name = imagePath.split(os.path.sep)[-2]


	image = cv2.imread(imagePath)
	rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)


	boxes = face_recognition.face_locations(rgb,
		model="hog")

	# compute the facial embedding for the face
	encodings = face_recognition.face_encodings(rgb, boxes)

	for encoding in encodings:

		knownEncodings.append(encoding)
		knownNames.append(name)

print("Done computing encoding")
data = {"encodings": knownEncodings, "names": knownNames}
f = open("encodings.pickle", "wb")
f.write(pickle.dumps(data))
f.close()
