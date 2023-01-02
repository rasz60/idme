-- ���� ���� ���̺�
-- ������� 1. �г���, ���̵�, �ڵ��� ��ȣ UNIQUE
-- ������� 2. ��й�ȣ NOT NULL
-- ������� 3. ȸ�� ������ DATE DEFAULT SYSDATE
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

-- ȸ�� ��ȣ SEQ
CREATE SEQUENCE M_NO_SEQ NOCACHE;

-- idme_user TABLE & COLUMN COMMENT
COMMENT ON TABLE idme_members IS 'ȸ������';

COMMENT ON COLUMN idme_members.M_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN idme_members.M_NICKNAME IS 'ȸ�� �г���';
COMMENT ON COLUMN idme_members.M_BDAY IS 'ȸ�� �������';
COMMENT ON COLUMN idme_members.M_ID IS 'ȸ�� ���̵�';
COMMENT ON COLUMN idme_members.M_PWD IS 'ȸ�� ��й�ȣ';
COMMENT ON COLUMN idme_members.M_NAME IS 'ȸ�� �̸�';
COMMENT ON COLUMN idme_members.M_EMAIL IS 'ȸ�� �̸���';
COMMENT ON COLUMN idme_members.M_PHONE IS 'ȸ�� ��ȭ��ȣ';
COMMENT ON COLUMN idme_members.M_ADDRESS IS 'ȸ�� �ּ�';
COMMENT ON COLUMN idme_members.M_ENROLL_DATE IS 'ȸ�� ������';
COMMENT ON COLUMN idme_members.M_TYPE IS 'ȸ�� ���� / M: �����, A: ������';


-- ��ǰ ���� ���̺�
-- ������� 1. ȸ�� ��ȣ idme_user ���̺� ȸ����ȣ�� FOREIGN KEY ����
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

-- ��ǰ ��ȣ SEQ
CREATE SEQUENCE G_NO_SEQ NOCACHE;

-- idme_goods TABLE & COLUMN COMMENT
COMMENT ON TABLE idme_goods IS '��ǰ����';

COMMENT ON COLUMN idme_goods.G_NO IS '��ǰ ��ȣ';
COMMENT ON COLUMN idme_goods.G_NAME IS '��ǰ��';
COMMENT ON COLUMN idme_goods.G_CONTENT IS '��ǰ ����';
COMMENT ON COLUMN idme_goods.G_PRICE IS '��ǰ ����';
COMMENT ON COLUMN idme_goods.G_TYPE IS '��ǰ ����';
COMMENT ON COLUMN idme_goods.G_PHOTO IS '��ǰ ����';
COMMENT ON COLUMN idme_goods.M_NO IS 'ȸ�� ��ȣ';

CREATE TABLE idme_photos (
    G_NO            NUMBER          NOT NULL,
    P_PATH          VARCHAR2(2000)  NOT NULL,
    P_SEQ           NUMBER          NOT NULL,
    P_FILE_NAME     VARCHAR2(2000)  NOT NULL UNIQUE,
    
    CONSTRAINT fk_photos_g_no FOREIGN KEY(G_NO) REFERENCES idme_goods(G_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN idme_photos.G_NO IS '��ǰ ��ȣ';
COMMENT ON COLUMN idme_photos.P_PATH IS '���� ���';
COMMENT ON COLUMN idme_photos.P_SEQ IS '���� ��ȣ';
COMMENT ON COLUMN idme_photos.P_FILE_NAME IS '���� ���ϸ�';

commit;