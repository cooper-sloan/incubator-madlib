\timing on

-- Testing n_layers
DROP TABLE IF EXISTS mlp_out, mlp_out_summary;
SELECT SCHEMA_MADLIB.mlp_classification('mlp_1e6_1e1', 'mlp_out', 'x', 'y', ARRAY[50], 'tolerance=0, n_iterations=10', 'sigmoid', NULL, FALSE, FALSE);
DROP TABLE IF EXISTS mlp_out, mlp_out_summary;
SELECT SCHEMA_MADLIB.mlp_classification('mlp_1e6_1e1', 'mlp_out', 'x', 'y', ARRAY[50, 50], 'tolerance=0, n_iterations=10', 'sigmoid', NULL, FALSE, FALSE);
DROP TABLE IF EXISTS mlp_out, mlp_out_summary;
SELECT SCHEMA_MADLIB.mlp_classification('mlp_1e6_1e1', 'mlp_out', 'x', 'y', ARRAY[50, 50, 50], 'tolerance=0, n_iterations=10', 'sigmoid', NULL, FALSE, FALSE);
DROP TABLE IF EXISTS mlp_out, mlp_out_summary;
SELECT SCHEMA_MADLIB.mlp_classification('mlp_1e6_1e1', 'mlp_out', 'x', 'y', ARRAY[50, 50, 50, 50], 'tolerance=0, n_iterations=10', 'sigmoid', NULL, FALSE, FALSE);

-- Testing n_units
DROP TABLE IF EXISTS mlp_out, mlp_out_summary;
SELECT SCHEMA_MADLIB.mlp_classification('mlp_1e6_1e1', 'mlp_out', 'x', 'y', ARRAY[10], 'tolerance=0, n_iterations=10', 'sigmoid', NULL, FALSE, FALSE);
DROP TABLE IF EXISTS mlp_out, mlp_out_summary;
SELECT SCHEMA_MADLIB.mlp_classification('mlp_1e6_1e1', 'mlp_out', 'x', 'y', ARRAY[100], 'tolerance=0, n_iterations=10', 'sigmoid', NULL, FALSE, FALSE);
DROP TABLE IF EXISTS mlp_out, mlp_out_summary;
SELECT SCHEMA_MADLIB.mlp_classification('mlp_1e6_1e1', 'mlp_out', 'x', 'y', ARRAY[1000], 'tolerance=0, n_iterations=10', 'sigmoid', NULL, FALSE, FALSE);

-- Testing rows
DROP TABLE IF EXISTS mlp_out, mlp_out_summary;
SELECT SCHEMA_MADLIB.mlp_classification('mlp_1e6_1e1', 'mlp_out', 'x', 'y', ARRAY[50, 50], 'tolerance=0, n_iterations=10', 'sigmoid', NULL, FALSE, FALSE);
DROP TABLE IF EXISTS mlp_out, mlp_out_summary;
SELECT SCHEMA_MADLIB.mlp_classification('mlp_1e7_1e1', 'mlp_out', 'x', 'y', ARRAY[50, 50], 'tolerance=0, n_iterations=10', 'sigmoid', NULL, FALSE, FALSE);
DROP TABLE IF EXISTS mlp_out, mlp_out_summary;
SELECT SCHEMA_MADLIB.mlp_classification('mlp_1e8_1e1', 'mlp_out', 'x', 'y', ARRAY[50, 50], 'tolerance=0, n_iterations=10', 'sigmoid', NULL, FALSE, FALSE);

-- Testing features
DROP TABLE IF EXISTS mlp_out, mlp_out_summary;
SELECT SCHEMA_MADLIB.mlp_classification('mlp_1e6_1e1', 'mlp_out', 'x', 'y', ARRAY[50, 50], 'tolerance=0, n_iterations=10', 'sigmoid', NULL, FALSE, FALSE);
DROP TABLE IF EXISTS mlp_out, mlp_out_summary;
SELECT SCHEMA_MADLIB.mlp_classification('mlp_1e6_1e2', 'mlp_out', 'x', 'y', ARRAY[50, 50], 'tolerance=0, n_iterations=10', 'sigmoid', NULL, FALSE, FALSE);
DROP TABLE IF EXISTS mlp_out, mlp_out_summary;
SELECT SCHEMA_MADLIB.mlp_classification('mlp_1e6_1e3', 'mlp_out', 'x', 'y', ARRAY[50, 50], 'tolerance=0, n_iterations=10', 'sigmoid', NULL, FALSE, FALSE);

-- Testing n_iterations
DROP TABLE IF EXISTS mlp_out, mlp_out_summary;
SELECT SCHEMA_MADLIB.mlp_classification('mlp_1e6_1e1', 'mlp_out', 'x', 'y', ARRAY[50, 50], 'tolerance=0, n_iterations=10', 'sigmoid', NULL, FALSE, FALSE);
DROP TABLE IF EXISTS mlp_out, mlp_out_summary;
SELECT SCHEMA_MADLIB.mlp_classification('mlp_1e6_1e1', 'mlp_out', 'x', 'y', ARRAY[50, 50], 'tolerance=0, n_iterations=100', 'sigmoid', NULL, FALSE, FALSE);
DROP TABLE IF EXISTS mlp_out, mlp_out_summary;
SELECT SCHEMA_MADLIB.mlp_classification('mlp_1e6_1e1', 'mlp_out', 'x', 'y', ARRAY[50, 50], 'tolerance=0, n_iterations=1000', 'sigmoid', NULL, FALSE, FALSE);
DROP TABLE IF EXISTS mlp_out, mlp_out_summary;
SELECT SCHEMA_MADLIB.mlp_classification('mlp_1e6_1e1', 'mlp_out', 'x', 'y', ARRAY[50, 50], 'tolerance=0, n_iterations=10000', 'sigmoid', NULL, FALSE, FALSE);
