def bb_crop(path):
    original_image = cv2.imread(path)

    if original_image is not None:
        img = cv2.cvtColor(original_image, cv2.COLOR_BGR2GRAY)

        
        face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_default.xml")
        
      
        detected_faces = face_cascade.detectMultiScale(image=img, scaleFactor=1.3, minNeighbors=4)
        for (x, y, width, height) in detected_faces:
             original_image = original_image[y:y+height,x:x+width]
             break
        return original_image
