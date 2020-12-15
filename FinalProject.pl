/*
Project: String Tokenizer using GNU Prolog
Name: Mingwei Sui
*/

tokenizer :-
	write('Enter a String: '),
	read(Str),
	write('Split by char(s): '),
	read(Cond),

	name(Str, Str_list_tmp), /*Modify String to String List in ASCII*/
	length(Str_list_tmp, Str_len),	/*Get String length*/
	append(Str_list_tmp,[32],Str_list),	/*Append a char for later uses, it can be any char*/

	name(Cond, Condition_tmp), /*Modify Condition char to a char that in list in ASCII*/
	length(Condition_tmp, Con_len),	/*Get Condition length*/
	append(Condition_tmp,[32],Condition),/*Append a char for later uses, it can be any char*/

	tokenizer(Str_list, Condition, [], [], Str_len, Con_len).

head([H|_], H).

tokenizer([H_str|T_str], Condition_, Current_token, Result_list, Str_len, Con_len) :-
	
	(
		Str_len == 0	/*Check if finish process every char in String*/
		/*if finish, then append last token to final result, and print result*/
		-> 	append(Result_list,[Current_token],New_result_list),
			print_result(New_result_list)
		/*if not finish*/
		;	is_condition(H_str, T_str, Condition_, Condition_, Current_token, Result_list, Str_len, Con_len, Con_len)
	).

is_condition(H_str, T_str, [H|T], Condi, Current_token, Result_list, Str_len, Con_len_tmp, Con_len) :-
	(	
		/*Check all possiable condition*/
		Con_len_tmp == 0
		/*if pass all condition, then append curent char to current token*/
		->	append(Current_token, [H_str], New_current_token),
			New_str_len is Str_len - 1,
			tokenizer(T_str, Condi, New_current_token, Result_list, New_str_len, Con_len)
		;	H_str \= H 	/*Check current char if is NOT the condition */
			/*if true, check next condition */
			-> 	New_Con_len_tmp is Con_len_tmp - 1,
				is_condition(H_str, T_str, T, Condi, Current_token, Result_list, Str_len, New_Con_len_tmp, Con_len)
			; 	Current_token \= []	/*if false, mean current char is a condition, check if current_token is empty*/
				/*if not empty, then append current list to final result*/
				->	append(Result_list,[Current_token],New_result_list),
					New_str_len is Str_len - 1,
					tokenizer(T_str, Condi, [], New_result_list, New_str_len, Con_len)
					/*if empty, then goto next char*/
				;	New_str_len is Str_len - 1,
					tokenizer(T_str, Condi, [], Result_list, New_str_len, Con_len)
	).

print_result([H|T]) :-
	name(X,H),	/*Modify tokens from ASCII to String*/
	write(X),nl,	/*Print*/
	print_result(T).	/*Go to next token*/

print_result([]).	/*End Printing*/
