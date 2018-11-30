# show trip info without driverName and lastName
select 	t.tripNo,
		s1.stationName as DeptStation, s2.stationName as ArrvStation,
        t.deptTime ,t.arrvTime ,t.availSeat ,v.vanID , 
        t.tripRemark 
from trip t,route r, station s1, station s2,Van v
WHERE t.routeID=r.routeID and r.deptStationID=s1.stationID and r.arrvStationID=s2.stationID and t.vanID=v.vanID
ORDER BY t.deptTime
;

# detailed trip
select 	t.tripNo,
		s1.stationName as DeptStation, s2.stationName as ArrvStation,
        t.deptTime ,t.arrvTime ,t.availSeat ,v.vanID , 
        e.firstName as DriverFName, e.lastname as DriverLName, d.rating as DriverRating,
        t.tripRemark 
from trip t,route r, station s1, station s2,Employee e,Van v,driver d
WHERE t.routeID=r.routeID and r.deptStationID=s1.stationID and r.arrvStationID=s2.stationID and t.driverID=e.employeeID and t.vanID=v.vanID and t.driverID=d.driverID
ORDER BY deptTime
;

# show trip sort by route and deptTime
select 	t.tripNo,
		s1.stationName as DeptStation, s2.stationName as ArrvStation,
        t.deptTime ,t.arrvTime ,t.availSeat ,v.vanID , 
        t.tripRemark 
from trip t,route r, station s1, station s2,Van v
WHERE t.routeID=r.routeID and r.deptStationID=s1.stationID and r.arrvStationID=s2.stationID and t.vanID=v.vanID
ORDER BY t.routeID,t.deptTime;
;

# select trip by date
select 	t.tripNo,
		s1.stationName as DeptStation, s2.stationName as ArrvStation,
        t.deptTime ,t.arrvTime ,r.fare,t.availSeat ,v.vanID , 
        t.tripRemark 
from trip t,route r, station s1, station s2,Van v
WHERE t.routeID=r.routeID and r.deptStationID=s1.stationID and r.arrvStationID=s2.stationID and t.vanID=v.vanID
		and t.deptTime>'2018-11-29'
        and t.deptTime<'2018-11-30'
ORDER BY t.deptTime
;


#show feedback of trips
SELECT t.tripNo,c.customerID,t.deptTime,
	c.FirstName,c.lastName,
    f.rating,
    f.comment
FROM trip t,customer c,feedback f,reservation rs
where t.tripNo = rs.tripNo and rs.customerID=c.customerID and f.tripNo=t.tripNo and f.customerID=c.customerID
order by deptTime;


#show departments and their employees
SELECT d.deptName,e.firstName,e.lastName,e.empType FROM employee e,department d
WHERE e.deptName = d.deptName
ORDER BY d.deptName, e.empType;

#show reservation
SELECT rs.reservationCode,c.firstName as CustomerFname,c.lastname as CustomerLName,t.tripNo,s1.stationName as DepartStation,s2.stationName as ArrivalStation,t.deptTime as DepartTime,t.arrvTime as ArrivalTime,r.fare
from trip t, reservation rs,route r,station s1,station s2,customer c
where t.tripNo = rs.tripNo and t.routeID=r.routeID and r.deptStationID = s1.stationID and r.arrvStationID = s2.stationID and rs.customerID = c.customerID 
ORDER BY tripNo,c.firstName;

#select paid reservation
SELECT r.reservationCode,p.paymentID,r.customerID,r.tripNo,p.paymentTime from reservation r ,payment p
where r.reservationCode = p.reservationCode;

#detailed reservation and payment (with time)
SELECT rs.reservationCode,c.firstName as CustomerFname,c.lastname as CustomerLName,t.tripNo,s1.stationName as DepartStation,s2.stationName as ArrivalStation,t.deptTime as DepartTime,t.arrvTime as ArrivalTime,r.fare,rs.reservationTime,p.paymentTime
from trip t, reservation rs,route r,station s1,station s2,customer c,payment p
where t.tripNo = rs.tripNo and t.routeID=r.routeID and r.deptStationID = s1.stationID and r.arrvStationID = s2.stationID and rs.customerID = c.customerID and p.reservationCode=rs.reservationCode
ORDER BY tripNo,c.firstName;

#select van_maintenance
SELECT v.vanID,vm.maintainNo ,e.firstname as Technician,vm.description
FROM van v ,van_maintenance vm,employee e
where v.vanID=vm.vanID and vm.techID = e.employeeID
ORDER BY v.vanID,vm.maintainNo;
