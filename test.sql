CREATE OR REPLACE FUNCTION random_array(dim integer) RETURNS DOUBLE PRECISION[] AS $BODY$ begin return (select array_agg(random()) from generate_series(0, dim)); end $BODY$ LANGUAGE plpgsql;
DROP TABLE IF EXISTS lin_regr_test;
CREATE TABLE lin_regr_test as (SELECT random_array(5) as x, round(random()*10)::INTEGER as y, round(random()*1e4)::INTEGER as g  from generate_series(1,1000000));
DROP TABLE IF EXISTS lin_regr_test_out,lin_regr_test_out_summary;
SELECT madlib.linregr_train('lin_regr_test','lin_regr_test_out','y','x','g');
