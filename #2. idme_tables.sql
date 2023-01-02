-- 유저 정보 테이블
-- 변경사항 1. 닉네임, 아이디, 핸드폰 번호 UNIQUE
-- 변경사항 2. 비밀번호 NOT NULL
-- 변경사항 3. 회원 가입일 DATE DEFAULT SYSDATE
CREATE TABLE idme_members (
    M_NO            NUMBER               NOT NULL PRIMARY KEY,
    M_NICKNAME      VARCHAR2(50)         NOT NULL UNIQUE,
    M_BDAY          VARCHAR2(50)         NOT NULL,
    M_ID            VARCHAR2(50)         NOT NULL UNIQUE,
    M_PWD           VARCHAR2(100)        NOT NULL,
    M_NAME          VARCHAR2(100)        NOT NULL,
    M_EMAIL         VARCHAR2(50)         NULL,
    M_PHONE         VARCHAR2(50)         NOT NULL UNIQUE,
    M_ADDRESS       VARCHAR2(100)        NULL,
    M_ENROLL_DATE   DATE DEFAULT SYSDATE NOT NULL ,
    M_TYPE          CHAR(1)              NOT NULL
);

-- 회원 번호 SEQ
CREATE SEQUENCE M_NO_SEQ NOCACHE;

-- idme_user TABLE & COLUMN COMMENT
COMMENT ON TABLE idme_members IS '회원정보';

COMMENT ON COLUMN idme_members.M_NO IS '회원번호';
COMMENT ON COLUMN idme_members.M_NICKNAME IS '회원 닉네임';
COMMENT ON COLUMN idme_members.M_BDAY IS '회원 생년월일';
COMMENT ON COLUMN idme_members.M_ID IS '회원 아이디';
COMMENT ON COLUMN idme_members.M_PWD IS '회원 비밀번호';
COMMENT ON COLUMN idme_members.M_NAME IS '회원 이름';
COMMENT ON COLUMN idme_members.M_EMAIL IS '회원 이메일';
COMMENT ON COLUMN idme_members.M_PHONE IS '회원 전화번호';
COMMENT ON COLUMN idme_members.M_ADDRESS IS '회원 주소';
COMMENT ON COLUMN idme_members.M_ENROLL_DATE IS '회원 가입일';
COMMENT ON COLUMN idme_members.M_TYPE IS '회원 구분 / M: 사용자, A: 관리자';


-- 상품 정보 테이블
-- 변경사항 1. 회원 번호 idme_user 테이블 회원번호와 FOREIGN KEY 설정
CREATE TABLE idme_goods (
    G_NO            NUMBER          NOT NULL PRIMARY KEY,
    G_NAME          VARCHAR2(100)   NOT NULL,
    G_CONTENT       VARCHAR2(2000)  NOT NULL,
    G_PRICE         NUMBER          NOT NULL,
    G_TYPE          VARCHAR2(100)   NOT NULL,
    G_PHOTO         VARCHAR2(500)   NOT NULL,
    M_NO            NUMBER          NOT NULL,
    
    CONSTRAINT fk_goods_m_no FOREIGN KEY(M_NO) REFERENCES idme_members(M_NO) ON DELETE CASCADE
);

-- 상품 번호 SEQ
CREATE SEQUENCE G_NO_SEQ NOCACHE;

-- idme_goods TABLE & COLUMN COMMENT
COMMENT ON TABLE idme_goods IS '상품정보';

COMMENT ON COLUMN idme_goods.G_NO IS '상품 번호';
COMMENT ON COLUMN idme_goods.G_NAME IS '상품명';
COMMENT ON COLUMN idme_goods.G_CONTENT IS '상품 설명';
COMMENT ON COLUMN idme_goods.G_PRICE IS '상품 가격';
COMMENT ON COLUMN idme_goods.G_TYPE IS '상품 종류';
COMMENT ON COLUMN idme_goods.G_PHOTO IS '상품 사진';
COMMENT ON COLUMN idme_goods.M_NO IS '회원 번호';

CREATE TABLE idme_photos (
    G_NO            NUMBER          NOT NULL,
    P_PATH          VARCHAR2(2000)  NOT NULL,
    P_SEQ           NUMBER          NOT NULL,
    P_FILE_NAME     VARCHAR2(2000)  NOT NULL UNIQUE,
    
    CONSTRAINT fk_photos_g_no FOREIGN KEY(G_NO) REFERENCES idme_goods(G_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN idme_photos.G_NO IS '상품 번호';
COMMENT ON COLUMN idme_photos.P_PATH IS '사진 경로';
COMMENT ON COLUMN idme_photos.P_SEQ IS '사진 번호';
COMMENT ON COLUMN idme_photos.P_FILE_NAME IS '사진 파일명';

commit;