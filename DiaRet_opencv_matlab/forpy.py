import cv2
import imutils
import numpy as np
from matplotlib import pyplot as plt

while(1):
    image=cv2.imread("eye.jpg")
    grey=cv2.cvtColor(image,cv2.COLOR_BGR2GRAY)
    hsv=cv2.cvtColor(image,cv2.COLOR_BGR2HSV)
    #image = imutils.resize(image, width=1200)

    #kernel = np.ones((5,5),200, np.uint8)
    #th1 = cv2.dilate(th1,kernel,iterations = 5)
    ret,thresh = cv2.threshold(grey,127,255,0)

    #contours,hierarchy = cv2.findContours(thresh, 1, 2)
    _, contours, _= cv2.findContours(thresh, 1, 2)
   	
    for  c in enumerate(contours):
        area = cv2.contourArea(c)
        if area < cv2.contourArea(contours[0]):
        	M = cv2.moments(area)
    		x,y,w,h = cv2.boundingRect(area)
    		cv2.rectangle(image,(x,y),(x+w+10,y+h+10),(0,0,0),10)
    #first sort the array by area
    

#find the nth largest contour [n-1][1], in this case 2
    

    		
    cv2.namedWindow("image1", cv2.WINDOW_NORMAL)

    cv2.imshow("image1",image)
    
    
    k = cv2.waitKey(5) & 0xFF
    if k == 27:
        break
cv2.destroyAllWindows()