'''hw7 - 2
작성자 윤민정
작성일 26.06.13
작성 목적 - matplotlib 활용 
'''

import matplotlib.pyplot as plt
import numpy as np

y = np.array([20,20,35,15,10])
do = ['Kyunggi','Chungcheng','Seoul','Jellra','Kyunsang']

plt.pie(y,labels = do)
plt.legend(title = "Five Districts")
plt.show()