from flask import Flask,render_template,request,flash
import database,result

app = Flask(__name__)
app.config['SECRET_KEY'] = 'hard to guess string'

@app.route('/')
def index():
	return render_template("Frontpage.html")

@app.route('/index.html')
def index1():
	return render_template("index.html")

@app.route('/hospital.html')
def index2():
	return render_template("hospital.html")

@app.route('/Doctor.html')
def index3():
	return render_template("Doctor.html")

@app.route('/datatable.html',methods=['POST'])
def index4():
	fname=str(request.form['fname'])
	lname=str(request.form['lname'])
	contact=str(request.form['contact'])
	age=str(request.form['age'])
	weight=str(request.form['weight'])
	city=str(request.form['city'])
	symarray=str(request.form['symarray'])
	sym=list(map(str,symarray.strip().split(',')))
	database.patientinsert(fname+" "+lname,contact,age,weight)
	(Dname,Symptoms)=database.diseasepred(sym)
	(Docname,Hid)=database.doctorpred(Dname,city)
	(Hname,Address)=database.hospitalpred(Hid)
	Data=result.display(Dname,Symptoms,Docname,Hname,Address)
	if result.Validation(Dname):
		flash("Sorry ! It seems none of your symptoms is present in our records ...")
	return render_template("datatable.html",Data=Data)

@app.route('/Frontpage.html',methods=['POST','GET'])
def index5():
	if request.method=='POST':
		hname=str(request.form['hospital'])
		contact=str(request.form['contact'])
		address=str(request.form['address'])
		city=str(request.form['city'])
		flash(database.hospitalinsert(hname,city,address,contact))
	elif request.method=='GET':
		fname=str(request.args.get('fname'))
		lname=str(request.args.get('lname'))
		contact=str(request.args.get('contact'))
		degree=str(request.args.get('degree'))
		hospital=str(request.args.get('hospital'))
		city=str(request.args.get('city'))
		speciality=str(request.args.get('speciality'))
		if database.doctorinsert("Dr "+fname+" "+lname,hospital,speciality,contact,degree,city)!="Thanks for registering with us.":
			flash("It seems the Hospital you entered is not registered with us. Please kindly register your Hospital first.")
			return render_template("hospital.html")
		flash("Thanks for registering with us")
	return render_template("Frontpage.html")

if __name__=='__main__':
	app.run(debug=True)