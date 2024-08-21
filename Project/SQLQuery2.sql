CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Photo  Varbinary NOT NULL,
	EmployeeName NVARCHAR(20),
	Email VARCHAR(50) NOT NULL,
);

create table Finance (
	FinanceID INT Primary Key,
	FinancePassword NVARCHAR(50) NOT NULL,
	FinanceName NVARCHAR(20) NOT NULL,
	Username VARCHAR(20) NOT NULL,
);

create table Medicines (
	MedicineID INT Primary Key,
	MedicineName NVARCHAR(20) NOT NULL,
	Price Float NOT NULL,
);

create table Tests (
	TestID INT Primary Key,
	TestName NVARCHAR(20) NOT NULL,
	Price Float NOT NULL,
);

create table Departments (
	DepartmentID INT Primary Key,
	DepartmentName NVARCHAR(20) NOT NULL,
);

create table MiddleMan (
	MMID INT Primary Key,
	Username NVARCHAR(20) NOT NULL,
	MMName NVARCHAR(20),
	Email VARCHAR(50) NOT NULL,
	MMPassword NVARCHAR(50) NOT NULL,
);

create table MedicalField (
	MFID INT Primary Key,
	MMID INT,
	Username NVARCHAR(20) NOT NULL,
	MMName NVARCHAR(20),
	Email VARCHAR(50) NOT NULL,
	MFPassword NVARCHAR(50) NOT NULL,
	Hotline INT NOT NULL,
	MFAddress NVARCHAR(50) NOT NULL,
	MFType NVARCHAR(25) NOT NULL,
	CONSTRAINT FK_MedicalField FOREIGN KEY (MMID) REFERENCES MiddleMan(MMID)
);

create table Doctor (
	DoctorID INT Primary Key,
	DepartmentID INT,
	Username NVARCHAR(20) NOT NULL,
	Price Float Not Null,
	DoctorName NVARCHAR(20),
	Position VARCHAR(25) NOT NULL,
	DoctorPassword NVARCHAR(50) NOT NULL,
	Mobile INT NOT NULL,
	MFID INT,
	CONSTRAINT FK_Doctor FOREIGN KEY (MFID) REFERENCES MedicalField(MFID)
);

create table Timetable (
	SlotID INT Primary Key,
	DoctorID INT,
	TTDay  Date NOT NULL,
	StartTime Time Not Null,
	EndTime Time Not Null,
	CONSTRAINT FK_TimeTable FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

create table Appointments (
	AppointmentID INT Primary Key,
	SlotID INT,
	EmployeeID INT,
	ApStatus bit Not Null,
	Diagnosis varchar(MAX) Not Null,
	CONSTRAINT FK_Appointment_TimeTable FOREIGN KEY (SlotID) REFERENCES Timetable(SlotID),
	CONSTRAINT FK_Appointment_Employee FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

create table Prescriptions (
	PrescriptionID INT Primary Key,
	AppointmentID INT,
	PayStatus bit Not Null,
	CONSTRAINT FK_Prescription FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

create table PrescriptionsDetails (
	DetailID INT Primary Key,
	PrescriptionID INT,
	ApprovalStatus bit Not Null,
	Amount Int Not Null,
	Frequency Int Not Null,
	Notes Varchar(300),
	MedicineID Int,
	CONSTRAINT FK_PrescriptionDetails FOREIGN KEY (PrescriptionID) REFERENCES Prescriptions(PrescriptionID),
	CONSTRAINT FK_PrescriptionDetails_Medicine FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID)

);

create table LabReports (
	ReportID INT Primary Key,
	AppointmentID INT,
	PayStatus bit Not Null,
	LabName varchar(25) Not Null,
	ReportDate Date Not Null,
	ReportPDF varbinary(max) Not Null,
	CONSTRAINT FK_LabReports FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)

);

create table LabReportsDetails (
	DetailID INT Primary Key,
	ReportID INT,
	TestID INT,
	ApprovalStatus bit Not Null,
	CONSTRAINT FK_LabReportsDetails_Report FOREIGN KEY (ReportID) REFERENCES LabReports(ReportID),
	CONSTRAINT FK_LabReportsDetails_Test FOREIGN KEY (TestID) REFERENCES Tests(TestID)
);

