
-- MEMBER INSERT
INSERT INTO idme_members (m_no, m_nickname, m_bday, m_id, m_pwd, m_name, m_email, m_phone, m_address, m_type)
       VALUES (M_NO_SEQ.nextval, 'rasz_sixt', '1991/03/07', 'rassayz60', 'idme1234!@', '������', 'rassayzsixt@gmail.com', '010-2113-8583', '����� ������', 'A');



-- GOODS INSERT
INSERT INTO idme_goods (g_no, g_name, g_content, g_price, g_type, g_photo, m_no)
       VALUES (G_NO_SEQ.nextval, '��Ƽ����', '�ƿ�� ��Ƽ����', '5800', 'bread', '/image/1.jpg', 1);

commit;
