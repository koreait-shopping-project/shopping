CREATE TABLE board_list (
                            iboard INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                            img_url VARCHAR(200) NOT NULL,
                            brand VARCHAR(20) NOT NULL,
                            title VARCHAR(110) NOT NULL,
                            price VARCHAR(30) NOT NULL,
                            category_num INT UNSIGNED,
                            gender TINYINT UNSIGNED CHECK(gender IN (1, 2, 3))
);

CREATE TABLE board_Detail (
                              idetail INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                              iboard INT UNSIGNED,
                              color INT UNSIGNED NOT NULL,
                              sm	INT UNSIGNED DEFAULT 100,
                              md	INT UNSIGNED DEFAULT 100,
                              lg	INT UNSIGNED DEFAULT 100,
                              xl	INT UNSIGNED DEFAULT 100,
                              FOREIGN KEY (iboard) REFERENCES board_list(iboard)
);

CREATE TABLE t_board_category (
                                  icategory INT UNSIGNED PRIMARY KEY AUTO_shoppingINCREMENT,
                                  categorynm VARCHAR(20) NOT NULL
);

CREATE TABLE t_board_sub_category(
                                     isubcategory INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                                     subcategorynm VARCHAR(30) NOT NULL
);

CREATE TABLE t_user (
                        iuser INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                        uid VARCHAR(15) UNIQUE NOT NULL,
                        upw VARCHAR(100) NOT NULL,
                        nm VARCHAR(10) NOT NULL,
                        hnum VARCHAR(12),
                        ph VARCHAR(13) NOT NULL,
                        social VARCHAR(10),
                        post_num VARCHAR(10),
                        load_nm VARCHAR(50),
                        lot_addr VARCHAR(10),
                        detail_addr VARCHAR(20),
                        ref VARCHAR(10),
                        gender TINYINT UNSIGNED CHECK(gender IN (1, 2)),
                        email VARCHAR(50) UNIQUE NOT NULL,
                        birth VARCHAR(6) NOT NULL,
                        location VARCHAR(10),
                        recommendation VARCHAR(15),
                        admin_flag BOOLEAN NOT NULL DEFAULT FALSE,
                        email_agree_flag BOOLEAN NOT NULL DEFAULT FALSE,
                        sms_agree_flag BOOLEAN NOT NULL DEFAULT FALSE,
                        join_date DATETIME DEFAULT CURRENT_TIMESTAMP(),
                        mod_date DATETIME DEFAULT CURRENT_TIMESTAMP()
);

CREATE TABLE merchandise (
                             iboard INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                             itemimg VARCHAR(50) NOT NULL,
                             price INT UNSIGNED NOT NULL,
                             color VARCHAR(15) NOT NULL,
                             size INT UNSIGNED NOT NULL,
                             sale INT UNSIGNED NOT NULL,
                             num INT UNSIGNED NOT NULL
);

CREATE TABLE coupon (
                        icoupon INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                        cpnum VARCHAR(50) NOT NULL,
                        indexnum TINYINT UNSIGNED CHECK(indexnum IN (1, 2))
);

CREATE TABLE t_board_category (
                                  icategory INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                                  categorynm VARCHAR(20) NOT NULL
);

CREATE TABLE t_board_sub_category(
                                     isubcategory INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                                     subcategorynm VARCHAR(30) NOT NULL
);

CREATE TABLE t_board_write (
                               iboard INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                               title VARCHAR(50) NOT NULL,
                               ctnt VARCHAR(1000) NOT NULL,
                               img VARCHAR(100) NOT NULL,
                               rdt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                               mdt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                               hits INT UNSIGNED NOT NULL DEFAULT 0
);

CREATE TABLE cart (
                      icart INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                      items VARCHAR(50) NOT NULL,
                      num INT UNSIGNED NOT NULL,
                      size VARCHAR(10) NOT NULL
);

CREATE TABLE addrinfo (
                          iaddr INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                          addr VARCHAR(30) NOT NULL,
                          addrnum VARCHAR(10) NOT NULL,
                          baddr VARCHAR(20) NOT NULL,
                          oaddr VARCHAR(20) NOT NULL,
                          hnum VARCHAR(12) NOT NULL,
                          ph VARCHAR(13) NOT NULL,
                          automsg VARCHAR(50) NOT NULL
);

INSERT INTO t_board_category
(categorynm)
VALUES
    ('notice'), ('q / a'), ('review'), ('cart');

INSERT INTO t_board_sub_category
(subcategorynm)
VALUES
    ('new'), ('best'), ('outer'), ('top'), ('bottom'),
    ('dress'), ('shoes'), ('etc'), ('only');