
import MySQLdb
from itertools import combinations

def patientinsert(Name,Contact,Age,Weight):
	client=MySQLdb.connect(host="localhost",user="root",passwd="avinash11",db="DBMS_Project")
	cursor=client.cursor()
	try:
		query="Insert into Patient values ('"+Name+"','"+Contact+"',"+Age+","+Weight+")"
		cursor.execute(query)
		client.commit()
	except Exception as e:
		print(e)

	finally:
		client.close()


def hospitalinsert(Name,City,Address,Contact):
	client=MySQLdb.connect(host="localhost",user="root",passwd="avinash11",db="DBMS_Project")
	cursor=client.cursor()
	try:
		cursor.execute("select * from Hospital where HName=%s and City=%s and Address=%s",(Name,City,Address))
		if cursor.rowcount==0:
			query="Insert into Hospital (HName,City,Address,Contact) values ('"+Name+"','"+City+"','"+Address+"','"+Contact+"');"
			cursor.execute(query)
			client.commit()
			return "Thanks for registering with us."
	except Exception as e:
		print(e)

	finally:
		client.close()

	return "It seems the Hospital you entered is already registered with us."

def doctorinsert(Name,HName,Speciality,Contact,Degree,City):
	client=MySQLdb.connect(host="localhost",user="root",passwd="avinash11",db="DBMS_Project")
	cursor=client.cursor()
	try:
		cursor.execute("select HID from Hospital where HName=%s and City=%s",(HName,City))
		if cursor.rowcount!=0:
			result=cursor.fetchall()
			for row in result:
				HID=row[0]
			query="Insert into Doctor (DocName,HID,Speciality,Contact,Degree) values ('"+Name+"',"+str(HID)+",'"+Speciality+"','"+Contact+"','"+Degree+"');"
			cursor.execute(query)
			client.commit()
			return "Thanks for registering with us."
	except Exception as e:
		print(e)

	finally:
		client.close()

	return "It seems the Hospital you entered is not registered with us. Please kindly register your Hospital first."

def diseasepred(sym):
	client=MySQLdb.connect(host="localhost",user="root",passwd="avinash11",db="DBMS_Project")
	cursor=client.cursor()
	k=0
	Did,Dname,Symptoms=[],[],[]
	try:
		for i in range(len(sym),0,-1):
			combo=list(combinations(sym,i))
			for l in combo:
				query="select * from Disease where "
				for j in range(len(l)):
					if j!=len(l)-1:
						query+="find_in_set('"+l[j]+"',SArray) and "
					else:
						query+="find_in_set('"+l[j]+"',SArray);"
				cursor.execute(query)
				result=cursor.fetchall() #for getting data from database
				for row in result:
					if k<7:
						if Did.count(row[0])==0:
							Did.append(row[0])
							Dname.append(row[1])
							Symptoms.append(row[2])
							k+=1
					else:
						break
	except Exception as e:
		print(e)

	finally:
		client.close()

	return (Dname,Symptoms)

def doctorpred(Disease,City):
	client=MySQLdb.connect(host="localhost",user="root",passwd="avinash11",db="DBMS_Project")
	cursor=client.cursor()
	k=0
	Did,Docname,Hid,city=[],[],[],[]
	query="select HID from Hospital where City='"+City+"';"
	cursor.execute(query)
	result1=cursor.fetchall()
	for row in result1:
		city.append(row[0])
	try:
		for i in range(len(Disease),0,-1):
			combo=list(combinations(Disease,i))
			for l in combo:
				query="select DocID,DocName,HID from Doctor where "
				for j in range(len(l)):
					if j!=len(l)-1:
						query+="find_in_set('"+l[j]+"',Speciality) and "
					else:
						query+="find_in_set('"+l[j]+"',Speciality);"
				cursor.execute(query)
				result=cursor.fetchall() #for getting data from database
				for row in result:
					if k<7:
						if 	Did.count(row[0])==0 and city.count(row[2])!=0:
							Did.append(row[0])
							Docname.append(row[1])
							Hid.append(row[2])
							k=k+1
					else :
						break
	except Exception as e:
		print(e)

	finally:
		client.close()

	return (Docname,Hid) 

def hospitalpred(Hid):
	client=MySQLdb.connect(host="localhost",user="root",passwd="avinash11",db="DBMS_Project")
	cursor=client.cursor()
	Hname,Address=[],[]
	try:
		for i in Hid:
			query="select HName,Address from Hospital where HID="+str(i)+";"
			cursor.execute(query)
			result=cursor.fetchall() #for getting data from database
			for row in result:
				Hname.append(row[0])
				Address.append(row[1])
	except Exception as e:
		print(e)

	finally:
		client.close()

	return (Hname,Address)