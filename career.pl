careerguide :-
	expert_system,
	reset_system,
	choose_career(Career),
	explain(Career), nl.
careerguide :-
	write('Can\'t find a career for you. Sorry! :('), nl.

expert_system :-
	write('IS Mini Project - Course Recommendation System'), nl, nl.
    write('I\'ll help you find the best career for you!'), nl,
	write('For each question, enter your choice followed by a dot'), nl, nl.

choose_career(Career) :-
	career(Career), !.
    
:- dynamic(answered/2).

reset_system :-
	retractall(answered(_,_)).
reset_system.

% main logic pattern matching

career(medicine) :-
	favourite_subject(biology),
	(
		satisfaction(safe_and_protect);
		satisfaction(strong_active); 
		best_part(help_people);
		(
			\+ presentation(sleeping),
			\+ schedule(freedom)
		);
		\+ desire(fame);
		incharge(no)
	).

career(writer) :-
	(
		work_environment(_),
		people_opinion(_),
		satisfaction(_),
		favourite_subject(literature),
		(
			\+ desire(job_security);
			jealous(be_creative);
			presentation(speech_writer);
			\+ schedule(full_week);
			people_opinion(creative)
		)
	);
	(
		(
			schedule(flexible);
			schedule(freedom)
		),
		presentation(speech_writer)
	);
	(
		(
			people_opinion(creative);
			jealous(be_creative)
		), 
		(
			favourite_subject(literature); 
			presentation(speech_writer)
		)
	);
	(
		presentation(speech_writer),
		(
			\+ desire(job_security);
			jealous(be_creative);
			favourite_subject(literature);
			\+ schedule(full_week);
			people_opinion(creative)
		)
	).

career(engineering) :-
	(
		(
			favourite_subject(computer);
			favourite_subject(math)
		),
		(
			(
				\+ people_opinion(creative),
				\+ desire(fame)
			);
			(
				\+ people_opinion(negotiator),
				\+ desire(fame)
			);
			(
				\+ jealous(be_in_charge),
				\+ work_environment(physically_active)
			)
		)
	);
	(
		desire(job_security),
		(
			jealous(difference);
			jealous(be_social)
		),
		\+ people_opinion(creative),
		\+ people_opinion(negotiator)
	).


career(artist) :-
	(
		favourite_subject(art),
		(
			(
				\+ work_environment(office),
				\+ desire(job_security)
			);
			(
				(
					\+ work_environment(office);
					\+ desire(job_security);
					jealous(be_social);
					jealous(be_creative)
				),
				(
					people_opinion(outgoing);
					people_opinion(creative);
					people_opinion(detail_oriented)
				)
			);
			(
				(
					dreams_true(of_course);
					dreams_true(maybe)
				),
				desire(job_satisfaction)
			);
			people_opinion(creative)
		)
	);
	(
		desire(job_satisfaction),
		people_opinion(creative),
		(
			\+ work_environment(office);
			jealous(be_creative);
			presentation(podium)
		)
	).

career(sportsperson) :-
	(
		favourite_subject(pt),
		(
			work_environment(physically_active);
			satisfaction(strong_active);
			(
				(
					desire(fame);
					desire(paycheck);
					jealous(be_social)
				),
				(
					\+ dreams_true(hope);
					schedule(flexible);
					schedule(freedom)
				)
			)
		)
	);
	(
		(
			satisfaction(strong_active);
			work_environment(physically_active)
		),
		(
			(
				\+ desire(job_security);
				jealous(be_social)
			),
			(
				dreams_true(of_course);
				dreams_true(maybe);
				work_environment(different_places);
				\+ best_part(help_people)
			)
		)
	);
	(
		work_environment(physically_active),
		satisfaction(strong_active)
	).

career(teacher) :-
	(
		\+ favourite_subject(pt),
		\+ desire(paycheck),
		\+ desire(fame),
		schedule(full_week)
	);
	(
		jealous(difference),
		\+ presentation(podium),
		\+ presentation(sleeping),
		\+ work_environment(different_places),
		incharge(no)
	);
	(
		(
			desire(job_security);
			desire(balance)
		),
		(
			(
				(
					jealous(difference);
					best_part(help_people)
				),
				(
					\+ work_environment(different_places);
					\+ schedule(freedom)
				)
			);
			(
				incharge(no),
				(
					satisfaction(learn_something);
					satisfaction(information)
				)
			)
		)
	).

career(researcher) :-
	(
		favourite_subject(math);
		favourite_subject(biology)
	),
	(
		satisfaction(information);
		(
			best_part(learn_something),
			(
				desire(job_satisfaction);
				people_opinion(detail_oriented);
				people_opinion(perfectionist)
			)
		)
	).

career(business) :-
	(
		(
			people_opinion(negotiator);
			satisfaction(leading);
			satisfaction(negotiation);
			jealous(be_in_charge)
		),
		(
			incharge(yes);
			favourite_subject(economics)
		)
	);
	(
		people_opinion(negotiator),
		(
			satisfaction(leading);
			satisfaction(negotiator);
			jealous(be_in_charge)
		)
	);
	(
		(
			satisfaction(leading);
			satisfaction(negotiator)
		),
		jealous(be_in_charge)
	).

% explanations of various fields

explain(engineering) :-
	write('Engineering'), nl,

explain(medicine) :-
	write('Medicine'), nl,

explain(writer) :-
	write('Writer'), nl,

explain(artist) :-
	write('Artist'), nl,

explain(sportsperson) :-
	write('Sportsperson'), nl,

explain(teacher) :-
	write('Teacher/Professor'), nl,
	
explain(business) :-
	write('Business and Management'), nl,
	
explain(researcher) :-
	write('Researcher'), nl,
	
% various questions
question(incharge) :-
	write('Do you want to be incharge of others?'), nl.

question(satisfaction) :-
	write('Which of these would give you the greatest satisfaction?'), nl.

question(people_opinion) :-
	write('What do most people say about you?'), nl.

question(work_environment) :-
	write('Which of these work environments sounds most appealing to you?'), nl.

question(favourite_subject) :-
	write('What was your favourite subject in school?'), nl.

question(desire) :-
	write('Which of these do you want out of a career?'), nl.

question(jealous) :-
	write('You are jealous of your friend\'s career because he gets to:'), nl.

question(schedule) :-
	write('What kind of schedule do you want in your career?'), nl.

question(presentation) :-
	write('Suppose it\'s presentation time. You\'re the one who:'), nl.

question(best_part) :-
	write('Best part of your very first job?'), nl.

question(dreams_true) :-
	write('Optimism- Do dreams come true?'), nl.

% options
option(yes) :-
	write('Yes').
option(no) :-
	write('No').

option(safe_and_protect) :-
	write('Knowing others were safe and protected because of my work').
option(impact) :-
	write('Creating something that had an impact on someone').
option(negotiation) :-
	write('Successfully closing a difficult negotiation').
option(strong_active) :-
	write('Feeling strong and active').
option(managing_complex) :-
	write('Managing complex tasks with ease and organisation').
option(information) :-
	write('Knowing cutting edge information that most people don\'t').
option(leading) :-
	write('Leading a team of people').


option(detail_oriented) :-
	write('Detail oriented').
option(professional) :-
	write('Professional').
option(outgoing) :-
	write('Outgoing').
option(perfectionist) :-
	write('Perfectionist').
option(creative) :-
	write('Creative').
option(negotiator) :-
	write('Great negotiator').


option(outside) :-
	write('I\'d like to be outside, interacting with different people').
option(home) :-
	write('I\'d like to work from home').
option(different_places) :-
	write('I\'d like to travel to different places as a part of my job').
option(office) :-
	write('I\'d like to work with a lot of people in a fun and unorthodox office').
option(physically_active) :-
	write('Something physically active, I can\'t be cooped up all day').


option(history) :-
	write('History/Social Studies').
option(literature) :-
	write('English literature').
option(economics) :-
	write('Economics').
option(art) :-
	write('Art').
option(pt) :-
	write('Play Time or Recess').
option(biology) :-
	write('Biology').
option(math) :-
	write('Mathematics/Physics').
option(computer) :-
	write('Computer Science').


option(paycheck) :-
	write('A big paycheck').
option(balance) :-
	write('Good work-life balance').
option(job_security) :-
	write('Job security').
option(job_satisfaction) :-
	write('Job satisfaction').
option(fame) :-
	write('Fame').


option(difference) :-
	write('Make a difference in people\'s everyday lives').
option(be_creative) :-
	write('Be creative, everyday').
option(be_social) :-
	write('Be very social').
option(be_in_charge) :-
	write('Be in charge and call the shots').


option(full_week) :-
	write('Put in the full week to work and have the weekend to myself').
option(freedom) :-
	write('Complete freedom to be flexible depending on my job\'s schedule').
option(flexible) :-
	write('I\'d like some set hours, but room to move that around if needed').


option(podium) :-
	write('is at the podium').
option(speech_writer) :-
	write('wrote the speech').
option(powerpoint) :-
	write('made the powerpoint').
option(taking_notes) :-
	write('is taking notes').
option(sleeping) :-
	write('is sleeping').


option(new_friends) :-
	write('Made new friends').
option(learn_something) :-
	write('Learning something new').
option(make_cash) :-
	write('Making some cash').
option(get_things_done) :-
	write('Getting things done').
option(help_people) :-
	write('Helping people out').


option(of_course) :-
	write('Of course! Anything is possible').
option(maybe) :-
	write('Maybe. Miracles can happen').
option(realistic) :-
	write('No, I\'m realistic').
option(hope) :-
	write('I\'m not sure, but I hope so!').

incharge(Answer) :-
	answered(incharge, Answer), !.
incharge(Answer) :-
	\+ answered(incharge, _),
	ask(incharge, Answer, [yes, no]).

satisfaction(Answer) :-
	answered(satisfaction, Answer), !.
satisfaction(Answer) :-
	\+ answered(satisfaction, _),
	ask(satisfaction, Answer, [safe_and_protect, impact, negotiation, strong_active, managing_complex, information, leading]).

people_opinion(Answer) :-
	answered(people_opinion, Answer), !.
people_opinion(Answer) :-
	\+ answered(people_opinion, _),
	ask(people_opinion, Answer, [detail_oriented, professional, outgoing, perfectionist, creative, negotiator]).

work_environment(Answer) :-
	answered(work_environment, Answer), !.
work_environment(Answer) :-
	\+ answered(work_environment, _),
	ask(work_environment, Answer, [outside, home, different_places, office, physically_active]).

favourite_subject(Answer) :-
	answered(favourite_subject, Answer), !.
favourite_subject(Answer) :-
	\+ answered(favourite_subject, _),
	ask(favourite_subject, Answer, [history, literature, economics, art, pt, biology, math, computer]).

desire(Answer) :-
	answered(desire, Answer), !.
desire(Answer) :-
	\+ answered(desire, _),
	ask(desire, Answer, [paycheck, balance, job_security, job_satisfaction, fame]).

jealous(Answer) :-
	answered(jealous, Answer), !.
jealous(Answer) :-
	\+ answered(jealous, _),
	ask(jealous, Answer, [difference, be_creative, be_social, be_in_charge]).

schedule(Answer) :-
	answered(schedule, Answer), !.
schedule(Answer) :-
	\+ answered(schedule, _),
	ask(schedule, Answer, [full_week, freedom, flexible]).

presentation(Answer) :-
	answered(presentation, Answer), !.
presentation(Answer) :-
	\+ answered(presentation, _),
	ask(presentation, Answer, [podium, speech_writer, powerpoint, taking_notes, sleeping]).

best_part(Answer) :-
	answered(best_part, Answer), !.
best_part(Answer) :-
	\+ answered(best_part, _),
	ask(best_part, Answer, [new_friends, learn_something, make_cash, get_things_done, help_people]).

dreams_true(Answer) :-
	answered(dreams_true, Answer), !.
dreams_true(Answer) :-
	\+ answered(dreams_true, _),
	ask(dreams_true, Answer, [of_course, maybe, realistic, hope]).

% loop: asking questions
ask(Question, Answer, Options) :-
	question(Question),
	generate_options(Options, 1),
	read(Index),
	find_option(Index, Options, Selection),
	asserta(answered(Question, Selection)),
	Selection = Answer.

find_option(1, [Head|_] , Head).
find_option(Index, [_|Tail], Result) :-
	Nextindex is Index -1,
	find_option(Nextindex, Tail, Result).

generate_options([],_).
generate_options([Head|Tail], Index) :-
	write(Index), write(' '),
	option(Head), nl,
	Nextindex is Index +1,
	generate_options(Tail, Nextindex).