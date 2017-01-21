import cv2
import imutils
import numpy as np

while(1):
    image=cv2.imread("eye.jpg")
    grey=cv2.cvtColor(image,cv2.COLOR_BGR2GRAY)
    grey1=grey-164
    ret,th1 = cv2.threshold(grey1,127,255,cv2.THRESH_BINARY)
    thresh4 = cv2.adaptiveThreshold(grey,255,cv2.ADAPTIVE_THRESH_GAUSSIAN_C,cv2.THRESH_BINARY,11,2)
    kernel = np.ones((5,5), np.uint8)
    dilation = cv2.dilate(th1,kernel,iterations = 10)
    cv2.namedWindow("image", cv2.WINDOW_NORMAL)

    cv2.imshow("image",th1)
    
    
    k = cv2.waitKey(5) & 0xFF
    if k == 27:
        break
cv2.destroyAllWindows()