/*회원정보*/
CREATE TABLE t_user (
                        iuser INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                        uid VARCHAR(15) UNIQUE NOT NULL,
                        upw VARCHAR(100) NOT NULL,
                        nm VARCHAR(10) NOT NULL,
                        firsthnum VARCHAR(3),
                        secondhnum VARCHAR(4),
                        thirdhnum VARCHAR(4),
                        firstph VARCHAR(3) NOT NULL,
                        secondph VARCHAR(4) NOT NULL,
                        thirdph VARCHAR(4) NOT NULL,
                        social VARCHAR(10) DEFAULT NULL,
                        post_num VARCHAR(10),
                        load_nm VARCHAR(50),
                        lot_addr VARCHAR(50),
                        detail_addr VARCHAR(50),
                        ref VARCHAR(50),
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

/*리뷰정보*/
CREATE TABLE t_user_review(
                              ireview INT UNSIGNED AUTO_INCREMENT,
                              iboard INT UNSIGNED,
                              iuser INT UNSIGNED,
                              icategory TINYINT NOT NULL DEFAULT 4,
                              rating INT NOT NULL DEFAULT 0,
                              answer0 TINYINT UNSIGNED CHECK(answer0 IN (4, 5, 6)),
                              answer1 TINYINT UNSIGNED CHECK(answer1 IN (7, 8, 9)),
                              answer2 TINYINT UNSIGNED CHECK(answer2 IN (10, 11, 12)),
                              answer3 TINYINT UNSIGNED CHECK(answer3 IN (13, 14, 15)),
                              gender TINYINT UNSIGNED CHECK(gender IN (1, 2)),
                              tall VARCHAR(10),
                              weight VARCHAR(10),
                              title VARCHAR(50) NOT NULL,
                              ctnt VARCHAR(1000) NOT NULL,
                              prom_agree_flag BOOLEAN NOT NULL,
                              inf_agree_flag BOOLEAN NOT NULL DEFAULT FALSE,
                              FOREIGN KEY(iuser) REFERENCES t_user(iuser),
                              FOREIGN KEY(iboard) REFERENCES product_detail(iboard),
                              PRIMARY KEY (`ireview`, `iboard`, `iuser`)
);

/*게시판 리스트*/
CREATE TABLE t_board_list(
                             iboard INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                             icategory INT UNSIGNED NOT NULL,
                             iuser INT UNSIGNED NOT NULL,
                             title VARCHAR(50) NOT NULL,
                             ctnt VARCHAR(3000) NOT NULL,
                             notice CHAR(2) NOT NULL	DEFAULT('공지'),
                             rdt DATETIME DEFAULT CURRENT_TIMESTAMP()
);

/*상품 리스트*/
CREATE TABLE product_list (
                              iboard INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                              img_url_big VARCHAR(200) NOT NULL,
                              brand VARCHAR(20) NOT NULL,
                              title VARCHAR(110) NOT NULL,
                              price VARCHAR(30) NOT NULL,
                              category_num INT UNSIGNED,
                              gender TINYINT UNSIGNED CHECK(gender IN (1, 2, 3))
);

/*상세 상품 정보*/
CREATE TABLE product_detail (
                                idetail INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                                iboard INT UNSIGNED,
                                color INT UNSIGNED NOT NULL,
                                sm	INT UNSIGNED DEFAULT 100,
                                md	INT UNSIGNED DEFAULT 100,
                                lg	INT UNSIGNED DEFAULT 100,
                                xl	INT UNSIGNED DEFAULT 100,
                                FOREIGN KEY (iboard) REFERENCES product_list(iboard)
);

/*메인 메뉴 카테고리*/
CREATE TABLE t_board_category (
                                  icategory INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                                  categorynm VARCHAR(20) NOT NULL
);

/*물품 카테고리*/
CREATE TABLE t_board_sub_category(
                                     isubcategory INT UNSIGNED PRIMARY KEY,
                                     subcategorynm VARCHAR(30) NOT NULL
);

/*쿠폰*/
CREATE TABLE coupon (
                        icoupon INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                        cpnum VARCHAR(50) NOT NULL,
                        indexnum TINYINT UNSIGNED CHECK(indexnum IN (1, 2))
);

/*좋아요*/
CREATE TABLE t_board_like(
                             iboard INT UNSIGNED,
                             iuser INT UNSIGNED,
                             rdt DATETIME DEFAULT CURRENT_TIMESTAMP(),
                             PRIMARY KEY(iboard, iuser)
);

/*?*/
CREATE TABLE t_board_write (
                               iboard INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                               title VARCHAR(50) NOT NULL,
                               ctnt VARCHAR(1000) NOT NULL,
                               img VARCHAR(100) NOT NULL,
                               rdt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                               mdt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                               hits INT UNSIGNED NOT NULL DEFAULT 0
);

/*장바구니*/
CREATE TABLE cart (
                      icart INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                      iboard INT UNSIGNED NOT NULL,
                      iuser INT UNSIGNED NOT NULL,
                      color INT UNSIGNED NOT NULL,
                      sm	INT UNSIGNED NOT NULL DEFAULT 0,
                      md	INT UNSIGNED NOT NULL DEFAULT 0,
                      lg	INT UNSIGNED NOT NULL DEFAULT 0,
                      xl	INT UNSIGNED NOT NULL DEFAULT 0,
                      checked tinyint UNSIGNED DEFAULT 0,
                      FOREIGN KEY (iuser) REFERENCES t_user(iuser)
);

/*구매기록*/
CREATE TABLE purchased(
                          ipurchased INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                          iboard INT UNSIGNED NOT NULL,
                          iuser INT UNSIGNED  NOT NULL,
                          color INT UNSIGNED NOT NULL,
                          sm	INT UNSIGNED NOT NULL DEFAULT 0,
                          md	INT UNSIGNED NOT NULL DEFAULT 0,
                          lg	INT UNSIGNED NOT NULL DEFAULT 0,
                          xl	INT UNSIGNED NOT NULL DEFAULT 0,
                          FOREIGN KEY (iuser) REFERENCES t_user(iuser)
);

/*?*/
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

/*게시글 댓글*/
CREATE TABLE t_board_cmt(
                            icmt INT UNSIGNED AUTO_INCREMENT,
                            iboard INT UNSIGNED NOT NULL,
                            iuser INT UNSIGNED NOT NULL,
                            ctnt TEXT NOT NULL,
                            rdt DATETIME DEFAULT CURRENT_TIMESTAMP,
                            mdt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                            PRIMARY KEY (icmt)
);

/*주문창*/
CREATE TABLE t_order (
                         iorder INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
                         oname VARCHAR(10) NOT NULL,
                         oemail VARCHAR(50) NOT NULL,
                         ofirsthnum VARCHAR(3),
                         osecondhnum VARCHAR(4),
                         othirdhnum VARCHAR(4),
                         ofirstph VARCHAR(3) NOT NULL,
                         osecondph VARCHAR(4) NOT NULL,
                         othirdph VARCHAR(4) NOT NULL,
                         opost_num VARCHAR(10),
                         oload_nm VARCHAR(50),
                         olot_addr VARCHAR(50),
                         odetail_addr VARCHAR(50),
                         oref VARCHAR(50),
                         rname VARCHAR(10) NOT NULL,
                         rpost_num VARCHAR(10),
                         rload_nm VARCHAR(50),
                         rlot_addr VARCHAR(50),
                         rdetail_addr VARCHAR(50),
                         rref VARCHAR(50),
                         rfirsthnum VARCHAR(3),
                         rsecondhnum VARCHAR(4),
                         rthirdhnum VARCHAR(4),
                         rfirstph VARCHAR(3) NOT NULL,
                         rsecondph VARCHAR(4) NOT NULL,
                         rthirdph VARCHAR(4) NOT NULL,
                         msg VARCHAR(30),
                         pay_method TINYINT UNSIGNED CHECK(pay_method IN (1, 2)),
                         payagent_agree_flag BOOLEAN NOT NULL,
                         buy_date DATETIME DEFAULT CURRENT_TIMESTAMP()
);

/*메인 메뉴 카테고리 입력*/
INSERT INTO t_board_category
(categorynm)
VALUES
    ('notice'), ('q / a'), ('cart');

/*물품 카테고리 입력*/
INSERT INTO t_board_sub_category
(isubcategory, subcategorynm)
VALUES
    (1001, '반팔티셔츠'),
    (1002, '셔츠/블라우스'),
    (1003, ' 피케/카라 티셔츠'),
    (1004, '후드 티셔츠'),
    (1005, '맨투맨/스웨트셔츠'),
    (1006, '니트/스웨터'),
    (1008, '기타상의'),
    (1010, '긴팔 티셔츠'),
    (1011, '민소매 티셔츠');

