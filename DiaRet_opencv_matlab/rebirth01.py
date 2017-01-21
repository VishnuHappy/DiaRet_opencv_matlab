import cv2
import numpy as np
import matplotlib.pyplot as plt
while(1):

	img= cv2.imread('im0001.ppm')
	imgray=cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
	r,g,b=cv2.split(img)
	img1= cv2.imread('im0004.ppm')
	im1gray=cv2.cvtColor(img1,cv2.COLOR_BGR2GRAY)
	
	r1,g1,b1=cv2.split(img1)
	c1=g1+r1
	c=g-r	
	d1=g1-b1
	d=g-b
	titles = [ 'blue','blue1','dif1','dif2','dif11','dif21']
	images = [g,g1,c,d,c1,d1] 
	for i in xrange(6):
	    cv2.imshow(titles[i],images[i]) 
	    
	    plt.subplot(2,3,i+1),plt.hist(images[i].ravel(),256,[0,256]); plt.show()
	plt.show()    
	
	
	
	k = cv2.waitKey(5) & 0xFF
	if k == 27:
		break
cv2.destroyAllwindows()