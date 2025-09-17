CREATE DATABASE FERRER_DB;

USE FERRER_DB;

CREATE TABLE DEPARTMENT (
    deptno      CHAR(3)         NOT NULL PRIMARY KEY,
    deptname    VARCHAR(40)     NOT NULL,
    mgrno       CHAR(6),
    admrdept    CHAR(3)         NOT NULL,
    location    VARCHAR(50)
);

CREATE TABLE EMPLOYEE (
    empno       CHAR(6)         NOT NULL PRIMARY KEY,
    firstname   VARCHAR(30)     NOT NULL,
    lastname    VARCHAR(50)     NOT NULL,
    midinit     CHAR(1),
    workdept    CHAR(3)         NOT NULL,
    phoneno     CHAR(11),
    hiredate    DATE,
    job         CHAR(15),
    edlevel     SMALLINT        CHECK(edlevel > 10 AND edlevel < 50),
    sex         CHAR(1)         CHECK(sex IN('M','m','F','f')),
    birthdate   DATE,
    salary      DECIMAL(10,2)   CHECK(salary > 0.00),
    bonus       DECIMAL(8,2)    CHECK(bonus >= 0.00),
    comm        DECIMAL(8,2)    CHECK(comm >= 0.00)
);

CREATE TABLE PROJECT (
    projno      CHAR(6)         NOT NULL PRIMARY KEY,
    projname    VARCHAR(30)     NOT NULL,
    deptno      CHAR(3)         NOT NULL,
    respemp     CHAR(6)         NOT NULL,
    prstaff     DECIMAL(5,2),
    prstdate    DATE,
    prendate    DATE,
    majproj     CHAR(6)
);

CREATE TABLE EMP_ACT (
    empno       CHAR(6)         NOT NULL,
    projno      CHAR(6)         NOT NULL,
    actno       SMALLINT        NOT NULL,
    emptime     DECIMAL(5,2),
    emstdate    DATE,
    emendate    DATE
);

CREATE TABLE CUSTOMER (
    custno      INT             NOT NULL PRIMARY KEY,
    custname    VARCHAR(40)     NOT NULL,
    custaddr    VARCHAR(50),
    contactno   CHAR(11),
    company     VARCHAR(50),
    cusproj     CHAR(6)         NOT NULL
);

INSERT INTO DEPARTMENT (deptno, deptname, mgrno, admrdept, location) VALUES
    ('A00', 'SPIFFY COMPUTER SERVICE DIV.',  '000010', 'A00', '1ST FLR. ADMIN BLDG.'),
    ('B01', 'PLANNING',                      '000020', 'A00', '2ND FLR. ADMIN BLDG.'),
    ('C01', 'INFORMATION CENTER',            '000030', 'A00', 'GRND. FLR. MAIN BLDG.'),
    ('D01', 'DEVELOPMENT CENTER',            NULL,     'A00', '1ST FLR MAIN BLDG.'),
    ('D11', 'MANUFACTURING SYSTEMS',         '000060', 'D01', 'GRND, 1ST FLR. PRODUCTION BLDG.'),
    ('D21', 'ADMINISTRATION SYSTEMS',        '000070', 'D01', 'GRND. FLR ADMIN BLDG.'),
    ('E01', 'SUPPORT SERVICES',              '000050', 'A00', '2ND FLR. MAIN BLDG.'),
    ('E11', 'OPERATIONS',                    '000090', 'E01', '2ND FLR. PRODUCTION BLDG.'),
    ('E21', 'SOFTWARE SUPPORT',              '000100', 'E01', '3RD FLR. PRODUCTION BLDG.'),
    ('F22', 'BRANCH OFFICE 1',               NULL,     'E01', 'NORTH OFFICE'),
    ('G22', 'BRANCH OFFICE 2',               NULL,     'E11', 'SOUTH OFFICE'),
    ('H22', 'BRANCH OFFICE 3',               NULL,     'E11', 'EAST OFFICE'),
    ('I22', 'BRANCH OFFICE 4',               NULL,     'E21', 'WEST OFFICE'),
    ('J22', 'BRANCH OFFICE 5',               NULL,     'E21', 'NORTH EAST OFFICE'),
    ('K22', 'BRANCH OFFICE 6',               NULL,     'E21', 'SOUTH WEST OFFICE');

INSERT INTO EMPLOYEE (empno, firstname, midinit, lastname, workdept, phoneno, hiredate, job, edlevel, sex, birthdate, salary, bonus, comm) VALUES
    ('000010', 'CHRISTINE', 'I', 'HAAS',      'A00', '3978', '1995-01-01', 'PRES',      18, 'F', '1963-08-24', 152750.00, 1000.00, 4220.00),
    ('000020', 'MICHAEL',  'L',  'THOMPSON',  'B01', '3476', '2003-10-10', 'MANAGER',   18, 'M', '1978-02-02',  94250.00,  800.00, 3300.00),
    ('000030', 'SALLY',    'A',  'KWAN',      'C01', '4738', '2005-04-05', 'MANAGER',   20, 'F', '1971-05-11',  98250.00,  800.00, 3060.00),
    ('000050', 'JOHN',     'B',  'GEYER',     'E01', '6789', '1979-08-17', 'MANAGER',   16, 'M', '1955-09-15',  80175.00,  800.00, 3214.00),
    ('000060', 'IRVING',   'F',  'STERN',     'D11', '6423', '2003-09-14', 'MANAGER',   16, 'M', '1975-07-07',  72250.00,  500.00, 2580.00),
    ('000070', 'EVA',      'D',  'PULASKI',   'D21', '7831', '2005-09-30', 'MANAGER',   16, 'F', '2003-05-26',  96170.00,  700.00, 2893.00),
    ('000090', 'EILEEN',   'W',  'HENDERSON', 'E11', '5498', '2000-08-15', 'MANAGER',   16, 'F', '1971-05-15',  89750.00,  600.00, 2380.00),
    ('000100', 'THEODORE', 'Q',  'SPENSER',   'E21', '0972', '2000-06-19', 'MANAGER',   14, 'M', '1980-12-18',  86150.00,  500.00, 2092.00),
    ('000110', 'VINCENZO', 'G',  'LUCCHESSI', 'A00', '3490', '1988-05-16', 'SALESREP',  19, 'M', '1959-11-05',  66500.00,  900.00, 3720.00),
    ('000120', 'SEAN',     NULL, 'O''CONNELL','A00', '2167', '1993-12-05', 'CLERK',     14, 'M', '1972-10-18',  49250.00,  600.00, 2340.00),
    ('000130', 'DELORES',  'M',  'QUINTANA',  'C01', '4578', '2001-07-28', 'ANALYST',   16, 'F', '1955-09-15',  73800.00,  NULL,   1904.00),
    ('000140', 'HEATHER',  'A',  'NICHOLLS',  'C01', '1793', '2006-12-15', 'ANALYST',   18, 'F', '1976-01-19',  68420.00,  600.00, 2274.00),
    ('000150', 'BRUCE',    NULL, 'ADAMSON',   'D11', '4510', '2002-02-12', 'DESIGNER',  16, 'M', '1977-05-17',  55280.00,  500.00, 2022.00),
    ('000160', 'ELIZABETH','R',  'PIANKA',    'D11', '3782', '2006-10-11', 'DESIGNER',  17, 'F', '1980-04-12',  62250.00,  400.00, 1780.00),
    ('000170', 'MASATOSHI','J',  'YOSHIMURA', 'D11', '2890', '1999-09-15', 'DESIGNER',  16, 'M', '1981-01-05',  44680.00,  500.00, 1974.00),
    ('000180', 'MARILYN',  'S',  'SCOUTTEN',  'D11', '1682', '2003-07-07', 'DESIGNER',  17, 'F', '1979-02-21',  51340.00,  500.00, 1707.00),
    ('000190', 'JAMES',    'H',  'WALKER',    'D11', '2986', '2004-07-26', 'DESIGNER',  16, 'M', '1982-06-25',  50450.00,  400.00, 1636.00),
    ('000200', 'DAVID',    NULL, 'BROWN',     'D11', '4501', '2002-03-03', 'DESIGNER',  16, 'M', '1971-05-29',  57740.00,  600.00, 2217.00),
    ('000210', 'WILLIAM',  'T',  'JONES',     'D11', '0942', '1998-04-11', 'DESIGNER',  17, 'M', '2003-02-23',  68270.00,  400.00, 1462.00),
    ('000220', 'JENNIFER', 'K',  'LUTZ',      'D11', '0672', '1998-08-29', 'DESIGNER',  18, 'F', '1978-03-19',  49840.00,  600.00, 2387.00),
    ('000230', 'JAMES',    'J',  'JEFFERSON', 'D21', '2094', '1996-11-21', 'CLERK',     14, 'M', '1980-05-30',  42180.00,  400.00, 1774.00),
    ('000240', 'SALVATORE','M',  'MARINO',    'D21', '3780', '2004-12-05', 'CLERK',     17, 'M', '2002-03-31',  48760.00,  600.00, 2301.00),
    ('000250', 'DANIEL',   'S',  'SMITH',     'D21', '0961', '1999-10-30', 'CLERK',     15, 'M', '1969-11-12',  49180.00,  400.00, 1534.00),
    ('000260', 'SYBIL',    'P',  'JOHNSON',   'D21', '8953', '2005-09-11', 'CLERK',     16, 'F', '1976-10-05',  47250.00,  300.00, 1380.00),
    ('000270', 'MARIA',    'L',  'PEREZ',     'D21', '9001', '2006-09-30', 'CLERK',     15, 'F', '2003-05-26',  37380.00,  500.00, 2190.00),
    ('000280', 'ETHEL',    'R',  'SCHNEIDER', 'E11', '8997', '1997-03-24', 'OPERATOR',  17, 'F', '1976-03-28',  36250.00,  500.00, 2100.00),
    ('000290', 'JOHN',     'R',  'PARKER',    'E11', '4502', '2006-05-30', 'OPERATOR',  12, 'M', '1985-07-09',  35340.00,  300.00, 1227.00),
    ('000300', 'PHILIP',   'X',  'SMITH',     'E11', '2095', '2002-06-19', 'OPERATOR',  14, 'M', '1976-10-27',  37750.00,  400.00, NULL   ),
    ('000310', 'MAUDE',    'F',  'SETRIGHT',  'E11', '3332', '1994-09-12', 'OPERATOR',  12, 'F', '1961-04-21',  35900.00,  300.00, 1272.00),
    ('000320', 'RAMLAL',   'V',  'MEHTA',     'E21', '9990', '1995-07-07', 'FIELDREP',  16, 'M', '1962-08-11',  39950.00,  400.00, 1596.00),
    ('000330', 'WING',     NULL, 'LEE',       'E21', '2103', '2006-02-23', 'FIELDREP',  14, 'M', '1971-07-18',  45370.00,  500.00, 2030.00),
    ('000340', 'JASON',    'R',  'GOUNOT',    'E21', '5698', '1977-05-05', 'FIELDREP',  16, 'M', '1956-05-17',  43840.00,  500.00, 1907.00),
    ('200010', 'DIAN',     'J',  'HEMMINGER', 'A00', '3978', '1995-01-01', 'SALESREP',  18, 'F', '1973-08-14',  46500.00, 1000.00, 4220.00),
    ('200120', 'GREG',     NULL, 'ORLANDO',   'A00', '2167', '2002-05-05', 'CLERK',     14, 'M', '1972-10-18',  39250.00,  600.00, 2340.00),
    ('200140', 'KIM',      'N',  'NATZ',      'C01', '1793', '2006-12-15', 'ANALYST',   18, 'F', '1976-01-19',  68420.00,  NULL,   2274.00),
    ('200170', 'KIYOSHI',  NULL, 'YAMAMOTO',  'D11', '2890', '2005-09-15', 'DESIGNER',  16, 'M', '1981-01-05',  64680.00,  500.00, 1974.00),
    ('200220', 'REBA',     'K',  'JOHN',      'D11', '0672', '2005-08-29', 'DESIGNER',  18, 'F', '1978-03-19',  69840.00,  600.00, 2387.00),
    ('200240', 'ROBERT',   'M',  'MONTEVERDE','D21', '3780', '2004-12-05', 'CLERK',     17, 'M', '1984-03-31',  37760.00,  600.00, 2301.00),
    ('200280', 'EILEEN',   'R',  'SCHWARTZ',  'E11', '8997', '1997-03-24', 'OPERATOR',  17, 'F', '1966-03-28',  46250.00,  500.00, 2100.00),
    ('200310', 'MICHELLE', 'F',  'SPRINGER',  'E11', '3332', '1994-09-12', 'OPERATOR',  12, 'F', '1961-04-21',  35900.00,  300.00, NULL   ),
    ('200330', 'HELENA',   NULL, 'WONG',      'E21', '2103', '2006-02-23', 'FIELDREP',  14, 'F', '1971-07-18',  35370.00,  500.00, 2030.00),
    ('200340', 'ROY',      'R',  'ALONZO',    'E21', '5698', '1997-07-05', 'FIELDREP',  16, 'M', '1956-05-17',  31840.00,  500.00, 1907.00);

INSERT INTO PROJECT VALUES (projno, projname, deptno, respemp, prstaff, prstdate, prendate, majproj)
	('AD3100', 'ADMIN SERVICES',           'D01', '000010', 6.50, '2002-01-01', '2003-02-01', NULL),
	('AD3110', 'GENERAL ADMIN SYSTEMS',    'D21', '000070', 6.00, '2002-01-01', '2003-02-01', 'AD3100'),
	('AD3111', 'PAYROLL PROGRAMMING',      'D21', '000230', 2.00, '2002-01-01', '2003-02-01', 'AD3110'),
	('AD3112', 'PERSONNEL PROGRAMMING',    'D21', '000250', 1.00, '2002-01-01', '2003-02-01', 'AD3110'),
	('AD3113', 'ACCOUNT PROGRAMMING',      'D21', '000270', 2.00, '2002-01-01', '2003-02-01', 'AD3110'),
	('IF1000', 'QUERY SERVICES',           'C01', '000030', 2.00, '2002-01-01', '2003-02-01', NULL),
	('IF2000', 'USER EDUCATION',           'C01', '000030', 1.00, '2002-01-01', '2003-02-01', NULL),
	('MA2100', 'WELD LINE AUTOMATION',     'D01', '000010', 12.00,'2002-01-01', '2003-02-01', NULL),
	('MA2110', 'W L PROGRAMMING',          'D11', '000060', 9.00, '2002-01-01', '2003-02-01', 'MA2100'),
	('MA2111', 'W L PROGRAM DESIGN',       'D11', '000220', 2.00, '2002-01-01', '1982-12-01', 'MA2110'),
	('MA2112', 'W L ROBOT DESIGN',         'D11', '000150', 3.00, '2002-01-01', '1982-12-01', 'MA2100'),
	('MA2113', 'W L PROD CONT PROGS',      'D11', '000160', 3.00, '2002-02-15', '1982-12-01', 'MA2100'),
	('OP1000', 'OPERATION SUPPORT',        'E01', '000050', 6.00, '2002-01-01', '2003-02-01', NULL),
	('OP1010', 'OPERATION',                'E11', '000090', 5.00, '2002-01-01', '2003-02-01', 'OP1000'),
	('OP2000', 'GEN SYSTEMS SERVICES',     'E01', '000050', 5.00, '2002-01-01', '2003-02-01', NULL),
	('OP2010', 'SYSTEMS SUPPORT',          'E21', '000100', 4.00, '2002-01-01', '2003-02-01', 'OP2000'),
	('OP2011', 'SCP SYSTEMS SUPPORT',      'E21', '000320', 1.00, '2002-01-01', '2003-02-01', 'OP2010'),
	('OP2012', 'APPLICATIONS SUPPORT',     'E21', '000330', 1.00, '2002-01-01', '2003-02-01', 'OP2010'),
	('OP2013', 'DB/DC SUPPORT',            'E21', '000340', 1.00, '2002-01-01', '2003-02-01', 'OP2010'),
	('PL2100', 'WELD LINE PLANNING',       'B01', '000020', 1.00, '2002-01-01', '2002-09-15', 'MA2100');


    
INSERT INTO EMP_ACT (empno, projno, actno, emptime, emstdate, emendate) VALUES
	('000010',	'AD3100',	10,	    0.50,	'2002-01-01',	'2002-07-01'),
	('000070',	'AD3110',	10,	    1.00,	'2002-01-01',	'2003-02-01'),
	('000230',	'AD3111',	60,	    1.00,	'2002-01-01',	'2002-03-15'),
	('000230',	'AD3111',	60,	    0.50,	'2002-03-15',	'2002-04-15'),
	('000230',	'AD3111',	70,	    0.50,	'2002-03-15',	'2002-10-15'),
	('000230',	'AD3111',	80,	    0.50,	'2002-04-15',	'2002-10-15'),
	('000230',	'AD3111',	180,	0.50,	'2002-10-15',	'2003-01-01'),
	('000240',	'AD3111',	70,	    1.00,	'2002-02-15',	'2002-09-15'),
	('000240',	'AD3111',	80,	    1.00,	'2002-09-15',	'2003-01-01'),
	('000250',	'AD3112',	60,	    1.00,	'2002-01-01',	'2002-02-01'),
	('000250',	'AD3112',	60,	    0.50,	'2002-02-01',	'2002-03-15'),
	('000250',	'AD3112',	60,	    1.00,	'2003-01-01',	'2003-02-01'),
	('000250',	'AD3112',	70,	    0.50,	'2002-02-01',	'2002-03-15'),
	('000250',	'AD3112',	70,	    1.00,	'2002-03-15',	'2002-08-15'),
	('000250',	'AD3112',	70,	    0.25,	'2002-08-15',	'2002-10-15'),
	('000250',	'AD3112',	80,	    0.25,	'2002-08-15',	'2002-10-15'),
	('000250',	'AD3112',	80,	    0.50,	'2002-10-15',	'2002-12-01'),
	('000250',	'AD3112',	180,	0.50,	'2002-08-15',	'2003-01-01'),
	('000260',	'AD3113',	70,	    0.50,	'2002-06-15',	'2002-07-01'),
	('000260',	'AD3113',	70,	    1.00,	'2002-07-01',	'2003-02-01'),
	('000260',	'AD3113',	80,	    1.00,	'2002-01-01',	'2002-03-01'),
	('000260',	'AD3113',	80,	    0.50,	'2002-03-01',	'2002-04-15'),
	('000260',	'AD3113',	180,	0.50,	'2002-03-01',	'2002-04-15'),
	('000260',	'AD3113',	180,	1.00,	'2002-04-15',	'2002-06-01'),
	('000260',	'AD3113',	180,	1.00,	'2002-06-01',	'2002-07-01'),
	('000270',	'AD3113',	60,	    0.50,	'2002-03-01',	'2002-04-01'),
	('000270',	'AD3113',	60,	    1.00,	'2002-04-01',	'2002-09-01'),
	('000270',	'AD3113',	60,	    0.25,	'2002-09-01',	'2002-10-15'),
	('000270',	'AD3113',	70,	    0.75,	'2002-09-01',	'2002-10-15'),
	('000270',	'AD3113',	70,	    1.00,	'2002-10-15',	'2003-02-01'),
	('000270',	'AD3113',	80,	    1.00,	'2002-01-01',	'2002-03-01'),
	('000270',	'AD3113',	80,	    0.50,	'2002-03-01',	'2002-04-01'),
	('000030',	'IF1000',	10,	    0.50,	'2002-06-01',	'2003-01-01'),
	('000130',	'IF1000',	90,	    1.00,	'2002-10-01',	'2003-01-01'),
	('000130',	'IF1000',	100,	0.50,	'2002-10-01',	'2003-01-01'),
	('000140',	'IF1000',	90,	    0.50,	'2002-10-01',	'2003-01-01'),
	('000030',	'IF2000',	10,	    0.50,	'2002-01-01',	'2003-01-01'),
	('000140',	'IF2000',	100,	1.00,	'2002-01-01',	'2002-03-01'),
	('000140',	'IF2000',	100,	0.50,	'2002-03-01',	'2002-07-01'),
	('000140',	'IF2000',	110,	0.50,	'2002-03-01',	'2002-07-01'),
	('000140',	'IF2000',	110,	0.50,	'2002-10-01',	'2003-01-01'),
	('000010',	'MA2100',	10,	    0.50,	'2002-01-01',	'2002-11-01'),
	('000110',	'MA2100',	20,	    1.00,	'2002-01-01',	'2003-03-01'),
	('000010',	'MA2110',	10,	    1.00,	'2002-01-01',	'2003-02-01'),
	('000200',	'MA2111',	50,	    1.00,	'2002-01-01',	'2002-06-15'),
	('000200',	'MA2111',	60,	    1.00,	'2002-06-15',	'2003-02-01'),
	('000220',	'MA2111',	40,	    1.00,	'2002-01-01',	'2003-02-01'),
	('000150',	'MA2112',	60,	    1.00,	'2002-01-01',	'2002-07-15'),
	('000150',	'MA2112',	180,	1.00,	'2002-07-15',	'2003-02-01'),
	('000170',	'MA2112',	60,	    1.00,	'2002-01-01',	'2003-06-01'),
	('000170',	'MA2112',	70,	    1.00,	'2002-06-01',	'2003-02-01'),
	('000190',	'MA2112',	70,	    1.00,	'2002-01-01',	'2002-10-01'),
	('000190',	'MA2112',	80,	    1.00,	'2002-10-01',	'2003-10-01'),
	('000160',	'MA2113',	60,	    1.00,	'2002-07-15',	'2003-02-01'),
	('000170',	'MA2113',	80,	    1.00,	'2002-01-01',	'2003-02-01'),
	('000180',	'MA2113',	70,	    1.00,	'2002-04-01',	'2002-06-15'),
	('000210',	'MA2113',	80,	    0.50,	'2002-10-01',	'2003-02-01'),
	('000210',	'MA2113',	180,	0.50,	'2002-10-01',	'2003-02-01'),
	('000050',	'OP1000',	10,	    0.25,	'2002-01-01',	'2003-02-01'),
	('000090',	'OP1010',	10,	    1.00,	'2002-01-01',	'2003-02-01'),
	('000280',	'OP1010',	130,	1.00,	'2002-01-01',	'2003-02-01'),
	('000290',	'OP1010',	130,	1.00,	'2002-01-01',	'2003-02-01'),
	('000300',	'OP1010',	130,	1.00,	'2002-01-01',	'2003-02-01'),
	('000310',	'OP1010',	130,	1.00,	'2002-01-01',	'2003-02-01'),
	('000050',	'OP2010',	10,	    0.75,	'2002-01-01',	'2003-02-01'),
	('000100',	'OP2010',	10,	    1.00,	'2002-01-01',	'2003-02-01'),
	('000320',	'OP2011',	140,	0.75,	'2002-01-01',	'2003-02-01'),
	('000320',	'OP2011',	150,	0.25,	'2002-01-01',	'2003-02-01'),
	('000330',	'OP2012',	140,	0.25,	'2002-01-01',	'2003-02-01'),
	('000330',	'OP2012',	160,	0.75,	'2002-01-01',	'2003-02-01'),
	('000340',	'OP2013',	140,	0.50,	'2002-01-01',	'2003-02-01'),
	('000340',	'OP2013',	170,	0.50,	'2002-01-01',	'2003-02-01'),
	('000020',	'PL2100',	30,	    1.00,	'2002-01-01',	'2002-09-15');

    
INSERT INTO CUSTOMER (custno, custname, custaddr, contactno, company, cusproj) VALUES
	(1000,    'SILVESTER BILTS',   'FRANKFORT, KENTUCKY',     '09292547589', 'KAISER PERMANENTE', 'MA2100'),
	(1010,    'ADAM GRAY',         'RICHMOND, VIRGINIA',      '09276582456', 'VERIZON',           'IF1000'),
	(1020,    'JOSEPH JOHN ANDISS','AUSTIN, TEXAS',           '09374587152', 'COMCAST',           'AD3112'),
	(1030,    'RAY TORNS',         'COLUMBUS, OHIO',          '09401256892', 'CITI',              'AD3110'),
	(1040,    'ANDERSON BLISS',    'ALBANY, NEW YORK',        '09296854852', 'ACCENTURE',         'AD3111'),
	(1050,    'JONVAN MURRAY',     'LANSING, MICHIGAN',       '09401256864', 'LOCKHEED MARTIN',   'MA2110'),
	(1060,    'JAYMISOON JORMAN',  'BOISE, IDAHO',            '09364785692', 'NORTHROP',          'OP1010'),
	(1070,    'BRENT MADISSON',    'MONTGOMERY, ALABAMA',     '09984589242', 'FEDEX',             'MA2112'),
	(1080,    'DANVER MASON',      'PHOENIX, ARIZONA',        '09971923589', 'PWC',               'OP2012'),
	(1090,    'ROBERT NERO',       'DOVER, DELAWARE',         '09278752689', 'LOWE''S COMPANY',   'PL2100'),
	(1100,    'CLAIRE ABCERDO',    'LINCOLN, NEBRASKA',       '09326875942', 'DEUTSCHE TELECOM',  'OP2010'),
	(1110,    'HARRISON PARK',     'MADISON, WISCONSIN',      '09297859562', 'ELI LILLY',         'IF2000'),
	(1120,    'ELDEN ALIAO',       'CHEYENNE, WYOMING',       '09375689242', 'CAPITAL ONE',       'MA2113'),
	(1130,    'GREGORY PECK',      'COLUMBIA, SOUTH CAROLINA','09455895436', 'TETRA PAK',         'MA2111'),
	(1140,    'FAIRN JANICE MILL', 'SALT LAKE CITY, UTAH',    '09377485625', 'MEDTRONIC',         'OP2011'),
	(1150,    'LAIRY LARK',        'MONTPELIER, VERMONT',     '09409867535', 'CFGI CORP.',        'AD3113'),
	(1160,    'MAERSK SMELT',      'CHARLESTON, WEST VIRGINIA','09273458628','SYNCHRONY',        'OP2000'),
	(1170,    'PRONCE DONNAHEY',   'SALEM, OREGON',           '09423659547', 'ATLASSIAN',         'OP2013'),
	(1180,    'QUAILLE KAYES',     'JUNEAU, ALASKA',          '09368245726', 'VITESCO TECHNO',    'AD3100'),
	(1190,    'THOMY STACS',       'ATLANTA, GEORGIA',        '09462457824', 'ONE CENTRAL',       'OP1000');

ALTER TABLE EMPLOYEE
    ADD FOREIGN KEY(workdept) REFERENCES DEPARTMENT(deptno);

ALTER TABLE DEPARTMENT
    ADD FOREIGN KEY(mgrno) REFERENCES EMPLOYEE(empno);

ALTER TABLE DEPARTMENT
    ADD FOREIGN KEY(admrdept) REFERENCES DEPARTMENT(deptno);

ALTER TABLE PROJECT
    ADD FOREIGN KEY(deptno) REFERENCES DEPARTMENT(deptno);

ALTER TABLE PROJECT
    ADD FOREIGN KEY(respemp) REFERENCES EMPLOYEE(empno);

ALTER TABLE PROJECT
    ADD FOREIGN KEY(majproj) REFERENCES PROJECT(projno);

ALTER TABLE EMP_ACT
    ADD FOREIGN KEY(empno) REFERENCES EMPLOYEE(empno);

ALTER TABLE EMP_ACT
    ADD FOREIGN KEY(projno) REFERENCES PROJECT(projno);

ALTER TABLE CUSTOMER
    ADD FOREIGN KEY(cusproj) REFERENCES PROJECT(projno);