def bb_crop(path_to_image):
    

    def draw_found_faces(detected, image):
        for (x, y, width, height) in detected:
            print(x, y, width, height)
            return image[x:x+width, y:y+height]
            

    
    original_image = cv2.imread(path_to_image)

        # Convert image to grayscale
    image = cv2.cvtColor(original_image, cv2.COLOR_BGR2GRAY)

        # Create Cascade Classifiers
    face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_default.xml")
        
        # Detect faces using the classifiers
    detected_faces = face_cascade.detectMultiScale(image=image, scaleFactor=1.3, minNeighbors=4)

        # Filter out profiles

        # Draw rectangles around faces on the original, colored image
    original_image = draw_found_faces(detected_faces, original_image) # RGB - green
        # Open a window to display the results
    cv2.imshow('1', original_image)
        # The window will close as soon as any key is pressed (not a mouse click)
    cv2.waitKey(0) 