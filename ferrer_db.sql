CREATE TABLE DEPARTMENT (
    deptno CHAR(3) NOT NULL PRIMARY KEY,
    deptname VARCHAR(40) NOT NULL,
    mgrno CHAR(6),
    admrdept CHAR(3) NOT NULL,
    location VARCHAR(50)
);

CREATE TABLE EMPLOYEE (
    empno CHAR(6) NOT NULL PRIMARY KEY,
    firstname VARCHAR(30) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    midinit CHAR(1),
    workdept CHAR(3) NOT NULL,
    phoneno CHAR(11),
    hiredate DATE,
    job CHAR(15),
    edlevel SMALLINT CHECK(edlevel > 10 AND edlevel < 50),
    sex CHAR(1) CHECK(sex = 'M' OR sex = 'F'),
    birthdate DATE,
    salary DECIMAL(10,2) CHECK(salary > 0.00),
    bonus DECIMAL(8,2) CHECK(salary >= 0.00),
    comm DECIMAL(8,2) CHECK(comm >= 0.00)
);

CREATE TABLE PROJECT (
    projno CHAR(6) NOT NULL PRIMARY KEY,
    projname VARCHAR(30) NOT NULL,
    deptno CHAR(3) NOT NULL,
    respemp CHAR(6) NOT NULL,
    prstaff DECIMAL(5,2),
    prstdate DATE,
    prendate DATE,
    majproj CHAR(6)
);

CREATE TABLE EMP_ACT (
    empno CHAR(6) NOT NULL,
    projno CHAR(6) NOT NULL,
    actno SMALLINT NOT NULL,
    emptime DECIMAL(5,2),
    emstdate DATE,
    emendate DATE
);

CREATE TABLE CUSTOMER (
    custno INT NOT NULL PRIMARY KEY,
    custname VARCHAR(40) NOT NULL,
    custaddr VARCHAR(50),
    contactno CHAR(11),
    company VARCHAR(50),
    cusproj CHAR(6) NOT NULL
);

ALTER TABLE DEPARTMENT 
    ADD FOREIGN KEY(mgrno) REFERENCES EMPLOYEE(empno);

ALTER TABLE EMPLOYEE
    ADD FOREIGN KEY(workdept) REFERENCES DEPARTMENT(deptno);

ALTER TABLE DEPARTMENT 
    ADD FOREIGN KEY(admrdept) REFERENCES DEPARTMENT(deptno);

ALTER TABLE PROJECT
    ADD FOREIGN KEY(respemp) REFERENCES EMPLOYEE(empno);

ALTER TABLE PROJECT
    ADD FOREIGN KEY(deptno) REFERENCES DEPARTMENT(deptno);

ALTER TABLE EMP_ACT
    ADD FOREIGN KEY(empno) REFERENCES EMPLOYEE(empno);

ALTER TABLE EMP_ACT
    ADD FOREIGN KEY(projno) REFERENCES PROJECT(projno);

