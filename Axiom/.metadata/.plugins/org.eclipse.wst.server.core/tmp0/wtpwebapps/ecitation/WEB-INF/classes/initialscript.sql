INSERT INTO `ecitation`.`user` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `EMAIL`, `EMPNO`, `FIRST_NAME`, `LAST_NAME`, `PASSWORD`, `USER_NAME`, `DEPT_ID`) VALUES ('1', NULL, NULL, NULL, NULL, NULL, '20118', 'Helen', 'Valenzuela', '$2a$10$SidhvqyMs8VWkoB8LXDWh.Uyk.MaKId6dQqfK.CGvW8KfnkS66zyK', '20118', NULL);
INSERT INTO `ecitation`.`user` (`id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `EMAIL`, `EMPNO`, `FIRST_NAME`, `LAST_NAME`, `PASSWORD`, `USER_NAME`, `DEPT_ID`) VALUES ('2', NULL, NULL, NULL, NULL, NULL, '86573', 'Shahriar', 'Khodadadi', '$2a$10$Dp.EKMxhNhDzwU1NCPFP5.82g2oKp0zirFtNEIPEq2Tlj2pUCNg8a', '86573', NULL);
insert into `ecitation`.`USER_TYPE`(id,`TYPE`) values (1,'SuperAdmin');
insert into `ecitation`.`USER_TYPE`(id,`TYPE`) values (2,'Admin');
insert into `ecitation`.`USER_TYPE`(id,`TYPE`) values (3,'User');
insert into `ecitation`.`ROLE`(id,`NAME`,`USR_TYP_ID`) values (1,'SuperAdmin',1);
insert into `ecitation`.`ROLE`(id,`NAME`,`USR_TYP_ID`) values (2,'Admin',2);
insert into `ecitation`.`ROLE`(id,`NAME`,`USR_TYP_ID`) values (3,'User',3);
insert into `ecitation`.`USER_ROLE`(ROLE_ID,USER_ID) values (1,1);
insert into `ecitation`.`USER_ROLE`(ROLE_ID,USER_ID) values (2,2); 
INSERT INTO `ecitation`.`UPLOAD_RECORDS_FILE` (`RECORDS_FTYPE`) VALUES ('Inspector');
INSERT INTO `ecitation`.`UPLOAD_RECORDS_FILE` (`RECORDS_FTYPE`) VALUES ('User');