return {
	s({trig="date"}, p(os.date, '%Y-%m-%d')),
	s({trig="datetime"}, p(os.date, '%Y-%m-%dT%H:%M:%S'))
}
