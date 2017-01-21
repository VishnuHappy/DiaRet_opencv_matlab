import cv2
import imutils
import numpy as np
from matplotlib import pyplot as plt

while(1):
    image=cv2.imread("eye.jpg")
    grey=cv2.cvtColor(image,cv2.COLOR_BGR2GRAY)
    hsv=cv2.cvtColor(image,cv2.COLOR_BGR2HSV)
    #image = imutils.resize(image, width=1200)
    th1=grey-164
    thresh4 = cv2.adaptiveThreshold(grey,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C,cv2.THRESH_BINARY,11,2)
    retval, th1 = cv2.threshold(th1, 100, 255, cv2.THRESH_BINARY) 

    #kernel = np.ones((5,5),200, np.uint8)
    #th1 = cv2.dilate(th1,kernel,iterations = 5)
    th4=th1

    ret,thresh = cv2.threshold(th1,127,255,0)
    #contours,hierarchy = cv2.findContours(thresh, 1, 2)
    _, contours, _= cv2.findContours(thresh, 1, 2)
    areaArray=[]
    for i, c in enumerate(contours):
        area = cv2.contourArea(c)
        areaArray.append(area)

    #first sort the array by area
    sorteddata = sorted(zip(areaArray, contours), key=lambda x: x[0], reverse=True)

#find the nth largest contour [n-1][1], in this case 2
    largest = sorteddata[1][1]

    M = cv2.moments(largest)
    x,y,w,h = cv2.boundingRect(largest)
    cv2.rectangle(image,(x,y),(x+w+70,y+h),(0,0,0),10)
    cv2.namedWindow("image1", cv2.WINDOW_NORMAL)

    cv2.imshow("image1",image)
    
    thresh5 = cv2.adaptiveThreshold(th1,255,cv2.ADAPTIVE_THRESH_MEAN_C,cv2.THRESH_BINARY,11,51)
    can = cv2.Canny(th1,100,200)
    element =cv2.getStructuringElement(cv2.MORPH_CROSS,(3,3))
    cv2.bitwise_not(thresh4,th1)
    di = cv2.morphologyEx(th1, cv2.MORPH_OPEN, element)
    th1=cv2.cvtColor(th1,cv2.COLOR_GRAY2RGB)

        
    
    titles = ['Original Image', 'grey',
             'veins', 'optic disk', 'th1', 'dilate']
    images = [image, grey, thresh4, thresh5, th4, di]
 
    for i in xrange(6):
        plt.subplot(2,3,i+1),plt.imshow(images[i],'gray')
        plt.title(titles[i])
        plt.xticks([]),plt.yticks([])
    plt.show()
    k = cv2.waitKey(5) & 0xFF
    if k == 27:
        break
cv2.destroyAllWindows()