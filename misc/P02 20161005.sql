/*
登录名 	总存款金额	总取款金额	首存优惠金额	有效投注额	客户输赢
*/

SELECT R.ID,
       A.LOGIN_NAME,
       A.D_AMOUNT,
       A.W_AMOUNT,
       A.DF_AMOUNT,
       B.VALID_ACCOUNT,
       B.CUS_ACCOUNT
  FROM RICKY_TMP R,
       (SELECT LOGIN_NAME, D_AMOUNT, W_AMOUNT, DF_AMOUNT
          FROM MID_ACCOUNT_BYMONTH
         WHERE STAT_MONTH = '2016-10') A,
       (SELECT LOGIN_NAME, VALID_ACCOUNT, CUS_ACCOUNT
          FROM MID_ORDERS_BYMONTH
         WHERE STAT_MONTH = '2016-10') B
 WHERE R.NAME = A.LOGIN_NAME(+)
   AND R.NAME = B.LOGIN_NAME(+)
   ORDER BY ID;
   