##선생님 작
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
import time


id = 'yeti0908'
pw = 'shaco1209!!'


driver = webdriver.Chrome()


url = 'https://www.ikosmo.co.kr/main/'
driver.get(url)


driver.find_element(By.XPATH,'//*[@id="header"]/div[1]/div/ul/li[1]/a').click()
time.sleep(2)


driver.find_element(By.NAME, 'id').send_keys(id)
time.sleep(2)
driver.find_element(By.NAME, 'password').send_keys(pw)
time.sleep(2)


driver.find_element(By.XPATH, '//*[@id="subConts"]/div/div/div/div/section/section/form/fieldset/div[2]/ul/li/a').click()
time.sleep(5)


driver.find_element(By.XPATH,'//*[@id="wrapper"]/div[2]/ul/li[1]/a').click()
time.sleep(2)



### 실패작
# from selenium import webdriver
# from selenium.webdriver.common.keys import Keys
# from selenium.webdriver.common.by import By
# import time

# driver = webdriver.Chrome()

# url = 'https://www.ikosmo.co.kr/main'
# driver.get(url)

# driver.find_element(By.XPATH, '//*[@id="header"]/div[1]/div/ul/li[1]/a').click()
# time.sleep(2)

# driver.find_element(By.NAME, 'loginId').send_keys('yeti0908')
# time.sleep(5)
# driver.find_element(By.NAME, 'password').send_keys('shaco1209!!')
# time.sleep(5)

# driver.find_element(By.XPATH, '//*[@id="subConts"]/div/div/div/div/section/section/form/fieldset/div[2]/ul/li/a').click()
# time.sleep(30)