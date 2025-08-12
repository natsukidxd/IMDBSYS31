CREATE TABLE `department` (
  `depto` char(3) NOT NULL,
  `deptname` varchar(40) NOT NULL,
  `mgrno` char(6) DEFAULT NULL,
  `admrdept` char(3) NOT NULL,
  `location` char(5) DEFAULT NULL
);

CREATE TABLE `emp_act` (
  `empno` char(6) NOT NULL,
  `projno` char(6) NOT NULL,
  `actno` smallint NOT NULL,
  `emptime` decimal(5,2) DEFAULT NULL,
  `emstdate` date DEFAULT NULL,
  `emendate` date DEFAULT NULL
);

CREATE TABLE `employee` (
  `empno` char(6) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `midinit` char(1) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `workdept` char(3) DEFAULT NULL,
  `phoneno` char(11) DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `job` char(10) DEFAULT NULL,
  `edlevel` smallint DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `bonus` decimal(9,2) DEFAULT NULL,
  `comm` decimal(9,2) DEFAULT NULL,
  CONSTRAINT `employee_chk_1` CHECK ((`gender` in ('M','F')))
);

CREATE TABLE `project` (
  `projno` char(6) NOT NULL,
  `projname` varchar(30) NOT NULL,
  `deptno` char(3) NOT NULL,
  `respemp` char(3) NOT NULL,
  `prstaff` decimal(5,2) DEFAULT NULL,
  `prstdate` date DEFAULT NULL,
  `prendate` date DEFAULT NULL,
  `majproj` char(6) DEFAULT NULL
);