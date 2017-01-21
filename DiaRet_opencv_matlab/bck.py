import numpy as np
import cv2
#change this to input video 
cap = cv2.VideoCapture(0)
 
kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE,(3,3))
fgbg = cv2.createBackgroundSubtractorKNN()
while(1):
    ret, frame = cap.read()
    if not ret or frame is None:     # if frame was not read successfully
        print "error: frame not read from webcam\n"             # print error message to std out
        os.system("pause")                                      # pause until user presses a key so user can see error message
        break       
    
    
    fgmask = fgbg.apply(frame)
    fgmask = cv2.morphologyEx(fgmask, cv2.MORPH_OPEN, kernel)

    
    cv2.namedWindow("fout", cv2.WINDOW_NORMAL)
    cv2.imshow('fout',fgmask)
    k = cv2.waitKey(30) & 0xff
    if k == 27:
        break
 
cap.release()
cv2.destroyAllWindows()