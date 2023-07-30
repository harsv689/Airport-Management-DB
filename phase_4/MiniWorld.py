import subprocess as sp
import pymysql
import pymysql.cursors

def option1():
    cur.execute("SELECT *  FROM FLIGHT")
    # cur.execute("SELECT  Flight_Number FROM FLIGHT")
    print("Flight Numbers : ")
    for row in cur:
        print(row,end='\n')

def option2():
    cur.execute("SELECT DISTINCT Flight_Number FROM FLIGHT")
    print("Flight Numbers : ")
    for row in cur:
        print(row,end='\n')
    try:
        # print("Enter flight Number: ")
        fl_num=int(input("enter a flight number :"))
        query="select * from PASSENGER_1 where Ticket_Number in (select Ticket_Number from TICKET_2 where Flight_Number = %d )" % (fl_num)
        # print(query)
        rows_count=cur.execute(query)
        for row in cur:
            print(row,end='\n')
            # if row == None:
            #     print("Incorrect Flight number")
        if rows_count==0:
            print("Incorrect Flight Number")

    except Exception as e:
        con.rollback()
        print("Failed to fetch details from database")
        print(">>>>>>>>>>>>>", e)

    return

def option3():
    cur.execute("SELECT DISTINCT Flight_Number FROM FLIGHT")
    print("Flight Numbers : ")
    for row in cur:
        print(row,end='\n')
    try:
        # print("Enter flight Number : ")
        fl_num=int(input("enter a flight number : "))
        
        query="select * from CREW_MEMBER where Flight_Number = %d " % (fl_num)
        # print(query)
        rows_count=cur.execute(query) 
        if rows_count==0:
            print("Incorrect Flight Number")
            return
        print("Searching for crew member details.....")
        for row in cur:
            print(row,end='\n')

       

    except Exception as e:
        con.rollback()
        print("Failed to fetch details from database")
        print(">>>>>>>>>>>>>", e)

    return

def option4():
    cur.execute("SELECT Employee_number,Name FROM EMPLOYEE_2")
    print("Employee Records : ")
    for row in cur:
        print(row,end='\n')
    try:
        # print("Enter Employee Number : ")
        emp_num=int(input("Enter Employee Number : "))
        
        query="select * from EMPLOYEE_2 where Employee_Number = %d " % (emp_num)
        # print(query)
        rows_count=cur.execute(query)
        if rows_count==0:
            print("Incorrect Employee Number")
            return
        print("Searching for employee details.....")
        for row in cur:
            print(row,end='\n')
        

    except Exception as e:
        con.rollback()
        print("Failed to fetch details from database")
        print(">>>>>>>>>>>>>", e)

    return

def option5():
    cur.execute("SELECT Employee_number,Name FROM EMPLOYEE_2")
    print("Employee Records : ")
    for row in cur:
        print(row,end='\n')
    try:
        # print("Enter Employee Number : ")
        emp_num=int(input("Enter Employee Number to be fired : "))
        
        query="delete from DEPENDENTS where Employee_Number = %d " % (emp_num)
        rows_count2=cur.execute(query)
        con.commit()

        query="delete from EMPLOYEE_2 where Employee_Number = %d " % (emp_num)
        rows_count1=cur.execute(query)
        con.commit()

        # print(rows_count1)
        # print(rows_count2)
        if(rows_count1==0 or rows_count2==0):
            print("Incorrect Employee Number")
        else:
            print("Firing employee .....")
    
    except Exception as e:
        con.rollback()
        print("Failed to fire employee")
        print(">>>>>>>>>>>>>", e)

    return

def option6():
    cur.execute("SELECT Passport_Number,Ticket_Number FROM PASSENGER_1")
    print("TICKETS : ")
    for row in cur:
        print(row,end='\n')
    try:
        # print("Enter Employee Number : ")
        tick_num=int(input("Enter Ticket Number to be cancelled : "))
        

        query="update PASSENGER_1 set Ticket_Number=NULL where Ticket_Number = %d " % (tick_num)
        rows_count1=cur.execute(query)
        con.commit()

        query="delete from TICKET_2 where Ticket_Number = %d " % (tick_num)
        rows_count2=cur.execute(query)
        con.commit()
        if(rows_count1==0 or rows_count2==0):
            printf=("Incorrect Ticket Number")
            
        else:
            print("Deleting ticket .....")
        
    
    except Exception as e:
        con.rollback()
        print("Failed to delete ticket")
        print(">>>>>>>>>>>>>", e)

    return

def option7():
    cur.execute("SELECT DISTINCT Flight_Number FROM FLIGHT where Status != 'Cancelled'")
    print("Flight Numbers : ")
    for row in cur:
        print(row,end='\n')
    try:
        # print("Enter flight Number : ")
        fl_num=int(input("enter the flight number to be cancelled : "))
        # print("Searching for crew member details.....")
        # query="select * from CREW_MEMBER where Flight_Number = %d " % (fl_num)
        query="update FLIGHT set Status='Cancelled' where Flight_number = %d"% (fl_num)
        # print(query)
        rows_count=cur.execute(query)
        con.commit()
        if(rows_count==0):
            print("Incorrect Flight Number")
        else:
            print("Cancelling Flight ...")
            # cur.execute("SELECT Flight_Number,Status FROM FLIGHT")
            # print("Flight Numbers : ")
            # for row in cur:
            #     print(row,end='\n')
        
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

def option8():
    cur.execute("SELECT DISTINCT Flight_Number FROM FLIGHT where Status != 'Cancelled'")
    print("Flight Numbers : ")
    for row in cur:
        print(row,end='\n')
    try:
        # print("Enter flight Number : ")
        fl_num=int(input("enter a flight number"))
        # print("Searching for crew member details.....")
        # query="select * from CREW_MEMBER where Flight_Number = %d " % (fl_num)
        query="select Flight_Number ,timediff(Arrival, Departure) as duration from FLIGHT where Flight_number = %d"% (fl_num)
        # print(query)
        rows_count=cur.execute(query)
        if(rows_count==0):
            print("Incorrect Flight Number")
        else:
            for row in cur:
                print(row,end='\n')

    except Exception as e:
        con.rollback()
        print("Failed to fetch duration")
        print(">>>>>>>>>>>>>", e)

    return

def option9():
    # cur.execute("SELECT DISTINCT Flight_Number FROM FLIGHT where Status != 'Cancelled'")
    # print("Flight Numbers : ")
    # for row in cur:
    #     print(row,end='\n')
    try:
        # print("Enter flight Number : ")
        # fl_num=int(input("enter a flight number"))
        # print("Searching for crew member details.....")
        # query="select * from CREW_MEMBER where Flight_Number = %d " % (fl_num)
        print("Occupancy <=50%")
        query1="select distinct Source, Destination, Occupancy_rate, Class, Price from FLIGHT join TICKET_1 on FLIGHT.Flight_number = TICKET_1.Flight_number where Occupancy_rate <= 50.00"
        cur.execute(query1)
        for row in cur:
            print(row,end='\n')
        
        print("Occupancy >=90%")
        query2="select distinct Source, Destination, Occupancy_rate, Class, Price from FLIGHT join TICKET_1 on FLIGHT.Flight_number = TICKET_1.Flight_number where Occupancy_rate >= 90.00"
        cur.execute(query2)
        for row in cur:
            print(row,end='\n')

        print("50%<Occupancy<90%")
        query3="select distinct Source, Destination, Occupancy_rate, Class, Price from FLIGHT join TICKET_1 on FLIGHT.Flight_number = TICKET_1.Flight_number where Occupancy_rate between 50.00 and 90.00"
        cur.execute(query3)
        for row in cur:
            print(row,end='\n')

    except Exception as e:
        con.rollback()
        print("Failed to retrieve data")
        print(">>>>>>>>>>>>>", e)

    return

def option10():
    cur.execute("SELECT Source,Destination FROM FLIGHT")
    print("Routes : ")
    for row in cur:
        print(row,end='\n')

    src=input("enter src from upper list : ")
    dest=input("enter dest from upper list : ")


    try:
        query="select Flight_number, Class from (select * from FLIGHT natural join TICKET_1 where Source = '%s' and Destination = '%s') as X where Price in (select min(Price) from FLIGHT join TICKET_1 on FLIGHT.Flight_number = TICKET_1.Flight_number where Source = '%s' and Destination = '%s')" %(src,dest,src,dest)
        rows_count=cur.execute(query)
        if rows_count ==0:
            print("No data for input route")
        else:
            print("Cheapest route")
            for row in cur:
                print(row,end='\n')
        
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)
    
    return

def option11():
    cur.execute("SELECT Source,Destination FROM FLIGHT")
    print("Routes : ")
    for row in cur:
        print(row,end='\n')
    src=input("enter src from upper list : ")
    dest=input("enter dest from upper list : ")

    try:
        query="select avg(Price) as average from FLIGHT join TICKET_1 on FLIGHT.Flight_number = TICKET_1.Flight_number where Source = '%s' and Destination = '%s'" %(src,dest)   
        cur.execute(query)
        for row in cur:
            print(row,end='\n')

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)
    
    return

def option12():
    try:
        # Takes emplyee details as input
        row = {}
        o=0
        print("Enter new Ticket's details: ")
        passno = int(input("Enter the related Passenger's Passport_number(10 digit integer): "))
        cur.execute("SELECT * FROM PASSENGER_1")
        myresult=cur.fetchall()
        for x in myresult:
            if (x==passno):
                o=1
        
        print(o)
        print("flag\n")

        name = int((input("Ticket_Number(10 digit integer): ")))
        row["Ticket_number"] = name
        row["Flight_number"] = int(input("Flight_Number: "))
        row["Seat_number"] = input("Seat_Number: ")
        row["Class"] = input("Class: ")

        query = "INSERT INTO TICKET_2(Ticket_number, Flight_number, Seat_number, Class) VALUES(%d, %d, '%s', '%s')" % (
            row["Ticket_number"], row["Flight_number"], row["Seat_number"], row["Class"])

        # print(query)
        cur.execute(query)
        # con.commit()

        if(o==0):
            pss_name=input("Enter the Passenger Name: ")
            pss_dob=input("Enter the DOB: (YYYY-MM-DD) ")
            pss_gen=input("Enter Gender('M'/'F'/'T'): ")
            pss_hpn=int(input("Enter the Head Passenger's Passport Number(10 digit integer) : "))

            query = "INSERT INTO PASSENGER_1(Passport_number, Name, Date_of_birth, Gender, Head_PN, Ticket_Number) VALUES(%d, '%s', '%s', '%s',%d,%d)" % (
            passno, pss_name, pss_dob, pss_gen,pss_hpn,row["Ticket_number"])
            cur.execute(query)
            
            print("Enter the following components of Passenger's Address: \n")
            pss_area=input("Area: ")
            pss_city=input("City: ")
            pss_cnt=input("Country: ")
            pss_pin=int(input("Pincode: "))

            query = "INSERT INTO PASSENGER_3(Passport_number, Area, City, Country, Pin_code) VALUES(%d, '%s', '%s','%s',%d)" % (
            passno, pss_area, pss_city, pss_cnt,pss_pin)
            cur.execute(query)
            # con.commit()

            count=int(input("Total no. of Phone_number: "))
            for j in range(count):
                pno=int(input("Enter the Phone Number(10 digit integer): "))
                query="INSERT INTO PASSENGER_2(Passport_number, Phone_number) VALUES(%d,%d)"%(passno,pno)
                cur.execute(query)
                # con.commit()
        
        con.commit()
        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Error: Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return


def option13():
    try:
        # Takes emplyee details as input
        row = {}
        print("Enter new flight's details: ")
        row["Fno"] = int(input("Flight Number:(8 digit integer) "))
        row["src"] = input("Source: ")
        row["dest"] = input("Destination: ")
        row["status"] = input("Status:(Ontime/Delayed/Cancelled) ")
        row["Arrival"] = input("Arrival: datetime(YYYY-MM-DD hh-mm-ss)")
        row["Departure"] = input("Departure: datetime(YYYY-MM-DD hh-mm-ss)")
        row["OR"] = float(input("Occupancy Rate: "))

        query = "INSERT INTO FLIGHT VALUES(%d, '%s', '%s', '%s', '%s', '%s', %f)" % (row["Fno"], row["src"], row["dest"], row["status"], row["Arrival"], row["Departure"], row["OR"])

        # print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def option14():
    try:
        # Takes emplyee details as input
        row = {}
        print("Enter new employee's details: ")
        row["Eno"] = int(input("Employee Number(10 digit integer): "))
        row["Name"] = input("Name: ")
        row["Bdate"] = input("Date of Birth (YYYY-MM-DD): ")
        row["Designation"] = input("Designation(Janitor/Security/Baggage Handler): ")
        row["Pno"] = int(input("Phone Number(12 digit integer): "))

        query = "INSERT INTO EMPLOYEE_2 (Employee_number , Name, Date_of_birth, Designation, Phone_number) VALUES(%d, '%s', '%s','%s', %d)" % (
            row["Eno"], row["Name"], row["Bdate"],row["Designation"], row["Pno"])

        # print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

    return

def option15():
    cur.execute("SELECT DISTINCT Flight_Number FROM FLIGHT where Status = 'Cancelled'")
    print("Flight Numbers : ")
    for row in cur:
        print(row,end='\n')
    try:
        # print("Enter flight Number : ")
        fl_num=int(input("enter the flight number to be uncancelled : "))
        # print("Searching for crew member details.....")
        # query="select * from CREW_MEMBER where Flight_Number = %d " % (fl_num)
        flag=1
        delay=int(input("press 1 if delayed,2 if ontime, default=ontime"))
        if(delay==1):
            flag=2
         
        if(flag==1):
            query="update FLIGHT set Status='Ontime' where Flight_number = %d"% (fl_num)
        else :
            query="update FLIGHT set Status='Ontime' where Flight_number = %d"% (fl_num)
        print(query)
        rows_count=cur.execute(query)
        con.commit()
        if(rows_count==0):
            print("Incorrect Flight Number")
        else:
            print("Changing Flight Status ...")
            # cur.execute("SELECT Flight_Number,Status FROM FLIGHT")
            # print("Flight Numbers : ")
            # for row in cur:
            #     print(row,end='\n')
        
    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print(">>>>>>>>>>>>>", e)

def option16():
    cur.execute("SELECT Salary,Designation FROM EMPLOYEE_1")
    print("Employee Records : ")
    for row in cur:
        print(row,end='\n')
    try:
        # print("Enter flight Number : ")
        desgn=input("enter the designation : ")
        # print("Searching for crew member details.....")
        # query="select * from CREW_MEMBER where Flight_Number = %d " % (fl_num)
        bonus=float(input("enter %\ increase in salary"))
        bonus+=100;
        bonus/=100;
         
        
        query="update EMPLOYEE_1 set Salary=Salary*(%f) where Designation = '%s'"% (bonus,desgn)
        
        print(query)
        rows_count=cur.execute(query)
        con.commit()
        if(rows_count==0):
            print("Salary Hike Ineligible")
        else:
            print("Salary hike ...")
        
    except Exception as e:
        con.rollback()
        print("Failed to update salary ")
        print(">>>>>>>>>>>>>", e)

def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        option1()
    elif(ch == 2):
        option2()
    elif(ch == 3):
        option3()
    elif(ch == 4):
        option4()
    elif(ch == 5):
        option5()
    elif(ch == 6):
        option6()
    elif(ch == 7):
        option7()
    elif(ch == 8):
        option8()
    elif(ch == 9):
        option9()
    elif(ch == 10):
        option10()
    elif(ch == 11):
        option11()  
    elif(ch == 12):
        option12()
    elif(ch == 13):
        option13()
    elif(ch == 14):
        option14()   
    elif(ch == 15):
        option15()  
    elif(ch == 16):
        option16()  
    else:
        print("Error: Invalid Option")


# Global
while(1):
    tmp = sp.call('clear', shell=True)
    
    # Can be skipped if you want to hardcode username and password
    username = "root"
    password = "12345678"

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=3306,
                              user="root",
                              password="12345678",
                              db='AIRPORT_MANAGEMENT_DB',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                # Here taking example of Employee Mini-world
                print("1. View all the Upcoming Flight")  # FLights
                print("2. View all the Passenger details of a particular flight")  # 
                print("3. Crew members of a particular flight")  # Promote Employee
                print("4. Search for an Employee's details")  # Employee Statistics
                print("5. Fire an Employee")  # Fire an Employee
                print("6. Cancel Passenger Ticket")  # Cancel Ticket
                print("7. Cancel Flight")  # Cancel Flight
                print("8. Duration of a flight")  # Flight Duration
                print("9. Occupancy vs Price")  # Occupancy vs price
                print("10. Cheapest Flight on a Route")  # cheapest flight on a route
                print("11. Avg ticket price over a route")  # avg ticket price over a route
                print("12. insert ticket")  # avg ticket price over a route
                print("13. insert flight")  # avg ticket price over a route
                print("14. insert employee")  # insert employee details
                print("15. Update Flight status") # update flight status
                print("16. Update Salaries") # update salaries for designation 
                print("17. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 17:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
