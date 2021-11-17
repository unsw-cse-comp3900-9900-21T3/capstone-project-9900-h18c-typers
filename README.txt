Requirements:
System OS	Ubuntu16.4 or CSE machine
Python version	3.7
MySql Version	8.0.26
Django==3.2.8
django_pandas==0.6.6
PyMySQL==1.0.2
scikit_surprise==1.1.1
surprise==0.1
django-cors-headers==3.10.0

a. Install requirements
		#Go to the project root folder:
	pip install -r requirements.txt
b. Install database and import data
	pip install mysql-server
	#set Mysql user and password
	#start mysql
	service mysql start
	#import database structures and init data
	mysql -yourusername -yourpassword mysite < mysite.sql
	#configure Django Mysql settings
	#change myWeb/settings.py to your own username and password
	DATABASES = {
    	'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'mysite',
        'USER': YOURUSERNAME,
        'PASSWORD': YOURPASSWORD,
        'HOST': '127.0.0.1',
        'PORT': '3306'
    	}
	}
c. Run server
	#Go to the project root folder:
	#run server
	python3 manage.py runserver

