
from keras.models import Sequential
from keras.layers import Dense, Conv2D, MaxPooling2D, Flatten
import os
import cv2
import numpy as np
import pandas as pd
from tensorflow import keras
import cv2
from bb_crop import bb_crop


def en(name):
    for i in range(len(celeb)):
        if celeb[i] == name:
            return i+1



x_train = []
y_train = []
x_test = []
y_test = []


global celeb
celeb = ["anne_hathaway","arnold_schwarzenegger","ben_afflek","dwayne_johnson","elton_john","jerry_seinfeld","kate_beckinsale",
        "keanu_reeves","lauren_cohan","madonna","mindy_kaling","simon_pegg","sofia_vergara","will_smith"] 


main_path="/home/amiryousof/Desktop/andriod/CR_tensorflow_1/images"


for folder in os.listdir(main_path+"/train"):

    for file in os.listdir(main_path+f"/train/{folder}"):
        
        #image = cv2.imread(main_path+f"/train/{folder}/{file}",cv2.IMREAD_GRAYSCALE)
        image = bb_crop(main_path+f"/train/{folder}/{file}")
        image = cv2.resize(image,(32,32))
        image = keras.utils.normalize(image,axis=1)


        x_train.append(image)
        y_train.append(en(folder))



for folder in os.listdir(main_path+"/test"):

    for file in os.listdir(main_path+f"/test/{folder}"):
        
        
        #image = cv2.imread(main_path+f"/test/{folder}/{file}",cv2.IMREAD_GRAYSCALE)
        image = bb_crop(main_path+f"/test/{folder}/{file}")
        image = cv2.resize(image,(32,32))
        image = keras.utils.normalize(image,axis=1)
        
        
        
        x_test.append(image)
        y_test.append(en(folder))


x_train = np.asarray(x_train)
x_test = np.asarray(x_test)


y_train = np.asarray(y_train)
y_test = np.asarray(y_test)

x_train = x_train.reshape((220,32,32,1))
x_test = x_test.reshape((70,32,32,1))




model = Sequential()


model.add(Conv2D(32, (3, 3), activation='selu'))
model.add(MaxPooling2D((2,2)))
model.add(Conv2D(64, (3, 3), activation='relu'))
model.add(MaxPooling2D((2,2)))
model.add(Conv2D(64, (3, 3), activation='relu'))
model.add(MaxPooling2D((2,2)))

model.add(Flatten())
model.add(Dense(512,activation='relu'))
model.add(Dense(len(celeb)+1,activation='softmax'))
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

model.fit(x_train, y_train, epochs=200)

model.save("model_face_recognition")

y_predicted = model.predict(x_test)

wrong_answers = 0

for i in range(len(y_predicted)):
    if np.argmax(y_predicted[i]) != y_test[i]:
        wrong_answers += 1

print(100 - ( (wrong_answers * 100) / 70 ))