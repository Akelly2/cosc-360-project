drop table Post;
drop table Comment;
drop table User;

create table User (
    userid int AUTO_INCREMENT,
    username varchar(255),
    email varchar(255),
    password varchar(255),
    isadmin boolean,
    primary key (userid)
);

create table Post (
    postid int AUTO_INCREMENT,
    title varchar(255),
    content text,
    userid int,
    primary key (postid),
    foreign key(userid)
        references User(userid)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);

create table Comment (
    commentid int auto_increment,
    content text,
    isparent boolean,
    parentid int,
    userid int,
    postid int,
    primary key (commentid),
    foreign key(userid)
        references User(userid)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    foreign key(postid)
        references Post(postid)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);