import cv2

name = 'Alice'  #Change as per the person 
#will create a new folder inside dataset directorty with name ='alice' with captured faces for recognition

cam = cv2.VideoCapture(0)

cv2.namedWindow("press space to capture", cv2.WINDOW_NORMAL)
cv2.resizeWindow("press space to capture", 640, 480)

img_counter = 0

while True:
    ret, frame = cam.read()
    if not ret:
        print("unable to grab frame")
        break
    cv2.imshow("press space to capture", frame)

    k = cv2.waitKey(1)
    if k%256 == 27:
        # ESC pressed
        print("Press Esc to close")
        break
    elif k%256 == 32:
        # SPACE pressed
        img_name = "Dataset/"+ name +"/image_{}.jpg".format(img_counter)
        cv2.imwrite(img_name, frame)
        print("{} written!".format(img_name))
        img_counter += 1

cam.release()

cv2.destroyAllWindows()
