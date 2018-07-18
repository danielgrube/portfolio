CREATE OR REPLACE FUNCTION is_next_movie_free(
  customer_ID INTEGER
)RETURNS BOOLEAN AS $$
  DECLARE
    total_rental INTEGER;
  BEGIN
      SELECT COUNT(public.rental.rental_id) INTO total_rental
      FROM rental
      WHERE public.rental.customer_id = customer_ID ;
    IF total_rental % 10 = 1 THEN
      RAISE NOTICE 'Next movie will be free';
      RETURN TRUE;
    END IF;
    RETURN FALSE;
  END; $$
  LANGUAGE plpgsql;

SELECT is_next_movie_free(1);

--This is as far as I got, just the stored procedure.