import cv2
import imutils
import numpy as np

while(1):
    image=cv2.imread("eye.jpg")
    image=image/4
        
    cv2.namedWindow("image", cv2.WINDOW_NORMAL)

    cv2.imshow("image",image)
    
    
    k = cv2.waitKey(5) & 0xFF
    if k == 27:
        break
cv2.destroyAllWindows()