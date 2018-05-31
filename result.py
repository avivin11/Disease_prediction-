
def display(Dname,Symptoms,Docname,Hname,Address):
	Data=[]
	j=len(Docname)
	for i in range(len(Dname)):
		Data1=[]
		Data1.append(i+1)
		Data1.append(Dname[i])
		Data1.append(Symptoms[i])
		if i<j:
			Data1.append(Docname[i])
			Data1.append(Hname[i])
			Data1.append(Address[i])
		else:
			Data1.append("----")
			Data1.append("----")
			Data1.append("----")
		Data.append(Data1)
	return Data

def Validation(Dname):
	return len(Dname)==0