-- Active: 1758675368804@@127.0.0.1@3306@market
-- 셀프체크
-- 8장에서 만든 market DB의 상품 중 가격이 낮은 하위 4개의 누적 매출을 다음과 같이 조회하고 싶습니다.
-- 이를 위한 쿼리를 작성하세요.
-- (ch08_09_market_db.png 참고)

-- ----------------------------------
-- 상품명        | 가격     | 누적 매출
-- ----------------------------------
-- 플레인 베이글  | 1300    | 6500
-- 우유 900ml    | 1970    | 9850
-- 크림 치즈      | 2180    | 8720
-- 우유 식빵      | 2900    | 8700

-- 누적 매출은 price * count(가격 * 판매 수량)으로 구합니다.

USE market;

SELECT p.name AS 상품명, p.price AS 가격 , SUM(p.price * od.count) AS '누적 매출'
FROM products p
JOIN order_details od ON p.id = od.product_id
JOIN orders o ON o.id = od.order_id
  AND NOT o.status = '장바구니'
GROUP BY p.id
ORDER BY p.price
LIMIT 4;


