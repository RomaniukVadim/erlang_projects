test: clean
	erlc *.erl
	erl -s test run

clean:
	-rm *.beam

test_1: clean
	erlc test.erl champ.erl champ_stat.erl
	erl -s test run champ_stat test

test_2: clean
	erlc test.erl champ.erl champ_filter.erl
	erl -s test run champ_filter test

test_3: clean
	erlc test.erl champ.erl champ_pairs.erl
	erl -s test run champ_pairs test
