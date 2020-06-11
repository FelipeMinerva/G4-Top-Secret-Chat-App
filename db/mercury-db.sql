create table TB_GROUP (
    ID_GROUP int generated by default as identity primary key,
    NM_GROUP_NAME varchar(255) not null
);
create table TB_USER (
     ID_USER int generated by default as identity PRIMARY KEY
    ,NM_USER_NAME varchar(255) not null
    ,TX_EMAIL varchar(255) NOT NULL
);

create unique index concurrently "IX_EMAIL"
on TB_USER using btree(TX_EMAIL);

create table TB_USER_GROUP (
    FK_USER int NOT NULL,
    FK_GROUP int NOT NULL,
    PRIMARY KEY(FK_USER, FK_GROUP),
    CONSTRAINT FK_USER_GROUP_USER FOREIGN KEY (FK_USER) REFERENCES TB_USER (ID_USER) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT FK_USER_GROUP_GROUP FOREIGN KEY (FK_GROUP) REFERENCES TB_GROUP (ID_GROUP) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
create table TB_MESSAGE (
    id_message int generated by default as identity primary key,
    tx_message varchar(1023) not null,
    fk_user int not null,
    fk_group int not null,
    dt_timestamp TIMESTAMP,

    CONSTRAINT FK_MESSAGE_USER FOREIGN KEY (FK_USER) REFERENCES TB_USER (ID_USER) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT FK_MESSAGE_GROUP FOREIGN KEY (FK_GROUP) REFERENCES TB_GROUP (ID_GROUP) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);