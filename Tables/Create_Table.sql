-- Account 1
drop table Account cascade constraints;
create table Account
(account_ID varchar2(10) NOT NULL,
registration_ID varchar2(10) NOT NULL,
fName varchar2(20) NOT NULL,
lName varchar2(40) NOT NULL,
email varchar2(320) NOT NULL,
cell_Num char(12) NULL,
logon_ID varchar2(20) NOT NULL,
password varchar2(32) NOT NULL,
create_Date DATE NOT NULL,
account_Type char(1) NOT NULL,
constraint account_Type check(account_Type IN ('P','B')),
constraint account_pk primary key (account_ID));

-- Item 2
drop table item cascade constraints;
create table item
(item_ID varchar2(10) not null,
sku char(8) not null,
name varchar2(40) not null,
price number(12,2) not null,
item_desc varchar2(100) null,
category varchar2(10) null,
stock number(5) not null,
item_star number(1) null,
itme_sizes varchar2(5) null,
color varchar2(20) null,
constraint item_pk primary key (item_id));

-- CARD 3
drop table CARD cascade constraints;
create table CARD
(card_number VARCHAR2(16) not null,
cc_name VARCHAR2(40) not null,
pin CHAR(4) not null,
b_street VARCHAR2(40),
b_city VARCHAR2(20),
b_state CHAR(2),
b_zip CHAR(10),
constraint Card_PK primary Key (Card_Number));

-- Customer_Order 4
drop table Customer_Order cascade constraints;
create table Customer_Order
(order_ID varchar2(10) NOT NULL,
account_ID varchar2(10) NOT NULL,
s_street varchar2(40) NULL,
s_City varchar2(20) NULL,
s_State CHAR(2) NOT NULL,
s_Zip CHAR(10) NULL,
order_date DATE NULL,
receiver_name varchar2(40) NOT NULL,
delivery_date DATE NULL,
dispatch_date DATE NULL,
constraint Customer_Order_pk primary key (order_ID),
constraint account_order foreign key (account_ID) references Account);


-- Order_Item 5
drop table Order_Item cascade constraints;
create table Order_Item
(order_ID varchar2(10) NOT NULL,
order_item_ID varchar2(10) NOT NULL,
item_ID varchar2(10) NOT NULL,
discounted_price number(12,2) NOT NULL,
quantity number(20) NOT NULL,
constraint order_item_pk primary key (order_ID, order_item_ID),
constraint order_id foreign key (order_ID) references Customer_Order,
constraint item_id foreign key (item_ID) references Item);

-- ORDER_STATUS 6
drop table ORDER_STATUS cascade constraints;
create table ORDER_STATUS
(status_Order_ID VARCHAR2(10) not null,
status varchar2(40) null,
status_Timestamp varchar2(20) null,
constraint Status_PK primary key (Status_Order_ID, Status_Timestamp),
constraint STATUS_fk_Order foreign key (status_order_ID) references Customer_Order(order_ID));

-- Payment 7
drop table Payment cascade constraints;
create table Payment
(payment_id varchar2(10) NOT NULL,
order_id varchar2(10) NOT NULL,
payment_date DATE NULL,
total_amount NUMBER(12,2) NULL,
card_n varchar2(16) NULL,
constraint Payment_pk primary key (payment_id),
constraint Payment_fk_CARDNUM foreign key (card_n) references Card(card_number),
constraint Payment_fk_Customer_Order foreign key (order_id) references Customer_Order(order_id));

-- Returns 8
drop table Returns cascade constraints;
create table Returns
(returns_ID varchar2(10) NOT NULL,
refund_amount number(12,2) NOT NULL,
returns_date date NOT NULL,
order_ID varchar2(10) NOT NULL,
card_n varchar2(16) NOT NULL,
constraint returns_pk primary key (returns_ID),
constraint returns_order foreign key (order_ID) references Customer_Order,
constraint c_card foreign key (card_n) references Card);

-- Return_line_item 9
drop table Return_line_item cascade constraints;
create table Return_line_item
(return_ID varchar2(10) NOT NULL,
return_item_ID varchar2(10) NOT NULL,
quantity NUMBER(20) NOT NULL,
order_item varchar2(10) NOT NULL,
order_ID varchar2(10) NOT NULL,
constraint Return_line_item_pk primary key (return_ID, return_item_ID),
constraint Return_line_item_fk_RETURN foreign key (return_ID) references Returns(returns_ID),
constraint Return_line_fk_id_ITEM foreign key (order_ID,order_item) references Order_Item(order_ID, order_item_ID)
);


-- Review 10
drop table Review cascade constraints;
create table Review
(review_ID varchar2(10) NOT NULL,
r_star number(12,2) NOT NULL,
comments varchar2(255),
reviewDate date NOT NULL,
useful_flag number(1),
num_of_words number(3),
review_account varchar(10) NOT NULL,
review_item varchar(10) NOT NULL,
constraint useful_flag check(useful_flag IN (1,0)),
constraint review_pk primary key (review_ID),
constraint r_account foreign key (review_account) references Account,
constraint r_item foreign key (review_item) references Item);

-- Save_For_Later 11
drop table Save_For_Later cascade constraints;
create table Save_For_Later
(sfl_account_ID varchar2(10) NOT NULL,
sfl_ID varchar2(10) NOT NULL,
sfl_item_ID varchar2(10) NOT NULL,
save_Date DATE NOT NULL,
constraint Save_For_Later_pk primary key (sfl_account_ID, sfl_ID),
constraint Save_For_Later_fk_ACCOUNT foreign key (sfl_account_ID) references Account(account_ID),
constraint Save_For_Later_fk_ITEM foreign key (sfl_item_ID) references Item(item_ID));