DROP TABLE IF EXISTS iris_group, mlp_model, mlp_model_summary, mlp_model_standardization CASCADE;
CREATE TABLE iris_group(
    id         integer,
    attributes numeric[],
    class_text varchar,
    class      integer,
    g          integer
);

INSERT INTO iris_group VALUES
(1,ARRAY[5.1,3.5,1.4,0.2],'Iris-setosa',1,1),
(2,ARRAY[4.9,3.0,1.4,0.2],'Iris-setosa',1,1),
(3,ARRAY[4.7,3.2,1.3,0.2],'Iris-setosa',1,1),
(4,ARRAY[4.6,3.1,1.5,0.2],'Iris-setosa',1,1),
(5,ARRAY[5.0,3.6,1.4,0.2],'Iris-setosa',1,1),
(6,ARRAY[5.4,3.9,1.7,0.4],'Iris-setosa',1,1),
(7,ARRAY[4.6,3.4,1.4,0.3],'Iris-setosa',1,1),
(8,ARRAY[5.0,3.4,1.5,0.2],'Iris-setosa',1,1),
(9,ARRAY[4.4,2.9,1.4,0.2],'Iris-setosa',1,1),
(10,ARRAY[4.9,3.1,1.5,0.1],'Iris-setosa',1,2),
(11,ARRAY[5.4,3.7,1.5,0.2],'Iris-setosa',1,2),
(12,ARRAY[4.8,3.4,1.6,0.2],'Iris-setosa',1,2),
(13,ARRAY[4.8,3.0,1.4,0.1],'Iris-setosa',1,2),
(14,ARRAY[4.3,3.0,1.1,0.1],'Iris-setosa',1,2),
(15,ARRAY[5.8,4.0,1.2,0.2],'Iris-setosa',1,2),
(16,ARRAY[5.7,4.4,1.5,0.4],'Iris-setosa',1,2),
(17,ARRAY[5.4,3.9,1.3,0.4],'Iris-setosa',1,2),
(18,ARRAY[5.1,3.5,1.4,0.3],'Iris-setosa',1,2),
(19,ARRAY[5.7,3.8,1.7,0.3],'Iris-setosa',1,2),
(20,ARRAY[5.1,3.8,1.5,0.3],'Iris-setosa',1,2),
(21,ARRAY[5.4,3.4,1.7,0.2],'Iris-setosa',1,2),
(22,ARRAY[5.1,3.7,1.5,0.4],'Iris-setosa',1,2),
(23,ARRAY[4.6,3.6,1.0,0.2],'Iris-setosa',1,2),
(24,ARRAY[5.1,3.3,1.7,0.5],'Iris-setosa',1,2),
(25,ARRAY[4.8,3.4,1.9,0.2],'Iris-setosa',1,2),
(26,ARRAY[5.0,3.0,1.6,0.2],'Iris-setosa',1,2),
(27,ARRAY[5.0,3.4,1.6,0.4],'Iris-setosa',1,2),
(28,ARRAY[5.2,3.5,1.5,0.2],'Iris-setosa',1,2),
(29,ARRAY[5.2,3.4,1.4,0.2],'Iris-setosa',1,2),
(30,ARRAY[4.7,3.2,1.6,0.2],'Iris-setosa',1,2),
(31,ARRAY[4.8,3.1,1.6,0.2],'Iris-setosa',1,2),
(32,ARRAY[5.4,3.4,1.5,0.4],'Iris-setosa',1,2),
(33,ARRAY[5.2,4.1,1.5,0.1],'Iris-setosa',1,2),
(34,ARRAY[5.5,4.2,1.4,0.2],'Iris-setosa',1,2),
(35,ARRAY[4.9,3.1,1.5,0.1],'Iris-setosa',1,2),
(36,ARRAY[5.0,3.2,1.2,0.2],'Iris-setosa',1,2),
(37,ARRAY[5.5,3.5,1.3,0.2],'Iris-setosa',1,2),
(38,ARRAY[4.9,3.1,1.5,0.1],'Iris-setosa',1,2),
(39,ARRAY[4.4,3.0,1.3,0.2],'Iris-setosa',1,2),
(40,ARRAY[5.1,3.4,1.5,0.2],'Iris-setosa',1,2),
(41,ARRAY[5.0,3.5,1.3,0.3],'Iris-setosa',1,2),
(42,ARRAY[4.5,2.3,1.3,0.3],'Iris-setosa',1,2),
(43,ARRAY[4.4,3.2,1.3,0.2],'Iris-setosa',1,2),
(44,ARRAY[5.0,3.5,1.6,0.6],'Iris-setosa',1,2),
(45,ARRAY[5.1,3.8,1.9,0.4],'Iris-setosa',1,2),
(46,ARRAY[4.8,3.0,1.4,0.3],'Iris-setosa',1,2),
(47,ARRAY[5.1,3.8,1.6,0.2],'Iris-setosa',1,2),
(48,ARRAY[4.6,3.2,1.4,0.2],'Iris-setosa',1,2),
(49,ARRAY[5.3,3.7,1.5,0.2],'Iris-setosa',1,2),
(50,ARRAY[5.0,3.3,1.4,0.2],'Iris-setosa',1,2),
(51,ARRAY[7.0,3.2,4.7,1.4],'Iris-versicolor',2,1),
(52,ARRAY[6.4,3.2,4.5,1.5],'Iris-versicolor',2,1),
(53,ARRAY[6.9,3.1,4.9,1.5],'Iris-versicolor',2,1),
(54,ARRAY[5.5,2.3,4.0,1.3],'Iris-versicolor',2,1),
(55,ARRAY[6.5,2.8,4.6,1.5],'Iris-versicolor',2,1),
(56,ARRAY[5.7,2.8,4.5,1.3],'Iris-versicolor',2,1),
(57,ARRAY[6.3,3.3,4.7,1.6],'Iris-versicolor',2,1),
(58,ARRAY[4.9,2.4,3.3,1.0],'Iris-versicolor',2,1),
(59,ARRAY[6.6,2.9,4.6,1.3],'Iris-versicolor',2,1),
(60,ARRAY[5.2,2.7,3.9,1.4],'Iris-versicolor',2,1),
(61,ARRAY[5.0,2.0,3.5,1.0],'Iris-versicolor',2,1),
(62,ARRAY[5.9,3.0,4.2,1.5],'Iris-versicolor',2,1),
(63,ARRAY[6.0,2.2,4.0,1.0],'Iris-versicolor',2,1),
(64,ARRAY[6.1,2.9,4.7,1.4],'Iris-versicolor',2,2),
(65,ARRAY[5.6,2.9,3.6,1.3],'Iris-versicolor',2,2),
(66,ARRAY[6.7,3.1,4.4,1.4],'Iris-versicolor',2,2),
(67,ARRAY[5.6,3.0,4.5,1.5],'Iris-versicolor',2,2),
(68,ARRAY[5.8,2.7,4.1,1.0],'Iris-versicolor',2,2),
(69,ARRAY[6.2,2.2,4.5,1.5],'Iris-versicolor',2,2),
(70,ARRAY[5.6,2.5,3.9,1.1],'Iris-versicolor',2,2),
(71,ARRAY[5.9,3.2,4.8,1.8],'Iris-versicolor',2,2),
(72,ARRAY[6.1,2.8,4.0,1.3],'Iris-versicolor',2,2),
(73,ARRAY[6.3,2.5,4.9,1.5],'Iris-versicolor',2,2),
(74,ARRAY[6.1,2.8,4.7,1.2],'Iris-versicolor',2,2),
(75,ARRAY[6.4,2.9,4.3,1.3],'Iris-versicolor',2,2),
(76,ARRAY[6.6,3.0,4.4,1.4],'Iris-versicolor',2,2),
(77,ARRAY[6.8,2.8,4.8,1.4],'Iris-versicolor',2,2),
(78,ARRAY[6.7,3.0,5.0,1.7],'Iris-versicolor',2,2),
(79,ARRAY[6.0,2.9,4.5,1.5],'Iris-versicolor',2,2),
(80,ARRAY[5.7,2.6,3.5,1.0],'Iris-versicolor',2,2),
(81,ARRAY[5.5,2.4,3.8,1.1],'Iris-versicolor',2,2),
(82,ARRAY[5.5,2.4,3.7,1.0],'Iris-versicolor',2,2),
(83,ARRAY[5.8,2.7,3.9,1.2],'Iris-versicolor',2,2),
(84,ARRAY[6.0,2.7,5.1,1.6],'Iris-versicolor',2,2),
(85,ARRAY[5.4,3.0,4.5,1.5],'Iris-versicolor',2,2),
(86,ARRAY[6.0,3.4,4.5,1.6],'Iris-versicolor',2,2),
(87,ARRAY[6.7,3.1,4.7,1.5],'Iris-versicolor',2,2),
(88,ARRAY[6.3,2.3,4.4,1.3],'Iris-versicolor',2,2),
(89,ARRAY[5.6,3.0,4.1,1.3],'Iris-versicolor',2,2),
(90,ARRAY[5.5,2.5,4.0,1.3],'Iris-versicolor',2,2),
(91,ARRAY[5.5,2.6,4.4,1.2],'Iris-versicolor',2,2),
(92,ARRAY[6.1,3.0,4.6,1.4],'Iris-versicolor',2,2),
(93,ARRAY[5.8,2.6,4.0,1.2],'Iris-versicolor',2,2),
(94,ARRAY[5.0,2.3,3.3,1.0],'Iris-versicolor',2,2),
(95,ARRAY[5.6,2.7,4.2,1.3],'Iris-versicolor',2,2),
(96,ARRAY[5.7,3.0,4.2,1.2],'Iris-versicolor',2,2),
(97,ARRAY[5.7,2.9,4.2,1.3],'Iris-versicolor',2,2),
(98,ARRAY[6.2,2.9,4.3,1.3],'Iris-versicolor',2,2),
(99,ARRAY[5.1,2.5,3.0,1.1],'Iris-versicolor',2,2),
(100,ARRAY[5.7,2.8,4.1,1.3],'Iris-versicolor',2,2),
(101,ARRAY[6.3,3.3,6.0,2.5],'Iris-virginica',3,1),
(102,ARRAY[5.8,2.7,5.1,1.9],'Iris-virginica',3,1),
(103,ARRAY[7.1,3.0,5.9,2.1],'Iris-virginica',3,1),
(104,ARRAY[6.3,2.9,5.6,1.8],'Iris-virginica',3,1),
(105,ARRAY[6.5,3.0,5.8,2.2],'Iris-virginica',3,1),
(106,ARRAY[7.6,3.0,6.6,2.1],'Iris-virginica',3,1),
(107,ARRAY[4.9,2.5,4.5,1.7],'Iris-virginica',3,1),
(108,ARRAY[7.3,2.9,6.3,1.8],'Iris-virginica',3,1),
(109,ARRAY[6.7,2.5,5.8,1.8],'Iris-virginica',3,1),
(110,ARRAY[7.2,3.6,6.1,2.5],'Iris-virginica',3,1),
(111,ARRAY[6.5,3.2,5.1,2.0],'Iris-virginica',3,1),
(112,ARRAY[6.4,2.7,5.3,1.9],'Iris-virginica',3,1),
(113,ARRAY[6.8,3.0,5.5,2.1],'Iris-virginica',3,1),
(114,ARRAY[5.7,2.5,5.0,2.0],'Iris-virginica',3,1),
(115,ARRAY[5.8,2.8,5.1,2.4],'Iris-virginica',3,1),
(116,ARRAY[6.4,3.2,5.3,2.3],'Iris-virginica',3,1),
(117,ARRAY[6.5,3.0,5.5,1.8],'Iris-virginica',3,2),
(118,ARRAY[7.7,3.8,6.7,2.2],'Iris-virginica',3,2),
(119,ARRAY[7.7,2.6,6.9,2.3],'Iris-virginica',3,2),
(120,ARRAY[6.0,2.2,5.0,1.5],'Iris-virginica',3,2),
(121,ARRAY[6.9,3.2,5.7,2.3],'Iris-virginica',3,2),
(122,ARRAY[5.6,2.8,4.9,2.0],'Iris-virginica',3,2),
(123,ARRAY[7.7,2.8,6.7,2.0],'Iris-virginica',3,2),
(124,ARRAY[6.3,2.7,4.9,1.8],'Iris-virginica',3,2),
(125,ARRAY[6.7,3.3,5.7,2.1],'Iris-virginica',3,2),
(126,ARRAY[7.2,3.2,6.0,1.8],'Iris-virginica',3,2),
(127,ARRAY[6.2,2.8,4.8,1.8],'Iris-virginica',3,2),
(128,ARRAY[6.1,3.0,4.9,1.8],'Iris-virginica',3,2),
(129,ARRAY[6.4,2.8,5.6,2.1],'Iris-virginica',3,2),
(130,ARRAY[7.2,3.0,5.8,1.6],'Iris-virginica',3,2),
(131,ARRAY[7.4,2.8,6.1,1.9],'Iris-virginica',3,2),
(132,ARRAY[7.9,3.8,6.4,2.0],'Iris-virginica',3,2),
(133,ARRAY[6.4,2.8,5.6,2.2],'Iris-virginica',3,2),
(134,ARRAY[6.3,2.8,5.1,1.5],'Iris-virginica',3,2),
(135,ARRAY[6.1,2.6,5.6,1.4],'Iris-virginica',3,2),
(136,ARRAY[7.7,3.0,6.1,2.3],'Iris-virginica',3,2),
(137,ARRAY[6.3,3.4,5.6,2.4],'Iris-virginica',3,2),
(138,ARRAY[6.4,3.1,5.5,1.8],'Iris-virginica',3,2),
(139,ARRAY[6.0,3.0,4.8,1.8],'Iris-virginica',3,2),
(140,ARRAY[6.9,3.1,5.4,2.1],'Iris-virginica',3,2),
(141,ARRAY[6.7,3.1,5.6,2.4],'Iris-virginica',3,2),
(142,ARRAY[6.9,3.1,5.1,2.3],'Iris-virginica',3,2),
(143,ARRAY[5.8,2.7,5.1,1.9],'Iris-virginica',3,2),
(144,ARRAY[6.8,3.2,5.9,2.3],'Iris-virginica',3,2),
(145,ARRAY[6.7,3.3,5.7,2.5],'Iris-virginica',3,2),
(146,ARRAY[6.7,3.0,5.2,2.3],'Iris-virginica',3,2),
(147,ARRAY[6.3,2.5,5.0,1.9],'Iris-virginica',3,2),
(148,ARRAY[6.5,3.0,5.2,2.0],'Iris-virginica',3,2),
(149,ARRAY[6.2,3.4,5.4,2.3],'Iris-virginica',3,2),
(150,ARRAY[5.9,3.0,5.1,1.8],'Iris-virginica',3,2);

SELECT madlib.mlp_classification(
    'iris_group',      -- Source table
    'mlp_model',      -- Destination table
    'attributes',     -- Input features
    'class_text',     -- Label
    ARRAY[10],         -- Number of units per layer
    'learning_rate_init=0.003,
    n_iterations=2000, n_tries=2,
    tolerance=0',     -- Optimizer params
    'tanh',
    NULL,
    FALSE,
    FALSE,
    'g'
);

DROP TABLE IF EXISTS mlp_g1, mlp_g1_summary, mlp_g1_standardization CASCADE;
DROP TABLE IF EXISTS mlp_g2, mlp_g2_summary, mlp_g2_standardization CASCADE;
SELECT madlib.mlp_classification(
    'iris_g1',      -- Source table
    'mlp_g1',      -- Destination table
    'attributes',     -- Input features
    'class_text',     -- Label
    ARRAY[10],         -- Number of units per layer
    'learning_rate_init=0.003,
    n_iterations=2000, n_tries=2,
    tolerance=0',     -- Optimizer params
    'tanh',
    NULL,
    FALSE,
    FALSE
);
SELECT madlib.mlp_classification(
    'iris_g2',      -- Source table
    'mlp_g2',      -- Destination table
    'attributes',     -- Input features
    'class_text',     -- Label
    ARRAY[10],         -- Number of units per layer
    'learning_rate_init=0.003,
    n_iterations=2000, n_tries=2,
    tolerance=0',     -- Optimizer params
    'tanh',
    NULL,
    FALSE,
    FALSE
);

-- SELECT * FROM mlp_model;
-- SELECT * FROM mlp_model_summary;
-- SELECT * FROM mlp_model_standardization;

DROP TABLE IF EXISTS mlp_prediction_output;
DROP TABLE IF EXISTS mlp_prediction_g1;
DROP TABLE IF EXISTS mlp_prediction_g2;
-- See prediction accuracy for training data
SELECT madlib.mlp_predict(
    'mlp_g1',
    'iris_g1',
    'id',
    'mlp_prediction_g1',
    'response');
SELECT madlib.mlp_predict(
    'mlp_g2',
    'iris_g2',
    'id',
    'mlp_prediction_g2',
    'response');
SELECT madlib.mlp_predict(
    'mlp_model',
    'iris_group',
    'id',
    'mlp_prediction_output',
    'response');
-- select * from mlp_prediction_output;

SELECT COUNT(*)/38.0
FROM
(SELECT iris_g1.class_text AS actual, mlp_prediction_g1.estimated_class_text as estimated
FROM mlp_prediction_g1 INNER JOIN iris_g1 ON
iris_g1.id=mlp_prediction_g1.id) q
WHERE q.actual=q.estimated;
SELECT COUNT(*)/(150.0-38)
FROM
(SELECT iris_g2.class_text AS actual, mlp_prediction_g2.estimated_class_text as estimated
FROM mlp_prediction_g2 INNER JOIN iris_g2 ON
iris_g2.id=mlp_prediction_g2.id) q
WHERE q.actual=q.estimated;

SELECT COUNT(*)/38.0
FROM
(SELECT iris_group.class_text AS actual, mlp_prediction_output.estimated_class_text as estimated
FROM mlp_prediction_output INNER JOIN iris_group ON
iris_group.id=mlp_prediction_output.id WHERE iris_group.g=1) q
WHERE q.actual=q.estimated;
SELECT COUNT(*)/(150.0-38)
FROM
(SELECT iris_group.class_text AS actual, mlp_prediction_output.estimated_class_text as estimated
FROM mlp_prediction_output INNER JOIN iris_group ON
iris_group.id=mlp_prediction_output.id where iris_group.g=2) q
WHERE q.actual=q.estimated;
