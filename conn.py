import mysql.connector
mydb=mysql.connector.connect(
    host="localhost",
    user="root",
    password="Pass@123",
    database="db10"
)
mycursor = mydb.cursor()
'''sql="INSERT INTO stu1(roll_no,name,mark) VALUES(12,'RAM',85)"
mycursor.execute(sql)
l= "INSERT INTO stu1(roll_no,name,mark) VALUES(13,'SAM',75)"
mycursor.execute(l)
l= "update stu1 set name='KAM' WHERE roll_no=13"
mycursor.execute(l)'''
l= "delete from stu1 WHERE roll_no=12"
mycursor.execute(l)
mydb.commit()
print(mycursor.rowcount,"record deleted.")    
